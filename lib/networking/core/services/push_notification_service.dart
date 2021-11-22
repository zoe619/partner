import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/sys_alert_window_utils.dart';
import 'package:system_alert_window/system_alert_window.dart';

import 'misc_service.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.max,
  playSound: true,
  enableVibration: true,
  sound: RawResourceAndroidNotificationSound('loud_blackberry_2010'),
);
setupNotification() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    RemoteNotification notification = message.notification;
    print(notification.title);
    print(message.data);
    var androidDetails = AndroidNotificationDetails(
        "partnercentral", "SENT_NOTIFICATION", "Notification sent",
        sound: channel.sound, importance: Importance.max, priority: Priority.high);
    var iosDetails = IOSNotificationDetails();
    var generalNotificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);
    await flutterLocalNotificationsPlugin
        .show(0, notification.body, notification.title, generalNotificationDetails, payload: "");
    // await MiscService.showNotification(notification.body, notification.title, "");
  });
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  var androidDetails = AndroidNotificationDetails(
      "partnercentral", "SENT_NOTIFICATION", "Notification sent",
      sound: channel.sound, importance: Importance.max, priority: Priority.high);
  var iosDetails = IOSNotificationDetails();
  var generalNotificationDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);
  await flutterLocalNotificationsPlugin.show(
      0, message.notification.body, message.notification.title, generalNotificationDetails,
      payload: "");
  SystemAlertWindow.registerOnClickListener(callBackFunction);
  print(message.data);
  if (message.notification.title.contains("new")) {
    SystemWindowHeader header = SystemWindowHeader(
      title: SystemWindowText(text: "New Order", fontSize: 10, textColor: Colors.black45),
      padding: SystemWindowPadding.setSymmetricPadding(12, 12),
      subTitle: SystemWindowText(
          text: "You have a new order",
          fontSize: 14,
          fontWeight: FontWeight.BOLD,
          textColor: Colors.black87),
      decoration: SystemWindowDecoration(startColor: Colors.grey[100]),
    );

    SystemWindowFooter footer = SystemWindowFooter(
        buttons: [
          SystemWindowButton(
            text: SystemWindowText(text: "View Order", fontSize: 12, textColor: Colors.white),
            tag: "focus_button",
            width: 0,
            padding: SystemWindowPadding(left: 10, right: 10, bottom: 10, top: 10),
            height: SystemWindowButton.WRAP_CONTENT,
            decoration: SystemWindowDecoration(
              startColor: redColor,
              endColor: redColor,
              borderWidth: 0,
              borderRadius: 10.0,
            ),
          )
        ],
        padding: SystemWindowPadding(left: 16, right: 16, bottom: 12),
        decoration: SystemWindowDecoration(startColor: Colors.white),
        buttonsPosition: ButtonPosition.CENTER);

    SystemAlertWindow.showSystemWindow(
        height: 130,
        header: header,
        footer: footer,
        margin: SystemWindowMargin(left: 8, right: 8, top: 100, bottom: 0),
        gravity: SystemWindowGravity.CENTER,
        notificationTitle: "New Delivery Order",
        notificationBody: "You have a new order",
        prefMode: SystemWindowPrefMode.BUBBLE);
  }
}
