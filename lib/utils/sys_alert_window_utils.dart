import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:bringtoforeground/bringtoforeground.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/services/isolate_manager_service.dart';
import 'package:order_tracker/networking/core/services/push_notification_service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';
import 'package:order_tracker/view/screens/order_screens/my_pending_orders.dart';
import 'package:system_alert_window/system_alert_window.dart';

String _platformVersion = 'Unknown';

Future<void> initPlatformState() async {
  String platformVersion;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    Get.offAll(() => BottomNavigation());
    flutterLocalNotificationsPlugin.cancelAll();
    Bringtoforeground.bringAppToForeground();
  } on PlatformException {
    platformVersion = 'Failed to get platform version.';
  }

  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling
  // setState to update our non-existent appearance.
  _platformVersion = platformVersion;
}

Future<bool> checkDrawOverAppsPermission() async {
  bool isGranted;
  SystemAlertWindow.requestPermissions().then((value) {
    isGranted = value;
  });

  log("initializing==>");
  ReceivePort _port = ReceivePort();
  IsolateManager.registerPortWithName(_port.sendPort);
  _port.listen((dynamic callBackData) {
    String tag = callBackData[0];
    switch (tag) {
      case "personal_btn":
        initPlatformState();
        SystemAlertWindow.closeSystemWindow();
        break;
      case "simple_button":
        initPlatformState();
        SystemAlertWindow.closeSystemWindow();
        break;
      case "focus_button":
        initPlatformState();
        SystemAlertWindow.closeSystemWindow();
        break;
    }
  });
  SystemAlertWindow.registerOnClickListener(callBackFunction);
  return isGranted;
}

bool callBackFunction(String tag) {
  print("Got tag " + tag);
  SendPort port = IsolateManager.lookupPortByName();
  port.send([tag]);
  return true;
}

_acceptOrDenyOrder(orderIDAndTrackCode) async {
  var type = orderIDAndTrackCode.split("-")[2];
  if (type == "accept") {
    var url = Api.$BASE_URL +
        "api/v1/accept_order_v2?order_id=${orderIDAndTrackCode.split("-")[0]}&track_code=${orderIDAndTrackCode.split("-")[1]}";
    try {
      var response = await patch(url);
      print(url);
      if (response.statusCode == 200) {
        SystemAlertWindow.closeSystemWindow();
      } else {
        SystemAlertWindow.closeSystemWindow();
      }
    } catch (e) {
      SystemAlertWindow.closeSystemWindow();
    }
  } else {
    var url = Api.$BASE_URL +
        "api/v1/reject_order_v2?order_id=${orderIDAndTrackCode.split("-")[0]}&track_code=${orderIDAndTrackCode.split("-")[1]}";
    try {
      print(url);
      var response = await patch(url);
      if (response.statusCode == 200) {
        SystemAlertWindow.closeSystemWindow();
      } else {
        SystemAlertWindow.closeSystemWindow();
      }
    } catch (e) {
      SystemAlertWindow.closeSystemWindow();
    }
  }
}
