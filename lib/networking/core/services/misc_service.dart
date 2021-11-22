import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart' as ln;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:order_tracker/main.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/api/endpoints.dart';
import 'package:order_tracker/model/misc_country_model.dart';
import 'package:order_tracker/networking/core/services/push_notification_service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/snackbars.dart';

class MiscService extends GetxController {
  //get Countries
  Future<CountriesModel> getCountryList(page) async {
    var url = Api.$BASE_URL + Endpoints.getCountryList + "?page=$page";
    var token = await storage.read(key: "token");
    try {
      final response = await http.get(url, headers: {
        "Authorization": "Bearer $token",
      });
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        if (res['message'] == "Videos on  found") {
          print("res data ${res['data']}");
          return CountriesModel.fromJson(res);
        }
      }
    } catch (e) {
      print(e.toString());
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
  }

  //make a post
  Future createPost(text, images, video) async {
    var url = Api.$BASE_URL + Endpoints.createPost + "?message=$text&images=$images&video=$video";
    var token = await storage.read(key: "token");
    print("url for post $url");
    print("token for post $token");
    try {
      final response = await http.post(url, headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        print("Response ImageCode ${response.statusCode}");
        print("Response Image ${response.body}");
        Get.back();
        GetSnackbars().successSnackbar("Success", "New Post Created!");
      } else {
        print("Response ImageCode ${response.statusCode}");

        print("Response Image ${response.body}");
        GetSnackbars()..errorSnackbar("Error", "Failed to create Post");
      }
    } catch (e) {
      print(e.toString());
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
  }

  Future createWithDio(text, File images, video) async {
    var url = Api.$BASE_URL + Endpoints.createPost;
    var dio = d.Dio();
    var token = await storage.read(key: "token");
    String fileName = images.path.split('/').last;

    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";

    Map<String, dynamic> _data = {
      "images": await d.MultipartFile.fromFile(images.path, filename: fileName),
      'message': text,
      'video': video,
    };

    print("data object $_data");
    d.Response response;
    d.FormData formData = d.FormData.fromMap(
      _data,
    );
    response = await dio.post(url, data: (formData));

    if (response.statusCode == 200) {
      Get.back();
      GetSnackbars().successSnackbar("Success", "New Post Created!");
    } else {
      print(response.statusCode);
      print(response.statusMessage);
      GetSnackbars()..errorSnackbar("Error", "Failed to create Post");
    }
  }

  Future addDeviceFcmToken(String fcmToken) async {
    var device =
        Theme.of(navigatorKey.currentContext).platform.toString() == "TargetPlatform.android"
            ? "android"
            : "ios";
    print(device);
    var token = await storage.read(key: "token");
    var url = Api.$BASE_URL + Endpoints.addDeviceFCMToken + "?device=$device&token=$fcmToken";

    // print(url);
    try {
      final response = await http.post(url, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });
      if (response.statusCode == 200) {
        // print("${json.decode(response.body)["message"]}");
      } else {
        // print("device token error ${response.statusCode}");
        // print("device token error body ${response.body}");
      }
    } catch (e) {
      print(e);
    }
  }

  static showNotification(description, title, payload) async {
    var androidDetails = ln.AndroidNotificationDetails(
        "partnercentral", "SENT_NOTIFICATION", "Notification sent",
        sound: channel.sound, importance: ln.Importance.max, priority: ln.Priority.high);
    var iosDetails = ln.IOSNotificationDetails();
    var generalNotificationDetails =
        ln.NotificationDetails(android: androidDetails, iOS: iosDetails);
    await flutterLocalNotificationsPlugin.show(0, description, title, generalNotificationDetails,
        payload: payload);
  }
}
