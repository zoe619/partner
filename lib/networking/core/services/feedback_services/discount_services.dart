import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiscountService extends GetxController {
  int disCountStatus;

  Map discountResponse = {};

  Map get getDiscountResponse {
    return {...discountResponse};
  }

  Future setDiscount(String title, int pcnt) async {
    // var token = storage.read(key: "token");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await http.post(
      Uri.parse(Api.$BASE_URL_V2 + 'admin/enable_feedback_coupon'),
      body: json.encode({"title": title, "percent": pcnt}),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('STATUS CODE ${response.statusCode}');
    disCountStatus = response.statusCode;
    var data = response.body;

    discountResponse = {};

    var decodedData = jsonDecode(data);

    discountResponse = decodedData;

    prefs.setString('discountTitle', decodedData['data']['title']);
    prefs.setString('discountPcnt', decodedData['data']['value'].toString());

    print(decodedData);

    print('RESPONSE $data');
    // return response.statusCode;
  }

  Future disableDiscount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await http.post(
      Uri.parse(Api.$BASE_URL_V2 + 'admin/disable_feedback_coupon'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print('STATUS CODE ${response.statusCode}');

    var data = jsonDecode(response.body);

    if (data['message'] == "Coupon service is offline") {
      Get.snackbar('Travpon disabled', 'Travpon service is offline',
          backgroundColor: redColor,
          snackPosition: SnackPosition.TOP,
          colorText: white);

      prefs.setString('discountTitle', '');
      prefs.setString('discountPcnt', '');
    }

    print('RESPONSE $data');
  }

  int redeemResponse;

  Map travponRedeemResp = {};

  Map get gettravponRedeemResp {
    return travponRedeemResp;
  }

  Future redeemTravPonDiscount(String couponCode, int amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await http.post(
      Uri.parse(Api.$BASE_URL_V2 + 'admin/redeem_coupon_code'),
      body: jsonEncode({"coupon_code": couponCode, "amount": amount}),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print('RESPONSE STATUS CODE ${response.statusCode}');

    redeemResponse = response.statusCode;

    var data = response.body;

    travponRedeemResp = {};

    travponRedeemResp = jsonDecode(data);

    print('RESPONSE $data');
  }
}
