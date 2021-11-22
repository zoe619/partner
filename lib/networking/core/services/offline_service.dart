import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/api/endpoints.dart';
import 'package:order_tracker/model/calculated_route_model.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/snackbars.dart';

class OfflineService extends GetxController {
  Future<List<dynamic>> payOfflineOrder(orderId) async {
    var uri = Api.$BASE_URL + Endpoints.payOfflineOrder + "?order_id=$orderId";
    print(uri);
    var token = await storage.read(key: "token");
    int status;
    String message;
    try {
      final response = await http.post(
        Uri.parse(uri),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      status = response.statusCode;
      var data = json.decode(response.body);
      message = data['message'];
      log("response.body =======>>>>>>>>>>>>> ${response.statusCode} $data response.body");
    } catch (e) {
      log("e.toString() ======>>>>>>> ${e.toString()}");
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
    return [status, message];
  }

  Future<List<dynamic>> createOfflineOrder(
      amount,
      paymentType,
      menu,
      customerName,
      address,
      courierID,
      buildingNo,
      lat,
      lng,
      comment,
      collectPay,
      commentToCourier,
      phoneNo,
      collectInvoiceAmount,
      processMins,
  {customerId}) async {
    var uri = Api.$BASE_URL + Endpoints.createOfflineOrders + "?payment_type=$paymentType";
    var token = await storage.read(key: "token");
    int status;
    var data;
    var body = {
      "amount": amount,
      "payment_type": 'offline',
      "processing_mins": int.parse(processMins),
      "data": {
        "menu": menu,
        "collect_invoice_amount": collectInvoiceAmount,
        "customer_name": customerName,
        "address": address,
        // "customer_id": customerId,
        "customer_id": courierID,
        "building_number": buildingNo,
        "lat": lat,
        "lng": lng,
        "comment": comment,
        "collect_payment": collectPay,
        "comment_to_courier": commentToCourier,
        "phone_number": phoneNo,
      }
    };
    log(uri);
    log("body: ${json.encode(body)}");
    try {
      final response = await http.post(
        Uri.parse(uri),
        body: json.encode(body),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      status = response.statusCode;
      data = json.decode(response.body);

      if (status == 422) {
        GetSnackbars().errorSnackbar("Error".tr, "${data['errors']}".tr);
      }
      log("response.body =======>>>>>>>>>>>>> ${response.body}");
    } catch (e) {
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
    log("response.data status $status =======>>>>>>>>>>>>> $data");

    return [status, data];
  }

  Future<CalculatedRouteModel> calculateDistance(lat, lng) async {
    var uri = Api.$BASE_URL + "offline_ordering_step1";
    CalculatedRouteModel _resp = CalculatedRouteModel();
    var token = await storage.read(key: "token");
    Map<String, dynamic> body = {"customer_lat": lat, "customer_lng": lng};
    log(body.toString());
    try {
      final response = await http.post(
        Uri.parse(uri),
        body: body,
        //  json.encode(body),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );
      // log("========>>>>>> ${response.statusCode}");
      var data = json.decode(response.body);
       log("=======>>>>>>>>>>>>> $data");

      print('response: ${response.statusCode} ${data.toString()}');
      if (response.statusCode == 200) {
        _resp = CalculatedRouteModel.fromJson(json.decode(response.body));
        _resp.status = response.statusCode;
        return _resp;
      } else {
        // Get.back();
        // Get.back();
        GetSnackbars().errorSnackbar("Sorry", "${data['message']}");
        _resp.message = "${data['message']}";
        return _resp;
      }
    } catch (e) {
      GetSnackbars().errorSnackbar("Error", "$e");
    }
  }
}
