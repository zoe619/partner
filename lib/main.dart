import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:order_tracker/localization/app_localization.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/snackbars.dart';
import 'package:order_tracker/view/screens/splash.dart';
import 'package:system_alert_window/system_alert_window.dart';
import 'localization/localization_service.dart';
import 'networking/core/services/push_notification_service.dart';
import 'notification/push_service.dart';

final navigatorKey = GlobalKey<NavigatorState>();

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel channell;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin flutterLocalNotificationsPluging;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initAwesomeNotifications().then((value) {
    log("initialised ===>>>> $value");
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  channell = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPluging = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPluging
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channell);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppUpdateInfo _updateInfo;
  Future<void> checkForUpdate() async {

    // PushNotificationService().initialise();
    
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });

      if (_updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate().catchError((e) {
          GetSnackbars().errorSnackbar("Error", e.toString());
        });
      }
    }).catchError((e) {
      log(e.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    PushNotificationService().initialise();
    
    checkForUpdate();
    SystemAlertWindow.closeSystemWindow();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return GetMaterialApp(
      translationsKeys: AppTranslation.translationsKeys,
      locale: window.locale,
      navigatorKey: GlobalVariable.navState,
      translations: LocalizationService(),
      fallbackLocale: Locale('en', 'US'),
      // navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Partner Central',
      theme: ThemeData(
        backgroundColor: Colors.grey[100],
        primarySwatch: Colors.red,
        primaryColor: redColor,
        fontFamily: 'montserrat'
      ),
      home: SafeArea(
        child: SplashScreen(),
      ),
    );
  }
  
}

class GlobalVariable {
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  
  log("onBackgroundMessage ${message.data}");


  RemoteNotification notification = message.notification;
  AndroidNotification android = message.notification?.android;

  AppleNotification apple = message.notification?.apple;

  
  // if (message.notification.title.contains("new delivery")) {
  //   AwesomeNotifications().createNotification(
  //     content: NotificationContent(
  //       id: Random().nextInt(2147483647),
  //       channelKey: 'offline_background_notification',
  //       title: message.notification.title,
  //       body: message.notification.body,
  //       customSound: 'resource://raw/res_noify_sound',
  //     ),
  //   );
  // } else {
  //   AwesomeNotifications().createNotification(
  //     content: NotificationContent(
  //       id: Random().nextInt(2147483647),
  //       channelKey: 'high_intensity',
  //       title: message.notification.title,
  //       body: message.notification.body,
  //     ),
  //   );
  // }
}
