import 'dart:convert';

import 'package:get/get.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/api/endpoints.dart';
import 'package:order_tracker/networking/core/services/shared_Pref.dart';
import 'package:order_tracker/utils/constants.dart';

import 'package:http/http.dart' as http;
import 'package:order_tracker/utils/snackbars.dart';
import 'package:order_tracker/view/screens/authScreens/signIn.dart';

class UserService extends GetxController {
  Future<int> getUserDetails() async {
    try {
      var token = await storage.read(key: "token");
      var uri = Api.$BASE_URL + Endpoints.getUser;
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['data'] != []) {
        await storage.write(key: "restaurantId", value: "${data["data"]["user_id"]}");
        await storage.write(key: "userImage", value: data["data"]["image"]);
        await SharedPref().save("userData", json.decode(response.body));
      }
      return response.statusCode;
    } catch (e) {
      print(e);
    }
  }

  ///change password
  Future changeUserPassword(oldPassword, newPassword, newPasswordConfirmation) async {
    var url = Api.$BASE_URL +
        Endpoints.changePassword +
        "?old_password=$oldPassword&new_password=$newPassword&new_password_confirmation=$newPasswordConfirmation";
    var token = await storage.read(key: "token");
    try {
      final response = await http.post(url, headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        GetSnackbars().successSnackbar("Success", "Password changed. Please login again");
        Get.off(SignIn());
      } else if (response.statusCode == 422) {
        GetSnackbars().errorSnackbar("Error", "Old password not correct. Try again");
      } else {
        print("error body ${response.body}");
        print("error code ${response.statusCode}");
        GetSnackbars().errorSnackbar("Error", "Error changing password. Try again");
      }
    } catch (e) {
      print(e);
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
  }
}
