import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

class RestaurantDeliveryService extends GetxController {
  Future updateRestInfo(freeKm, address, city, timezoneId, countryId, id, name, phone,
      minOrderValue, BuildContext context) async {
    // BuildContext context;
    var token = await storage.read(key: "token");
    var uri = Api.$BASE_URL + "update_restaurant";
    Map<String, dynamic> body = {
      "address": "$address",
      "city": "${restaurantLoad.data.cityId}",
      "timezone_id": "$timezoneId",
      "country_id": "$countryId",
      "id": "$id",
      "name": "$name",
      "phone": "$phone",
      "free_km": "$freeKm",
      "min_order_value": "$minOrderValue"
    };

    // log(json.encode(body).toString());
    try {
      final response = await http.post(
        Uri.parse(uri),
        body: body,
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      int status = response.statusCode;
      var data = json.decode(response.body);
      Get.back();
      log(status.toString() + "==" + data.toString());

      if (status == 200) {
        Get.snackbar(
          "Success",
          "Min Order Value",
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
        return "";
      } else {
        log(status.toString() + "==" + data.toString());
        Get.back();
        Get.snackbar(
          "Error",
          data['errors'].toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      log("$e");
    }
  }
}
