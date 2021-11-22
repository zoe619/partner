import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mdi/mdi.dart';
import 'package:order_tracker/localization/localization_service.dart';
import 'package:order_tracker/networking/core/services/orders_service.dart';
import 'package:order_tracker/networking/core/services/push_notification_service.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';
import 'package:order_tracker/view/screens/order_screens/my_pending_orders.dart';
import 'package:order_tracker/view/screens/order_screens/offline_orders/request_customer_location.dart';
import 'package:order_tracker/view/screens/order_screens/online_orders/live_kitchen.dart';
import 'package:order_tracker/view/screens/order_screens/online_orders/live_test.dart';
import 'package:order_tracker/view/screens/order_screens/online_orders/pre_live_kitchen.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationsBar extends StatefulWidget {
  @override
  State<NotificationsBar> createState() => _NotificationsBarState();
}

int previousValue = 0;

class _NotificationsBarState extends State<NotificationsBar> {
  OrderService _orderService = Get.put(OrderService());
  Future<int> _future;
  String _selectedLang;
  getLang() async {
    var saved = await storage.read(key: "lang");
    log(saved.toString());
    _selectedLang = saved ?? LocalizationService.langs.first;
    LocalizationService().changeLocale(_selectedLang);
  }

  @override
  void initState() {
    super.initState();
    getLang();
    _future = _orderService.getNewOrdersTotal();
  }

  startTimeout() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _future = _orderService.getNewOrdersTotal();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _future = _orderService.getNewOrdersTotal();
      });
    });
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        overlayColor: Colors.black,
        children: [
          SpeedDialChild(
            backgroundColor: redColor,
            label: "Offline Ordering".tr,
            onTap: () {
              flutterLocalNotificationsPlugin.cancelAll();
              Get.to(() => RequestCustomerLocation());
            },
            child: Icon(
              Mdi.bikeFast,
              color: Colors.white,
            ),
          ),
          SpeedDialChild(
            backgroundColor: redColor,
            label: "Live Kitchen".tr,
            onTap: () async {
              await [Permission.camera, Permission.microphone].request();

              flutterLocalNotificationsPlugin.cancelAll();
              Get.to(PreLiveKitchenScreen());
            },
            child: Icon(
              Mdi.video,
              color: Colors.white,
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [languageChooser()],
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 2,
        title: Text(
          restaurantLoad.data == null ? "Admin".tr : restaurantLoad.data.name,
          style: TextStyle(
            color: black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Row(
          children: [
            XMargin(10),
            restaurantLoad.data == null
                ? Container(
                    child: Icon(
                      Icons.person_sharp,
                      color: white,
                    ),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                  )
                : restaurantLoad.data.imageUrl == null
                    ? Container(
                        child: Icon(
                          Icons.person_sharp,
                          color: white,
                        ),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                      )
                    : CircleAvatar(
                        backgroundImage:
                            NetworkImage(restaurantLoad.data.imageUrl),
                      ),
          ],
        ),
        centerTitle: false,
      ),
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: () {
              Get.to(() => PendingOrders()
                  //  OrdersBar(),
                  );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                // height: 300,
                // width: 300,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: redColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FutureBuilder<int>(
                          future: _future,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                    ConnectionState.done ||
                                snapshot.hasError) {
                              return Text(
                                "${previousValue ?? 0}",
                                style: GoogleFonts.montserrat(
                                  fontSize: 50,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            } else {
                              previousValue = snapshot.data;
                              return Text(
                                "${snapshot.data ?? 0}",
                                style: GoogleFonts.montserrat(
                                  fontSize: 50,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }
                          }),
                      Text(
                        "New orders".tr,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Tap anywhere to view them".tr,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  DropdownButtonHideUnderline languageChooser() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
          icon: Icon(Icons.arrow_drop_down),
          value: _selectedLang,
          items: LocalizationService.langs.map((String lang) {
            return DropdownMenuItem(value: lang, child: Text(lang));
          }).toList(),
          onChanged: (String value) async {
            // updates dropdown selected value
            setState(() => _selectedLang = value);
            // gets language and changes the locale
            await storage.write(key: "lang", value: value);
            LocalizationService().changeLocale(value);
          }),
    );
  }
}
