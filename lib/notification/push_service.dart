import 'dart:developer';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';


class PushNotificationService {
  // PushNotificationService();
  Future initialise() async {
    // FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging _firebase = FirebaseMessaging.instance;
    NotificationSettings settings = await _firebase.requestPermission(
        alert: true, announcement: false, badge: true, carPlay: false,
        criticalAlert: false, provisional: false, sound: true
    );
    log('User granted permission: ${settings.authorizationStatus}');
    RemoteMessage initialMessage = await _firebase.getInitialMessage();
    // AwesomeNotifications().actionStream.listen(
    //         (receivedNotification){
    //  print('onLaunch: $receivedNotification');
    // print("===========>>>>>>>>>>>>>>>>");
    // print('A new onMessageOpenedApp event was published!');
    // print("===========>>>>>>>>>>>>>>>>");
    //   serialiseAndNavigate(event.data, event);
    //     }
    // );

    String token = await FirebaseMessaging.instance.getToken();

    if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
      print('FlutterFire Messaging Example: Getting APNs token...');
      String token = await FirebaseMessaging.instance.getAPNSToken();
      print('FlutterFire Messaging Example: Got APNs token: $token');
    } else {
      print(
          'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.');
    }

    log('firebase notification token ===>   $token');

    FirebaseMessaging.onMessage.listen(
          (RemoteMessage message) {
        Get.snackbar('new notification', '', colorText: Colors.white);
        log("new notification message   ===>> ${message.data}");
        // if (isUserOnline == true) {
        RemoteNotification notification = message.notification;
        AndroidNotification android = message.notification?.android;

        AppleNotification apple = message.notification?.apple;

        if (message.data.containsKey("order_id")) {
          if (notification != null && android != null) {
            // Navigator.of(GlobalVariable.navState.currentContext)
            //     .push(MaterialPageRoute(
            //     builder: (context) =>
            //         NewOrderNotification(
            //           processingMins: "${message.data['processing_mins']}",
            //           paymentMode: "${message.data['payment_mode']}",
            //           orderId: "${message.data['order_id']}",
            //           amount: "${message.data['amount']}",
            //           customerName: "${message.data['customer_name']}",
            //           deliveryLat: double.parse(message.data['delivery_lat']),
            //           deliveryLng: double.parse(message.data['delivery_lng']),
            //           deliveryLocation: "${message.data['delivery_location']}",
            //           pickupLat: "${message.data['pickup_lat']}",
            //           pickupLocation: "${message.data['pick_up_location']}",
            //           pickupLng: "${message.data['pickup_lng']}",
            //           estTime: "${message.data['est_delivery_time']}",
            //           distance: "${message.data['distance']}",
            //         )));
          }
          if (notification != null && apple != null) {
            AwesomeNotifications()
                .createNotification(
                content: NotificationContent(
                  id: 10,
                  channelKey: 'high_intensity',
                  title: "${message.notification.title}",
                  body: "${message.notification.body}",
                ))
                .then((value) {
             // hasNewRideRequest = true;
            });
          }
          // Get.to(
          //       () => NewOrderNotification(
          //     processingMins: "${message.data['processing_mins']}",
          //     paymentMode: "${message.data['payment_mode']}",
          //     orderId: "${message.data['order_id']}",
          //     amount: "${message.data['amount']}",
          //     customerName: "${message.data['customer_name']}",
          //     deliveryLat: double.parse(message.data['delivery_lat']),
          //     deliveryLng: double.parse(message.data['delivery_lng']),
          //     deliveryLocation: "${message.data['delivery_location']}",
          //     pickupLat: "${message.data['pickup_lat']}",
          //     pickupLocation: "${message.data['pick_up_location']}",
          //     pickupLng: "${message.data['pickup_lng']}",
          //     estTime: "${message.data['est_delivery_time']}",
          //     distance: "${message.data['distance']}",
          //   ),
          // );
        } else {
          AwesomeNotifications().createNotification(
              content: NotificationContent(
                id: 11,
                channelKey: 'basic_notifications',
                title: "${message.notification.title}",
                body: "${message.notification.body}",
              ));
        }
        // }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
            (messages) {
          log("initial message =======>>>>>>>>> ${initialMessage.notification.title}");
          log('onLaunch: $messages');
          log("===========>>>>>>>>>>>>>>>>");
          log('A new onMessageOpenedApp event was published!  ${messages.notification.title}');
          log("===========>>>>>>>>>>>>>>>>");
          // Get.to(
          //       () => NewOrderNotification(
          //     paymentMode: "${messages.data['payment_mode']}",
          //     processingMins: "${messages.data['processing_mins']}",
          //     // orderObject: OngoingOrderItemModel.fromJson(message.data),
          //     orderId: "${messages.data['order_id']}",
          //     amount: "${messages.data['amount']}",
          //     customerName: "${messages.data['customer_name']}",
          //     deliveryLat: double.parse(messages.data['delivery_lat']),
          //     deliveryLng: double.parse(messages.data['delivery_lng']),
          //     deliveryLocation: "${messages.data['delivery_location']}",
          //     pickupLat: "${messages.data['pickup_lat']}",
          //     pickupLocation: "${messages.data['pick_up_location']}",
          //     pickupLng: "${messages.data['pickup_lng']}",
          //     estTime: "${messages.data['est_delivery_time']}",
          //     distance: "${messages.data['distance']}",
          //   ),
          // );
        },
        onError: (err){
          log('firebase error: '+err.toString());
        }
    );

    // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }
}

void serialiseAndNavigate(Map<String, dynamic> message, RemoteMessage messages) {
  var notificationData = message['data'];
  var view = notificationData;
  if (view != null) {
    log(view.toString());
    // Get.to(() => NewOrderNotification(
    //   paymentMode: "${messages.data['payment_mode']}",
    //   processingMins: "${messages.data['processing_mins']}",
    //   // orderObject: OngoingOrderItemModel.fromJson(message.data),
    //   orderId: "${messages.data['order_id']}",
    //   amount: "${messages.data['amount']}",
    //   customerName: "${messages.data['customer_name']}",
    //   deliveryLat: double.parse(messages.data['delivery_lat']),
    //   deliveryLng: double.parse(messages.data['delivery_lng']),
    //   deliveryLocation: "${messages.data['delivery_location']}",
    //   pickupLat: "${messages.data['pickup_lat']}",
    //   pickupLocation: "${messages.data['pick_up_location']}",
    //   pickupLng: "${messages.data['pickup_lng']}",
    //   estTime: "${messages.data['est_delivery_time']}",
    //   distance: "${messages.data['distance']}",
    // ));
    //This checks what the FCM data contains, then Navigate to the respective view
    if (view ==
        'this is the data sent with the notification, that would help determine where you are going') {
      // _navigationService.navigateTo('TheWidgetNamedRoute');
    }
  } else if (view == 'VIDEO_FAILED') {
    // _navigationService.navigateTo('VideosFailedPage');
  } else if (view == 'VIDEO_CREATED') {}
  // _navigationService.navigateTo('VideosCreatedPage');
}

Future<bool> initAwesomeNotifications() {
  return AwesomeNotifications().initialize(
    'resource://drawable/mytcon',
    [
      // Your notification channels go here

      NotificationChannel(
        channelKey: 'offline_background_notification',
        channelName: 'Background notifications',
        channelDescription: 'Channel for basic notifications',
        defaultColor: Colors.red,
        icon: 'resource://drawable/mytcon',
        playSound: true,
        soundSource: 'resource://raw/res_noify_sound',
        importance: NotificationImportance.High,
        ledColor: Colors.red,
        enableLights: true,
        enableVibration: true,
        vibrationPattern: highVibrationPattern,
        defaultRingtoneType: DefaultRingtoneType.Notification,
        channelShowBadge: true,
      ),
      NotificationChannel(
        channelKey: 'basic_notifications',
        channelName: 'Basic notifications',
        channelDescription: 'Channel for basic notifications',
        defaultColor: Colors.red,
        icon: 'resource://drawable/mytcon',
        importance: NotificationImportance.High,
        ledColor: Colors.red,
        enableLights: true,
        enableVibration: true,
        vibrationPattern: highVibrationPattern,
        defaultRingtoneType: DefaultRingtoneType.Notification,
        channelShowBadge: true,
      ),
      NotificationChannel(
        channelKey: 'high_intensity',
        channelName: 'High intensity notifications',
        channelDescription: 'Notification channel for notifications with high intensity e.g orders',
        icon: 'resource://drawable/mytcon',
        playSound: true,
        soundSource: 'resource://raw/res_noify_sound',
        importance: NotificationImportance.Max,
        defaultColor: Colors.red,
        ledColor: Colors.red,
        enableLights: true,
        enableVibration: true,
        vibrationPattern: highVibrationPattern,
        onlyAlertOnce: false,
      ),
    ],
  );
}
