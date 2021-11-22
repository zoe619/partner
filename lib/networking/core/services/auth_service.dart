import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/api/endpoints.dart';
import 'package:order_tracker/model/restaurant_details_model.dart';
import 'package:order_tracker/networking/core/services/misc_service.dart';
import 'package:order_tracker/networking/core/services/shared_Pref.dart';
import 'package:order_tracker/networking/core/services/user_service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/snackbars.dart';
import 'package:order_tracker/view/screens/authScreens/signIn.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';
import 'package:order_tracker/view/screens/not_official.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'orders_service.dart';

class AuthService extends GetxController {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  UserService _userService = UserService();
  MiscService _miscService = MiscService();
  Future login(email, password, context) async {
    var url = Api.$BASE_URL + Endpoints.login + "?email=$email&password=$password";
     log(url.toString());
    try {
      final response = await http.post(
        url,
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
        },
      );
      log('response.statusCode: ${response.statusCode} ${response.body}');
      print('Error code ${response.statusCode}');
      print('Error Message ${response.body}');
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        await storage.write(key: "token", value: res["data"]);
        //get user service
        _userService.getUserDetails();
        OrderService().goOfflineorOnline(true);
        //add fcm token
        await firebaseMessaging.getToken().then((value) {
          fcmToken = value;
          print("==================>>>>>>>>>>>>>>" + fcmToken.toString());
          _miscService.addDeviceFcmToken(fcmToken);
        }).catchError((e) {
          print(e);
        });
        GetSnackbars().successSnackbar("Success", "Welcome!");
        Get.offAll(() => BottomNavigation());
      } else {
        GetSnackbars().errorSnackbar("Error", "Invalid Credentials");
      }
    } catch (e) {
      GetSnackbars().errorSnackbar(
        "Error",
        e.toString(),
      );
    }
  }

  // ignore: missing_return
  Future<int> signUp(firstname, lastname, email, gender, age, password, context) async {
    var uri = Api.$BASE_URL +
        Endpoints.register +
        "?first_name=$firstname&last_name=$lastname&age_group=$age&gender=$gender&email=$email&password=$password";
    print(uri);
    Map<String, dynamic> _body = {
      "first_name": firstname,
      "last_name": lastname,
      "age_group": age,
      "gender": gender,
      "email": email,
      "password": password
    };

    print("user map ${_body.toString()}");
    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      final response = await http.post(
        Uri.parse(uri),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
      );
      int status = response.statusCode;
      print(status);
      if (status == 200) {
        GetSnackbars().successSnackbar("Successful", "Please sign in to continue");
        Get.to(() => SignIn());
      } else {
        print("error status code ${response.statusCode}");
        print("error status body ${response.body}");

        GetSnackbars()
            .errorSnackbar("Error", "An Error Occured. Please check details and try again");
      }
      return status;
    } catch (e) {
      print(e.toString());
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
  }

  Future<RestaurantDetailsModel> getRestaurantData() async {
    var token = await storage.read(key: "token");
    var uri = Uri.parse(Api.$BASE_URL + Endpoints.getRestaurantDetails);
    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );
    int status = response.statusCode;
    var data = json.decode(response.body);
    // log("${status.toString()} ====>>> ${data['data']}");
    if (status == 200) {
      if (data['data'].isEmpty) {
        Get.off(() => NotOfficial());
      } else {
        print(data);
        await SharedPref().save("restaurantData", json.decode(response.body));
        return RestaurantDetailsModel.fromJson(json.decode(response.body));
      }
    } else if (status == 429) {
      GetSnackbars().errorSnackbar(
        "Error",
        "${json.decode(response.body)['message']}",
      );
    } else {
      GetSnackbars().errorSnackbar(
        "Error",
        "${json.decode(response.body)['message']}",
      );
    }
  }
}
