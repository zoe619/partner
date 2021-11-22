import 'package:bringtoforeground/bringtoforeground.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart' as ln;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/model/restaurant_details_model.dart' as rd;
import 'package:order_tracker/networking/core/services/auth_service.dart';
import 'package:order_tracker/networking/core/services/misc_service.dart';
import 'package:order_tracker/networking/core/services/push_notification_service.dart';
import 'package:order_tracker/networking/core/services/shared_Pref.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/sys_alert_window_utils.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';
import 'authScreens/signIn.dart';
import 'bottomNavScreens/load.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  grtTkn() async {
    await storage.readAll();
    checkToken = await storage.read(key: "token");
  }

  checkLoginState() async {
    if (checkToken != null) {
      AuthService().getRestaurantData().then((value) {
        fetchStorageValues();
        Future.delayed(Duration(seconds: 1), () {
          Get.off(() => BottomNavigation());
        });
      });
    } else {
      Get.off(() => SignIn());
    }
  }

  fetchStorageValues() async {
    try {
      await storage.readAll();
      rd.RestaurantDetailsModel user =
          rd.RestaurantDetailsModel.fromJson(await SharedPref().read("restaurantData"));
      setState(() {
        restaurantLoad = user;
      });
      // print("==>>> tag ${restaurantLoad.data.name}  id ${restaurantLoad.data.officeEmail}");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    checkDrawOverAppsPermission();
    grtTkn();
    setupNotification();
    Future.delayed(Duration(seconds: 3), () {
      checkLoginState();
    });
    var initializationSettingsAndroid = ln.AndroidInitializationSettings('@drawable/logo3');
    var initializationSettingsIOs = ln.IOSInitializationSettings();
    var initSetttings = ln.InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOs,
    );
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Frame 12.png',
              fit: BoxFit.cover,
              height: 50,
            ),
            Text(
              "TravelTube",
              style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future onSelectNotification(String payload) async {
  Bringtoforeground.bringAppToForeground();
  Get.offAll(() => BottomNavigation(), transition: Transition.fadeIn);
}
