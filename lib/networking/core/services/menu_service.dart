import 'dart:convert';

import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/api/endpoints.dart';
import 'package:order_tracker/model/menu_category_model.dart';
import 'package:order_tracker/model/menu_model.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/snackbars.dart';

class MenuService extends GetxController {
  ///retrieve all menu items
  // ignore: missing_return
  Future<MenuModel> getMenuList([int offset]) async {
    var url = Api.$BASE_URL + Endpoints.getMenuList + (offset != null ? "?page=$offset" : "");
    print(url);
    var token = await storage.read(key: "token");

    final response = await http.get(url, headers: {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      // print("menu response $res");
      return MenuModel.fromJson(res);
    } else {
      print(response.statusCode);
      print(response.body);
      GetSnackbars().errorSnackbar("Error", "Failed to load menu list. Please refresh your screen");
    }
  }

  ///using dio
  Future postWithDio(String name, double price, String description, int foodMenuId, double discount,
      var menuImg) async {
    var url = Api.$BASE_URL + Endpoints.addUpdateMenuItem;
    var dio = d.Dio();
    var token = await storage.read(key: "token");

    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";

    d.Response response;
    d.FormData formData = d.FormData.fromMap(
      {"menuImg": await d.MultipartFile.fromFile(menuImg.path)},
    );
    response = await dio.post(url,
        queryParameters: {
          'name': name,
          'price': price,
          'description': description,
          'discount': discount,
          'menuImg': menuImg,
          'cooking_time': 5,
          'food_menu_id': foodMenuId
        },
        data: formData);

    if (response.statusCode == 200) {
      Get.back();
      GetSnackbars().successSnackbar("Success", "Menu Item Added");
    } else {
      print(response.statusCode);
      print(response.statusMessage);
      GetSnackbars().errorSnackbar("Error", "Failed to add Menu Item. Try again");
    }
  }

  // ignore: missing_return
  Future<MenuCategoryModel> getMenuCategories() async {
    var url = Api.$BASE_URL + Endpoints.getCategoryId;
    var token = await storage.read(key: "token");
    try {
      final response = await http.get(url, headers: {
        "Authorization": "Bearer $token",
      });
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        if (res['message'] == "Successfully retrieved menus") {
          print("menu cat res $res");
          return MenuCategoryModel.fromJson(res);
        } else {
          GetSnackbars().errorSnackbar("Error", response.body);
        }
      }
    } catch (e) {
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
  }
}
