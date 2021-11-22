import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageDeliveryTrackingPage extends StatefulWidget {
  final String orderNumber;

  const PackageDeliveryTrackingPage({Key key, this.orderNumber})
      : super(key: key);
  @override
  _PackageDeliveryTrackingPageState createState() =>
      _PackageDeliveryTrackingPageState();
}

class _PackageDeliveryTrackingPageState
    extends State<PackageDeliveryTrackingPage> {
  // Completer<GoogleMapController> _controller = Completer();

  GoogleMapController mapController;

  final Geolocator _geolocator = Geolocator();

// For storing the current position
  Position _currentPosition;

  List<Placemark> startPlacemark;

//creating a list of markers
  Set<Marker> _marker = {};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

// Method for retrieving the current location
  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  String _currentAddress = "", _startAddress = "";
  Position startCoordinates;

  _getAddress() async {
    try {
      // Places are retrieved using the coordinates
      List<Placemark> p = await _geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      // Taking the most probable result
      Placemark place = p[0];

      setState(() {
        // Structuring the address
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";

        // Setting the user's present location as the starting address
        _startAddress = _currentAddress;
      });
      List<Placemark> startPlacemark =
          await _geolocator.placemarkFromAddress(_startAddress);
      _currentPosition = startPlacemark[0].position;

      ///get user marker and show info windeor
      Marker startMarker = Marker(
        markerId: MarkerId('$startCoordinates'),
        position: LatLng(
          _currentPosition.latitude,
          _currentPosition.longitude,
        ),
        infoWindow: InfoWindow(
          title: 'Start',
          snippet: _startAddress,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(0.0),
      );
      print("startMarker ${startMarker.flat}");
      setState(() {
        _marker.add(startMarker);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 5.2,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YMargin(10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(FontAwesomeIcons.arrowLeft),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          launch("tel://125464456");
                        },
                        child: Icon(FontAwesomeIcons.phoneAlt),
                      ),
                      XMargin(20),
                      Icon(FontAwesomeIcons.ellipsisV),
                    ],
                  ),
                  YMargin(15),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "10:32",
                        style: GoogleFonts.montserrat(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      XMargin(10),
                      Expanded(
                        child: Text(
                          "Estimated arrival",
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  YMargin(15),
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 70,
                              height: 5,
                              color: Colors.green,
                            ),
                            XMargin(5),
                          ],
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  SlidingUpPanel(
                    minHeight: 150,
                    maxHeight: 150,
                    panel: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Courier Name",
                                style: GoogleFonts.montserrat(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              YMargin(10),
                              GestureDetector(
                                onLongPress: () {
                                  print("onLong Press");
                                },
                                child: Text(
                                  "+125464456",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          CircleAvatar(
                            child: Text("CN"),
                          )
                        ],
                      ),
                    ),
                    body: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Stack(
                        children: [
                          GoogleMap(
                            myLocationEnabled: true,
                            myLocationButtonEnabled: true,
                            mapType: MapType.normal,
                            zoomGesturesEnabled: true,
                            zoomControlsEnabled: true,
                            initialCameraPosition: _kGooglePlex,
                            onMapCreated: (GoogleMapController controller) {
                              // _controller.complete(controller);
                              mapController = controller;
                            },
                            markers: _marker != null
                                ? Set<Marker>.from(_marker)
                                : null,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipOval(
                                  child: Material(
                                    color: Colors.blue[100], // button color
                                    child: InkWell(
                                      splashColor: Colors.blue, // inkwell color
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Icon(Icons.add),
                                      ),
                                      onTap: () {
                                        mapController.animateCamera(
                                          CameraUpdate.zoomIn(),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                YMargin(20),
                                ClipOval(
                                  child: Material(
                                    color: Colors.blue[100], // button color
                                    child: InkWell(
                                      splashColor: Colors.blue, // inkwell color
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Icon(Icons.remove),
                                      ),
                                      onTap: () {
                                        mapController.animateCamera(
                                          CameraUpdate.zoomOut(),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Positioned(
                          //   top: 55,
                          //   right: 20,
                          //   child: ClipOval(
                          //     child: Material(
                          //       color: Colors.orange[100], // button color
                          //       child: InkWell(
                          //         splashColor: Colors.orange, // inkwell color
                          //         child: SizedBox(
                          //           width: 56,
                          //           height: 56,
                          //           child: Icon(Icons.my_location),
                          //         ),
                          //         onTap: () {
                          //           mapController.animateCamera(
                          //             CameraUpdate.newCameraPosition(
                          //               CameraPosition(
                          //                 target: LatLng(
                          //                   // Will be fetching in the next step
                          //                   _currentPosition.latitude,
                          //                   _currentPosition.longitude,
                          //                 ),
                          //                 zoom: 18.0,
                          //               ),
                          //             ),
                          //           );
                          //         },
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
