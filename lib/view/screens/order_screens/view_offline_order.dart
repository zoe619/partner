import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:order_tracker/model/single_offline_order_model.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/services/order_tracking_services.dart';
import 'package:order_tracker/networking/core/services/orders_service.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class ViewOfflineOrder extends StatefulWidget {
  final String orderId,
      itemName,
      itemPrice,
      discount,
      status,
      deliveryFee,
      deliveryDate,
      customerName,
      orderAddress,
      customerImage,
      orderDescription,
      orderState;

  final bool isAudioOrder, isDelivery;
  const ViewOfflineOrder(
      {Key key,
      this.orderState,
      this.orderId,
      this.itemName,
      this.orderAddress,
      this.orderDescription,
      this.itemPrice,
      this.discount,
      this.status,
      this.deliveryDate,
      this.customerName,
      this.customerImage,
      this.isAudioOrder,
      this.isDelivery,
      this.deliveryFee})
      : super(key: key);

  @override
  _ViewOfflineOrderState createState() => _ViewOfflineOrderState();
}

class _ViewOfflineOrderState extends State<ViewOfflineOrder> {
  OrderService _orderService = Get.put(OrderService());

  var total = 0.0;
  Future<SingleOfflineOrderItemModel> _future;
  GoogleMapController mapController;
  double CAMERA_ZOOM = 16;
  double CAMERA_TILT = 80;
  double CAMERA_BEARING = 30;
  LatLng SOURCE_LOCATION; // = LatLng(42.747932,-71.167889);
  LatLng DEST_LOCATION; // = LatLng(37.335685,-122.0605916);
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  // for my drawn routes on the map
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;
  String googleAPIKey = Api.$PLACES_APIKEY;
  // for my custom marker pins
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  // the user's initial location and current location
  // as it moves
  LocationData currentLocation;
  // a reference to the destination location
  LocationData destinationLocation;
  // wrapper around the location API
  Location location;

  // SocketUtil _socketUtil;
  String orderStatus;
  //WebSocketChannel channel;
  int orderId;
  String resturantUrl;
  // ignore: unused_field
  final LatLng _center = LatLng(59.436962, 24.753574);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void orderListener(String status) {
    print('Adding message');
    setState(() {
      orderStatus = status;
    });
  }

  void connectListener(bool connected) {
    setState(() {
      // ignore: unnecessary_statements
      connected ? print('Socket Connected') : null;
    });
  }

  @override
  void initState() {
    super.initState();
    _future = _orderService.getSingleOfflineRestaurantOrders(
        restaurantLoad.data.seoUrl, widget.orderId);

    var s = OrderTrackingService().initPusher(
        APPKEY: Api.$PUSHER_APIKEY,
        HOST: 'socket.travtubes.com',
        PORT: 443,
        ORDER_ID: widget.orderId);
    if (s.isBlank) {
      print('s.isBlank');
    } else {
      print('! s.isBlank');
    }
    // create an instance of Location
    location = new Location();
    polylinePoints = PolylinePoints();

    // subscribe to changes in the user's location
    // by "listening" to the location's onLocationChanged event
    location.onLocationChanged().listen((LocationData cLoc) {
      // cLoc contains the lat and long of the
      // current user's position in real time,
      // so we're holding on to it
      currentLocation = cLoc;
    });
    // set custom marker pins
    setSourceAndDestinationIcons();
    // set the initial location
    //setInitialLocation(locate: LatLng(currentLocation.latitude, currentLocation.longitude));
  }

