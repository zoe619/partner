import 'dart:developer';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:order_tracker/model/calculated_route_model.dart';
import 'package:order_tracker/models/my_customers_model.dart' as prev;
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/services/offline_service.dart';
import 'package:order_tracker/networking/core/services/orders_service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/utils/snackbars.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

import 'confirm_offline_location.dart';
import 'place_offline_delivery.dart';
import 'place_order_previous_customer.dart';

class RequestCustomerLocation extends StatefulWidget {
  final dynamic lat;
  final dynamic lng;
  const RequestCustomerLocation({Key key, this.lat, this.lng}) : super(key: key);

  @override
  _RequestCustomerLocationState createState() => _RequestCustomerLocationState();
}

class _RequestCustomerLocationState extends State<RequestCustomerLocation> {
  OfflineService offlineService = Get.put(OfflineService());
  OrderService orderService = Get.put(OrderService());

  final TextEditingController controller = TextEditingController();
  TextEditingController nameController = TextEditingController();

  dynamic lat, lng;
  bool isLoading = false;
  Future<Position> _currentLocation;
  GoogleMapController mapController;
  Future<prev.MyCustomersModel> _future;
  prev.Data customerData;
  int selectedPrevCustomer;

  @override
  void initState() {
    super.initState();
    _currentLocation = Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    _future = orderService.getCustomers(0, "");
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
      backgroundColor: Colors.white,
      // ignore: sized_box_for_whitespace
      body: ListView(
        children: [
          Container(
            height: height / 2.7,
            width: width,
            color: Colors.black,
            child: FutureBuilder<Position>(
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
          const YMargin(25),
          Container(
            padding: const EdgeInsets.only(
              top: 10,
              right: 17,
              left: 17,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Customer Address".tr,
                  style: GoogleFonts.roboto(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const YMargin(5),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        // height: 45,
                        width: double.maxFinite,
                        child: GooglePlaceAutoCompleteTextField(
                          textEditingController: controller,
                          googleAPIKey: Api.$PLACES_APIKEY,
                          inputDecoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            labelText: "Enter your customer address".tr,
                            labelStyle: GoogleFonts.manrope(
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(121, 121, 121, 1),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          debounceTime: 600, // default 600 ms,
                          // ignore: prefer_const_literals_to_create_immutables
                          countries: ["EE", "NG"],
                          isLatLngRequired: true,
                          getPlaceDetailWithLatLng: (prediction) {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              lat = prediction.lat;
                              lng = prediction.lng;
                            });
                          },
                          itmClick: (prediction) {
                            controller.text = prediction.description;
                            controller.selection = TextSelection.fromPosition(
                                TextPosition(offset: prediction.description.length));
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (controller.text == "") {
                          GetSnackbars().errorSnackbar(
                              "Invalid address field", "Please input customer address".tr);
                        } else {
                          Get.dialog(Dialog(
                            child: Container(
                              height: 100,
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          ));
                          setState(() {
                            isLoading = true;
                          });
                          offlineService.calculateDistance(lat, lng).then((value) {
                            setState(() {
                              isLoading = false;
                            });

                             if(value.status == 200){
                              Get.back();
                              GetSnackbars().successSnackbar(
                                  "Success ",
                                  // ignore: unnecessary_string_interpolations
                                  "${value.message}");
                              Get.to(
                                    () => ConfirmOfflineOrder(
                                  lat: lat,
                                  lng: lng,
                                  calculatedRouteModel: value,
                                  customerAddress: controller.text,
                                ),
                              );

                            } else {
                              GetSnackbars().errorSnackbar(
                                  "Sorry",
                                  // ignore: unnecessary_string_interpolations
                                  "${value.message ?? "Failed to calculate distance cost"}");
                              Future.delayed(Duration(seconds: 2), () {
                                Get.back();
                                Get.back();
                              });
                              Get.back();
                            }
                          });
                        }
                      },
                      icon: Icon(
                        FeatherIcons.send,
                        color: redColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          YMargin(20),
          Container(
            padding: const EdgeInsets.only(
              top: 10,
              right: 17,
              left: 17,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search for a Customer".tr,
                  style: GoogleFonts.roboto(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const YMargin(5),
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 170,
                      child: TextField(
                        controller: nameController,
                        onChanged: (_) {
                          setState(() {
                            _future = orderService.getCustomers(0, _);
                          });
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          labelText: "Search customers".tr,
                          labelStyle: GoogleFonts.manrope(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(121, 121, 121, 1),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          YMargin(10),
          FutureBuilder<prev.MyCustomersModel>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return SizedBox(
                    height: 200,
                    width: double.maxFinite,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (snapshot.data == null || snapshot.data.data.isEmpty) {
                    return SizedBox(
                      height: 100,
                      width: double.maxFinite,
                      child: Center(
                        child: Text(
                          "No previous customer",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            ...List.generate(snapshot.data.data.length, (index) {
                              var cusData = snapshot.data.data[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  dense: false,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  onTap: () {
                                    Get.dialog(Dialog(
                                      child: Container(
                                        height: 100,
                                        child: Center(child: CircularProgressIndicator()),
                                      ),
                                    ));
                                    if (selectedPrevCustomer == index) {
                                      setState(() {
                                        selectedPrevCustomer = null;
                                      });
                                    } else {
                                      setState(() {
                                        selectedPrevCustomer = index;
                                        customerData = cusData;
                                      });
                                      offlineService
                                          .calculateDistance(
                                              cusData.lat.toString(), cusData.lng.toString())
                                          .then((value) {
                                        Get.back();
                                        if (value != null) {
                                          Get.to(() => PlaceOrderPrevCustomer(
                                                amount: value.data.courierFee ?? "",
                                                distance: value.data.distance ?? "",
                                                currency: restaurantLoad.data.currency.symbol ?? "",
                                                deliveryAddress: cusData.address,
                                                lat: cusData.lat,
                                                lng: cusData.lng,
                                                customerModel: customerData,
                                              ));
                                        } else {
                                          GetSnackbars().errorSnackbar(
                                              "Sorry",
                                              // ignore: unnecessary_string_interpolations
                                              "${value.message ?? "Failed to calculate distance cost"}");
                                          Future.delayed(Duration(seconds: 2), () {
                                            Get.back();
                                            Get.back();
                                          });
                                        }
                                      });
                                    }
                                  },
                                  tileColor: Colors.grey.shade200,
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage("assets/images/Rectangle 1.png"),
                                  ),
                                  title: Text(cusData.name),
                                  subtitle: Text(cusData.address),
                                ),
                              );
                            }),
                          ],
                        ),
                      ],
                    );
                  }
                }
              }),
        ],
      ),
    );
  }
}
