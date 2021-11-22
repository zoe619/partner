import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:order_tracker/model/completed_online_orders_model.dart';
import 'package:order_tracker/model/restaurant_orders_model.dart' as reso;
import 'package:order_tracker/model/single_offline_order_model.dart';
import 'package:order_tracker/model/single_order_item_model.dart';
import 'package:order_tracker/models/get_pending_ordes_model.dart';
import 'package:order_tracker/models/my_customers_model.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/api/endpoints.dart';
import 'package:order_tracker/model/restaurant_order_model.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/snackbars.dart';

class OrderService extends GetxController {
  Future<MyCustomersModel> getCustomers(page, name) async {
    var url = Api.$BASE_URL +
        "get_my_courier_customer_list?search=${name == "" ? "  " : name}";
    var token = await storage.read(key: "token");
    log(url);
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return MyCustomersModel.fromJson(res);
      } else {
        // print("order response body ${response.body}");
        GetSnackbars().errorSnackbar("Error", data['message']);
      }
    } catch (e) {
      log("=======>>>>>>>>> $e");
    }
  }

  Future<int> getNewOrdersTotal() async {
    var url = Api.$BASE_URL + "get_restaurant_waiting_orders";
    var token = await storage.read(key: "token");

    log(url);
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    var res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // log(res['order_count'].toString());
      return res['order_count'];
    } else {
      // print("order response body ${response.body}");
      GetSnackbars().errorSnackbar("Error", res['message']);
      return 0;
    }
  }

  Future<RestaurantPendingOrdersModel> getWaitingOrders(page, seoUrl) async {
    var url = Api.$BASE_URL + "get_restaurant_waiting_orders?page=$page";
    // "get_restaurant_orders_v2?restaurant_url=$seoUrl";
    var token = await storage.read(key: "token");

    log(url);
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    var res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log(res['order_count'].toString());
      return RestaurantPendingOrdersModel.fromJson(res);
    } else {
      print("order response body ${response.body}");
      GetSnackbars().errorSnackbar("Error", res['message']);
      return RestaurantPendingOrdersModel.fromJson(res);
    }
  }

  // ignore: missing_return
  Future<SingleOrderItemModel> getSingleRestaurantOrders(
      seoUrl, orderId) async {
    var url = Api.$BASE_URL +
        "get_restaurant_order?restaurant_url=$seoUrl&order_id=$orderId";
    print("TEST" + seoUrl + " " + orderId);
    var token = await storage.read(key: "token");
    log(url);
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return SingleOrderItemModel.fromJson(res);
      } else {
        print("order response body ${response.body}");
        GetSnackbars().errorSnackbar("Error", response.body);
      }
    } catch (e) {
      log("--->>> $e");
    }
  }

  Future<SingleOfflineOrderItemModel> getSingleOfflineRestaurantOrders(
      seoUrl, orderId) async {
    var url = Api.$BASE_URL +
        "get_restaurant_order?restaurant_url=$seoUrl&order_id=$orderId";
    var token = await storage.read(key: "token");
    log(url);
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        print("order response body ${response.body}");
        return SingleOfflineOrderItemModel.fromJson(res);
      } else {
        print("order response body ${response.body}");
        GetSnackbars().errorSnackbar("Error", response.body);
      }
    } catch (e) {
      log("--->>> $e");
    }
  }

  Future<RestaurantOrderModel> getRestaurantOrders(page, seoUrl) async {
    var url = Api.$BASE_URL + "get_restaurant_active_online_orders?page=$page";
    var token = await storage.read(key: "token");

    log(url);
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      var data = json.decode(response.body);
      // print(data.toString());
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return RestaurantOrderModel.fromJson(res);
      } else {
        print("order response body ${response.body}");
        GetSnackbars().errorSnackbar("Error", data['message']);
      }
    } catch (e) {
      log("--->>>> $e");
    }
  }

  Future<CompletedOnlineOrdersModel> getCompletedRestaurantOrders(
      page, seoUrl) async {
    var url = Api.$BASE_URL +
        "get_restaurant_delivered_online_orders?restaurant_url=$seoUrl&page=$page";
    var token = await storage.read(key: "token");

    log(url);
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      // log(res.toString());

      return CompletedOnlineOrdersModel.fromJson(res);
    } else {
      print("order response body ${response.body}");
      GetSnackbars().errorSnackbar("Error", data['message']);
    }
  }

  Future<reso.RestaurantOfflineOrdersModel> getOfflineRestaurantOrders(
      page, seoUrl) async {
    var url = Api.$BASE_URL +
        "get_restaurant_offline_orders?restaurant_url=$seoUrl&page=$page";
    var token = await storage.read(key: "token");

    log(url);
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      var data = json.decode(response.body);

      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        // log(res.toString());
        return reso.RestaurantOfflineOrdersModel.fromJson(res);
      } else {
        print("order response body ${response.body}");
        GetSnackbars().errorSnackbar("Error", data['message']);
      }
    } catch (e) {
      log("=======>>>>>>>>> $e");
    }
  }

  Future<bool> acceptOrder(orderID, processMins) async {
    var url = Api.$BASE_URL +
        Endpoints.acceptOrder +
        "?order_id=$orderID&processing_mins=$processMins";
    print(url);

    var token = await storage.read(key: "token");
    try {
      final response = await http.post(url, headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      });
      var data = json.decode(response.body);
      log(data.toString());
      if (response.statusCode == 200) {
        Get.back();
        GetSnackbars().successSnackbar("Success", data['message']);
        return true;
      } else {
        Get.back();
        print("order response body ${response.body}");
        GetSnackbars().errorSnackbar("Error", data['message']);
        return false;
      }
    } catch (e) {
      log("===>>> $e");
    }
  }

  Future<bool> rejectOrder(orderID) async {
    var url = Api.$BASE_URL + Endpoints.rejectOrder + "?order_id=$orderID";
    print(url);

    var token = await storage.read(key: "token");
    final response = await http.post(url, headers: {
      "Authorization": "Bearer $token",
      "Accept": "application/json"
    });
    var data = json.decode(response.body);
    log(data.toString());

    try {
      if (response.statusCode == 200) {
        Get.back();
        GetSnackbars().successSnackbar("Success", data['message']);
        return true;
      } else {
        Get.back();
        print("order response body ${response.body}");
        GetSnackbars().errorSnackbar("Error", data['message']);
        return false;
      }
    } catch (e) {
      log("-=>> $e");
    }
  }

  Future<bool> goOfflineorOnline(bool state) async {
    var url = Api.$BASE_URL +
        "switch_restaurant_online_orders?order_state=${state == false ? "0" : "1"}";
    print(url);
    await storage.write(key: "isOnline", value: "$state");
    var token = await storage.read(key: "token");
    final response = await http.post(
      url,
      // body: json.encode(body),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      // log(response.statusCode.toString());
      // log(response.body.toString());
      GetSnackbars().successSnackbar("Success", data['message']);
      return true;
    } else {
      print("order response body ${response.body}");
      GetSnackbars().errorSnackbar("Error", data["message"]);
      return false;
    }
  }
}