  void showPinsOnMap(LatLng destinationLocation, LatLng courier,
      {String restaurant}) {
    // get a LatLng for the source location
    // from the LocationData currentLocation object
    var pinPosition = LatLng(courier.latitude, courier.longitude);
    // get a LatLng out of the LocationData object
    var destPosition =
        LatLng(destinationLocation.latitude, destinationLocation.longitude);
    // add the initial source location pin
    _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        infoWindow: InfoWindow(title: restaurant ?? 'Restaurant'),
        position: pinPosition,
        icon: sourceIcon));
    // destination pin
    _markers.add(Marker(
        markerId: MarkerId('destPin'),
        //infoWindow: InfoWindow(title: 'Destination'),
        position: destPosition,
        icon: destinationIcon));
    _markers.add(Marker(
        markerId: MarkerId('courierPin'),
        infoWindow: InfoWindow(title: 'Courier'),
        position: pinPosition,
        icon: sourceIcon));
    // set the route lines on the map from source to destination
    // for more info follow this tutorial
    setPolylines(
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude),
        PointLatLng(courier.latitude, courier.longitude));
    updateCameraLocation(destinationLocation, courier);
  }

  Future<void> updateCameraLocation(
    LatLng source,
    LatLng destination,
  ) async {
    //if (mapController == null) return;
    final GoogleMapController mapController = await _controller.future;

    LatLngBounds bounds;

    if (source.latitude > destination.latitude &&
        source.longitude > destination.longitude) {
      bounds = LatLngBounds(southwest: destination, northeast: source);
    } else if (source.longitude > destination.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(source.latitude, destination.longitude),
          northeast: LatLng(destination.latitude, source.longitude));
    } else if (source.latitude > destination.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(destination.latitude, source.longitude),
          northeast: LatLng(source.latitude, destination.longitude));
    } else {
      bounds = LatLngBounds(southwest: source, northeast: destination);
    }

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 70);

    return checkCameraLocation(cameraUpdate, mapController);
  }

  Future<void> checkCameraLocation(
      CameraUpdate cameraUpdate, GoogleMapController mapController) async {
    mapController.animateCamera(cameraUpdate);
    LatLngBounds l1 = await mapController.getVisibleRegion();
    LatLngBounds l2 = await mapController.getVisibleRegion();

    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
      return checkCameraLocation(cameraUpdate, mapController);
    }
  }

  void setPolylines(
      PointLatLng destinationLocation, PointLatLng courier) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPIKey, courier, destinationLocation);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        _polylines.add(Polyline(
            width: 5, // set the width of the polylines
            polylineId: PolylineId("poly"),
            color: Color.fromARGB(255, 40, 122, 198),
            points: polylineCoordinates));
      });
    }
  }

  void updatePinOnMap(LatLng courier) async {
    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
    CameraPosition cPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: LatLng(courier.latitude, courier.longitude),
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    // do this inside the setState() so Flutter gets notified
    // that a widget update is due
    setState(() {
      // updated position
      var pinPosition = LatLng(courier.latitude, courier.longitude);

      // the trick is to remove the marker (by id)
      // and add it again at the updated location
      _markers.removeWhere((m) => m.markerId.value == 'courierPin');
      _markers.add(Marker(
          markerId: MarkerId('courierPin'),
          infoWindow: InfoWindow(title: 'Courier'),
          position: pinPosition, // updated position
          icon: sourceIcon));
    });
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/driving_pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png');
  }

  void setInitialLocation({LatLng locate}) async {
    // set the initial location by pulling the user's
    // current location from the location's getLocation()
    //currentLocation = await location.getLocation();

    // hard-coded destination for this example
    destinationLocation = LocationData.fromMap(
        {"latitude": _center.latitude, "longitude": _center.longitude});
  }

  @override
  void dispose() {
    super.dispose();
    OrderTrackingService().disConnect(ORDER_ID: widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          "Order Details".tr,
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<SingleOfflineOrderItemModel>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var data = snapshot.data.data;
              print('data: $data');
              CameraPosition initialCameraPosition = CameraPosition(
                zoom: CAMERA_ZOOM,
                target: LatLng(
                  double.parse(data.orderDetail.lat.toString() ??
                      data.bookingable.lat.toString()),
                  double.parse(data.orderDetail.lat.toString() ??
                      data.bookingable.lng.toString()),
                ),
              );
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: GoogleMap(
                        gestureRecognizers: Set()
                          ..add(Factory<PanGestureRecognizer>(
                              () => PanGestureRecognizer()))
                          ..add(
                            Factory<VerticalDragGestureRecognizer>(
                              () => VerticalDragGestureRecognizer(),
                            ),
                          )
                          ..add(
                            Factory<HorizontalDragGestureRecognizer>(
                                () => HorizontalDragGestureRecognizer()),
                          )
                          ..add(
                            Factory<ScaleGestureRecognizer>(
                                () => ScaleGestureRecognizer()),
                          ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                          // my map has completed being created;
                          // i'm ready to show the pins on the map
                          showPinsOnMap(
                            LatLng(
                                double.parse(
                                    snapshot.data.data.orderDetail.lat),
                                double.parse(
                                    snapshot.data.data.orderDetail.lng)),
                            LatLng(snapshot.data.data.bookingable.lat,
                                snapshot.data.data.bookingable.lng),
                            restaurant: snapshot.data.data.bookingable.name,
                          );
                        },
                        initialCameraPosition: initialCameraPosition,
                        markers: _markers,
                        polylines: _polylines,
                        myLocationEnabled: true,
                        compassEnabled: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          YMargin(30),
                          // StreamBuilder(
                          //   stream: courierOrderResponse.stream,
                          //   builder: (context, AsyncSnapshot snap) {
                          //     var data = snap.data;
                          //     print('data: $data');
                          //     if (snap.data == null) {
                          //       return Container();
                          //     } else {
                          //       // updatePinOnMap(LatLng(double.parse(data['lat']),
                          //       //     double.parse(data['lng'])));
                          //       return Obx(
                          //         () => Column(
                          //           children: [
                          //             Text("${data['lat']}"),
                          //           ],
                          //         ),
                          //       );
                          //     }
                          //   },
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order # ".tr + widget.orderId,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      YMargin(30),
                                      Text(
                                        "Date:".tr,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                        ),
                                      ),
                                      XMargin(5),
                                      Text(
                                        widget.deliveryDate,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              data.courierOrder == null
                                  ? Container()
                                  : (data.courierOrder == null
                                      ? Container()
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  data.courierOrder
                                                              .paymentMode ==
                                                          "cash".tr
                                                      ? Icons.money
                                                      : Icons.credit_card,
                                                  color: Colors.green,
                                                ),
                                                XMargin(5),
                                                Text(
                                                  "${data.courierOrder.paymentMode ?? "cash".tr}",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                            ],
                          ),
                          YMargin(20),
                          widget.isAudioOrder == true
                              ? Container()
                              : Container(
                                  width: double.maxFinite,
                                  height: 40,
                                  color: grey.shade200,
                                  child: Center(
                                    child: Text(
                                      "ORDER SUMMARY".tr,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                          YMargin(20),
                          widget.isAudioOrder == true
                              ? Container()
                              : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      child: Center(
                                        child: Text(
                                          "#" + widget.orderId,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      radius: 24,
                                    ),
                                    XMargin(5),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.itemName,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          widget.orderDescription ?? "",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      "$restCurrency" +
                                          double.parse(widget.itemPrice.toString())
                                              .toStringAsFixed(2),
                                      style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                          YMargin(20),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Item Total".tr,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "$restCurrency " +
                                    double.parse(data.total.toString())
                                        .toStringAsFixed(2),
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          YMargin(5),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Discount".tr,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "$restCurrency " + "${data.discount ?? "0.00"}",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          YMargin(5),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Delivery Fee".tr,
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "$restCurrency " +
                                    "${double.parse(data.courierFee.toString()).toStringAsFixed(2) ?? "0.00"}",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          YMargin(5),
                          widget.isDelivery == true ? YMargin(10) : YMargin(5),
                          Container(
                            width: double.maxFinite,
                            height: 40,
                            color: grey.shade200,
                            child: Center(
                              child: Text(
                                "CUSTOMER DETAILS".tr,
                                style: GoogleFonts.montserrat(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          YMargin(20),
                          widget.isDelivery == false
                              ? Text("Take-away order".tr)
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                          child: Center(
                                            child: Text(
                                              "CU",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          radius: 24,
                                        ),
                                        XMargin(5),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${data.orderDetail.customerName ?? "Anonymous".tr}",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                "${data.orderDetail.address}",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 12),
                                                // overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    YMargin(20),
                                    GestureDetector(
                                      onTap: () => launch(
                                          "tel://${data.orderDetail.phoneNumber}"),
                                      child: Row(
                                        children: [
                                          Icon(Icons.phone),
                                          XMargin(10),
                                          Text(
                                            data.orderDetail.phoneNumber,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    YMargin(10),
                                  ],
                                ),
                          YMargin(50),
                          Container(
                            width: double.maxFinite,
                            height: 40,
                            color: grey.shade200,
                            child: Center(
                              child: Text(
                                "ORDER NOTE".tr,
                                style: GoogleFonts.montserrat(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          YMargin(20),
                          Text(
                            "Comment to restaurant".tr,
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "${data.orderDetail.comment ?? "No comment".tr}",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                            ),
                          ),
                          YMargin(10),
                          Text(
                            "Comment to courier".tr,
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "${data.orderDetail.commentToCourier ?? "No comment".tr}",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                            ),
                          ),
                          YMargin(50),
                          Container(
                            width: double.maxFinite,
                            height: 40,
                            color: grey.shade200,
                            child: Center(
                              child: Text(
                                "PAYMENT DETAILS".tr,
                                style: GoogleFonts.montserrat(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          YMargin(20),
                          Text(
                            "Collect courier fee from customer".tr,
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            data.orderDetail.collectPayment == 1
                                ? "Yes".tr
                                : "No".tr,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                            ),
                          ),
                          data.courierOrder == null
                              ? Container()
                              : (data.courierOrder == null
                                  ? SizedBox()
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        YMargin(10),
                                        Text(
                                          "Collect bill/check from customer".tr,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          data.courierOrder
                                                      .collectInvoiceAmount ==
                                                  1
                                              ? "Yes".tr
                                              : "No".tr,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                          ),
                                        ),
                                        YMargin(10),
                                      ],
                                    )),
                          // widget.isDelivery == true
                          //     ? Container(
                          //         width: double.maxFinite,
                          //         height: 40,
                          //         color: grey.shade200,
                          //         child: Center(
                          //           child: Text(
                          //             "COURIER DETAILS",
                          //             style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700),
                          //           ),
                          //         ),
                          //       )
                          //     : SizedBox.shrink(),
                          // widget.isDelivery == true ? YMargin(20) : SizedBox.shrink(),
                          // widget.isDelivery == true
                          //     ? Row(
                          //         children: [
                          //           Column(
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             children: [
                          //               Text(
                          //                 "Courier Name",
                          //                 style: GoogleFonts.montserrat(
                          //                   fontSize: 20,
                          //                 ),
                          //               ),
                          //               YMargin(10),
                          //               Row(
                          //                 mainAxisSize: MainAxisSize.min,
                          //                 children: [
                          //                   Text(
                          //                     "+125464456",
                          //                     style: GoogleFonts.montserrat(
                          //                       fontSize: 16,
                          //                     ),
                          //                   ),
                          //                   XMargin(5),
                          //                   IconButton(
                          //                       icon: RotatedBox(
                          //                         quarterTurns: 1,
                          //                         child: Icon(FontAwesomeIcons.phone),
                          //                       ),
                          //                       onPressed: () => launch("tel://125464456")),
                          //                   XMargin(5),
                          //                   IconButton(
                          //                       icon: Icon(FontAwesomeIcons.solidCommentAlt),
                          //                       onPressed: () => launch("sms:125464456"))
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //           Spacer(),
                          //           CircleAvatar(
                          //             radius: 30,
                          //             child: Center(
                          //               child: Text("CN"),
                          //             ),
                          //           ),
                          //         ],
                          //       )
                          //     : SizedBox.shrink(),
                          widget.isDelivery == true
                              ? YMargin(50)
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
