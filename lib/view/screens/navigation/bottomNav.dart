import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:order_tracker/model/restaurant_details_model.dart';
import 'package:order_tracker/networking/core/services/auth_service.dart';
import 'package:order_tracker/networking/core/services/misc_service.dart';
import 'package:order_tracker/networking/core/services/push_notification_service.dart';
import 'package:order_tracker/networking/core/services/shared_Pref.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/sys_alert_window_utils.dart';
import 'package:order_tracker/view/screens/bottomNavScreens/notifications_screens/notifications_bar.dart';
import 'package:order_tracker/view/screens/bottomNavScreens/report_screens/n_reports_screen.dart';
import 'package:order_tracker/view/screens/order_screens/orders_bar.dart';
import 'package:order_tracker/view/screens/settingsScreens/settings_bar.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

RestaurantDetailsModel restaurantLoad = RestaurantDetailsModel();

class _BottomNavigationState extends State<BottomNavigation> {
  AuthService _authService = Get.put(AuthService());
  PageController controller = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<RestaurantDetailsModel> _future;
  @override
  void initState() {
    super.initState();
    checkDrawOverAppsPermission();

    _authService.getRestaurantData().then((value) {
      fetchStorageValues();
    });
    _future = _authService.getRestaurantData();
  }

  fetchStorageValues() async {
    try {
      await storage.readAll();
      RestaurantDetailsModel user = RestaurantDetailsModel.fromJson(
          await SharedPref().read("restaurantData"));
      setState(() {
        restaurantLoad = user;
      });
      // print("==>>> tag ${restaurantLoad.data.name}  id ${restaurantLoad.data.officeEmail}");
    } catch (e) {
      print(e);
    }
  }
  // ignore: missing_return

  // Future<void> loadState() async {
  //   await Future.delayed(Duration(seconds: 3));
  //   PusherTra().initPusher(
  //       APP_KEY: '432kdfd', HOST: 'socket.travtubes.com', PORT: 443);
  //   getToken();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Scaffold(
                body: Center(
                  child: [
                    NotificationsBar(),
                    OrdersBar(),
                    NReportScreen(),
                    SettingsBar(),
                  ].elementAt(_selectedIndex),
                ),
                bottomNavigationBar: BottomNavigationBar(
                    items: navItems(),
                    currentIndex: _selectedIndex,
                    selectedItemColor: redColor,
                    unselectedItemColor: Colors.grey,
                    unselectedLabelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    onTap: _onItemTapped),
              );
            }
          }
        },
      ),
    );
  }

  List<BottomNavigationBarItem> navItems() {
    return [
      BottomNavigationBarItem(
        label: "Dashboard".tr,
        icon: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Icon(
            FontAwesomeIcons.home,
            size: 16,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: "Orders".tr,
        icon: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Icon(
            FontAwesomeIcons.cartArrowDown,
            size: 16,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: "Reports".tr,
        icon: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Icon(
            FontAwesomeIcons.dollarSign,
            size: 16,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: "Settings".tr,
        icon: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Icon(
            FontAwesomeIcons.cog,
            size: 16,
          ),
        ),
      ),
    ];
  }
}
