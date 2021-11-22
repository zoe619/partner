import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:order_tracker/model/calculated_route_model.dart';
import 'package:order_tracker/networking/core/services/offline_service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';
import 'package:order_tracker/view/screens/order_screens/offline_orders/offline_delivery.dart';

// import 'offline_delivery.dart';

class ConfirmOfflineOrder extends StatefulWidget {
  final CalculatedRouteModel calculatedRouteModel;
  final String customerAddress;
  final dynamic lat;
  final dynamic lng;
  const ConfirmOfflineOrder(
      {Key key, this.calculatedRouteModel, this.customerAddress, this.lat, this.lng})
      : super(key: key);

  @override
  _ConfirmOfflineOrderState createState() => _ConfirmOfflineOrderState();
}

class _ConfirmOfflineOrderState extends State<ConfirmOfflineOrder> {
  OfflineService offlineService = Get.put(OfflineService());

  Future<Position> _currentLocation;
  GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    _currentLocation = Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
    offlineService.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Offline Food Delivery".tr,
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height / 2.7,
                width: width,
                color: Colors.black,
                child: FutureBuilder(
                    future: _currentLocation,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          // The user location returned from the snapshot
                          Position snapshotData = snapshot.data;
                          LatLng _userLocation = LatLng(
                              restaurantLoad.data.lat ?? snapshotData.latitude,
                              restaurantLoad.data.lng ?? snapshotData.longitude);
                          return GoogleMap(
                            onMapCreated: (GoogleMapController controller) {
                              mapController = controller;
                            },
                            mapType: MapType.normal,
                            buildingsEnabled: true,
                            myLocationButtonEnabled: true,
                            myLocationEnabled: true,
                            initialCameraPosition: CameraPosition(
                              target: _userLocation,
                              zoom: 12,
                            ),
                          );
                        } else {
                          return Center(child: Text("Failed to get user location."));
                        }
                      }
                      // While the connection is not in the done state yet
                      return Center(child: CircularProgressIndicator());
                    }),
              ),
              const YMargin(5),
              Center(
                child: Container(
                  height: 5,
                  width: 50,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: height / 1.8,
                width: width,
                padding: const EdgeInsets.only(top: 10, right: 17, left: 17, bottom: 33),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YMargin(20),
                    Text(
                      "Customer Address".tr,
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    YMargin(5),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: "${widget.customerAddress}",
                        labelStyle: GoogleFonts.manrope(
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(121, 121, 121, 1),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    YMargin(20),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.space,
                        children: [
                          // Text(
                          //   "Distance".tr,
                          //   style: GoogleFonts.roboto(
                          //     color: Colors.black,
                          //     // fontWeight: FontWeight.bold,
                          //     fontSize: 16,
                          //   ),
                          // ),
                          Icon(Icons.directions_bike),
                          XMargin(20),
                          Text(
                            "${double.parse(widget.calculatedRouteModel.data.distance.toString()).toStringAsFixed(1)} km",
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "${widget.calculatedRouteModel.data.currency.symbol} ${double.parse(widget.calculatedRouteModel.data.courierFee.toString()).toStringAsFixed(0)}",
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // YMargin(5),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "Total Amount".tr,
                    //       style: GoogleFonts.roboto(
                    //         color: Colors.black,
                    //         // fontWeight: FontWeight.bold,
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //     Text(
                    //       "${restaurantLoad.data.currency.symbol} ${double.parse(widget.calculatedRouteModel.data.courierFee.toString()).toStringAsFixed(0)}",
                    //       style: GoogleFonts.roboto(
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 25,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Spacer(),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => OfflineOrders(
                                deliveryAddress: widget.customerAddress,
                                lat: widget.lat,
                                lng: widget.lng,
                              ));
                        },
                        child: Text(
                          "Continue".tr,
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
