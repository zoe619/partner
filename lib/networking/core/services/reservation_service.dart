import 'dart:convert';

import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/api/endpoints.dart';
import 'package:order_tracker/model/restaurant_reservations_model.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:order_tracker/utils/snackbars.dart';

class ReservationService extends GetxController {
  Future<RestaurantReservationsModel> getReservations() async {
    var url = Api.$BASE_URL + Endpoints.getReservationsList;
    var token = await storage.read(key: "token");
    try {
      final response = await http.get(url, headers: {
        "Authorization": "Bearer $token",
      });
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        if (res['message'] == "You've successfully retrieved reservations") {
          print("resss $res");
          return RestaurantReservationsModel.fromJson(res);
        }
      } else {
        GetSnackbars().errorSnackbar("Error", response.body);
      }
    } catch (e) {
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
  }
}
