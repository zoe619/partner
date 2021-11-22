import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_pusher/pusher.dart';
import 'package:order_tracker/networking/core/services/push_notification_service.dart';

import 'constants.dart';

class PusherTra {
  Channel channel;

  Future<void> initPusher({
    @required String APP_KEY,
    @required String HOST,
    @required int PORT,
  }) async {
    var token = await storage.read(key: "token");
    var id = await storage.read(key: "restaurantId");
    print("id is $id");
    try {
      await Pusher.init(
          "$APP_KEY",
          PusherOptions(
              cluster: "eu",
              auth: new PusherAuth(
                  "https://demoapi.travtubes.com/broadcasting/auth",
                  headers: {
                    'Accept': 'application/json',
                    'Authorization': 'Bearer ' + token,
                  }),
              host: HOST,
              port: PORT),
          enableLogging: true);
    } on PlatformException catch (e) {
      print(e.message);
    }
    Pusher.connect(onConnectionStateChange: (val) {
      print('Pusher Connection State ${val.currentState}');
      if (val.currentState == "CONNECTED") {
        print('CONNECTED CONFIRMATION');
        subscribe(
            channel: channel, channelName: "triming", eventName: "test.posted");
        subscribe(
            channel: channel,
            channelName: 'private-restaurant.' + id,
            eventName: "restaurant.order");
      }
    }, onError: (err) {
      print("Pusher Error State ${err.message}");
    });
  }

  showNotification(payload) async {
    var android = AndroidNotificationDetails('id', 'channel ', 'description',
        priority: Priority.max, importance: Importance.max);
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Order Notification', 'You have a new order', platform,
        payload: payload);
  }

  subscribe(
      {@required Channel channel,
      @required String channelName,
      @required String eventName}) async {
    channel = await Pusher.subscribe(channelName);
    channel.bind(eventName, (onEvent) {
      print('This is Data from ${onEvent.data}');
      showNotification(onEvent.data);
    }).catchError((e) {
      print('BINDING ERROR CHECK ${e}');
    });
  }
}
