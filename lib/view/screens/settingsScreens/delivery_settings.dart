import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/model/restaurant_details_model.dart';
import 'package:order_tracker/networking/core/services/auth_service.dart';
import 'package:order_tracker/networking/core/services/restaurant_delivery_service.dart';
import 'package:order_tracker/networking/core/services/shared_Pref.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

class DeliverySettings extends StatefulWidget {
  const DeliverySettings({Key key}) : super(key: key);

  @override
  _DeliverySettingsState createState() => _DeliverySettingsState();
}

class _DeliverySettingsState extends State<DeliverySettings> {
  TextEditingController freeKMController = TextEditingController();
  TextEditingController minOrderValueController = TextEditingController();
  RestaurantDeliveryService restaurantDeliveryService = Get.put(RestaurantDeliveryService());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          YMargin(20),
          ListTile(
            onTap: () {
              // Get.back();

              setMaxKm(context);
            },
            title: Text(
              "Free Delivery km",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Current km is ${restaurantLoad.data.freeKm ?? "0.0 km"} km"),
            trailing: Icon(
              Icons.edit,
              color: redColor,
            ),
          ),
          YMargin(10),
          ListTile(
            onTap: () {
              // Get.back();
              setMinOrderValue(context);
            },
            title: Text(
              "Minimum order value",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                "Current order value is ${restaurantLoad.data.currency != null ? restaurantLoad.data.currency.symbol ?? "" : ""} ${restaurantLoad.data.minOrderValue ?? "0.00"}"),
            trailing: Icon(
              Icons.edit,
              color: redColor,
            ),
          ),
        ],
      ),
    );
  }

  setMaxKm(BuildContext buildContext, {previousDistance}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: StatefulBuilder(builder: (context, state) {
        return Container(
          width: MediaQuery.of(buildContext).size.width / 1.1,
          height: MediaQuery.of(buildContext).size.height / 2.5,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.mi,
            children: [
              YMargin(10),
              Text("Current free delivery distance is "),
              Text(
                "${restaurantLoad.data.freeKm ?? "0.0"} km",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              YMargin(30),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: freeKMController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter Value",
                      ),
                    ),
                    YMargin(15),
                    TextButton(
                      onPressed: () {
                        restaurantDeliveryService
                            .updateRestInfo(
                                freeKMController.text ?? 0,
                                restaurantLoad.data.address,
                                restaurantLoad.data.city.id,
                                restaurantLoad.data.timezone.id,
                                restaurantLoad.data.countryId,
                                restaurantLoad.data.id,
                                restaurantLoad.data.name,
                                restaurantLoad.data.phone,
                                restaurantLoad.data.minOrderValue,
                                context)
                            .then((value) {
                          AuthService().getRestaurantData().then((value) {
                            fetchStorageValues();
                          });
                        });
                      },
                      child: Center(
                        child: Text(
                          "Set Distance",
                          style: TextStyle(fontSize: 16, fontFamily: "popbold"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    ));
  }

  setMinOrderValue(BuildContext buildContext, {previousDistance}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        child: StatefulBuilder(builder: (context, state) {
          return Container(
            width: MediaQuery.of(buildContext).size.width / 1.1,
            height: MediaQuery.of(buildContext).size.height / 2.5,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.mi,
              children: [
                YMargin(10),
                Text("Current min order value is "),
                Text(
                  " $restCurrency ${restaurantLoad.data.minOrderValue == null ? "0" : restaurantLoad.data.minOrderValue}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                YMargin(30),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: minOrderValueController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Value",
                        ),
                      ),
                      YMargin(15),
                      TextButton(
                        onPressed: () {
                          restaurantDeliveryService
                              .updateRestInfo(
                                  restaurantLoad.data.freeKm ?? 0,
                                  restaurantLoad.data.address,
                                  restaurantLoad.data.city.id,
                                  restaurantLoad.data.timezone.id,
                                  restaurantLoad.data.countryId,
                                  restaurantLoad.data.id,
                                  restaurantLoad.data.name,
                                  restaurantLoad.data.phone,
                                  minOrderValueController.text,
                                  context)
                              .then((value) {
                            AuthService().getRestaurantData().then((value) {
                              fetchStorageValues();
                            });
                          });
                        },
                        child: Center(
                          child: Text(
                            "Set Value",
                            style: TextStyle(fontSize: 16, fontFamily: "popbold"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  fetchStorageValues() async {
    try {
      await storage.readAll();
      RestaurantDetailsModel user =
          RestaurantDetailsModel.fromJson(await SharedPref().read("restaurantData"));
      if (mounted) {
        setState(() {
          restaurantLoad = user;
        });
      }
      log("updated");
    } catch (e) {
      print(e);
    }
  }
}
