import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:order_tracker/model/payouts_model.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/api/endpoints.dart';
import 'package:order_tracker/model/dashboard_details_model.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/snackbars.dart';

class DashboardService extends GetxController {
  Future<DashboardDetailsModel> getDashboardDetailsModel() async {
    var url = Api.$BASE_URL + Endpoints.getDashboardDetails;
    var token = await storage.read(key: "token");
    try {
      final response = await http.get(url, headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        if (res['message'] == "Successfully returned mobile dashboard") {
          return DashboardDetailsModel.fromJson(res);
        }
      }
    } catch (e) {
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
  }

  Future<ReportsPayoutHistory> getPaymentHistoryModel(period) async {
    var url = Api.$BASE_URL + Endpoints.getPaymentHistory + "?week=$period";
    var token = await storage.read(key: "token");
    try {
      final response = await http.get(url, headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return ReportsPayoutHistory.fromJson(res);
      }
    } catch (e) {
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
  }

  Future<ReportsPayoutHistory> getCustomPaymentHistoryModel(start, end) async {
    var url = Api.$BASE_URL + Endpoints.getPaymentHistory + "?start_date=$start&end_date=$end";
    log(url);

    var token = await storage.read(key: "token");
    try {
      final response = await http.get(url, headers: {"Authorization": "Bearer $token"});
      var res = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ReportsPayoutHistory.fromJson(res);
      }
    } catch (e) {
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
  }
}
