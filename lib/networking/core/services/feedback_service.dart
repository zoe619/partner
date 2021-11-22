import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:order_tracker/model/get_restaurant_feedbacks.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/snackbars.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

class FeedbackService extends GetxController {
  List feedbacks = [];

  List get getResFeedbacks {
    return [...feedbacks];
  }

// <HashMap<String, dynamic>>
  Future getFeedbacks(page) async {
    var uri = Api.$BASE_URL_V2 +
        "admin/get_my_restaurant_feedbacks?seo_url=${restaurantLoad.data.seoUrl}&page=$page";
    print("SEO URL ${restaurantLoad.data.seoUrl}");
    // &page=$page
    var token = await storage.read(key: "token");
    log(uri);

    try {
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      var data = json.decode(response.body);
      print('FEEDBACKS $data');
      if (response.statusCode == 200) {
        feedbacks = [];

        feedbacks = data['data'];
        print(feedbacks);
      } else {
        log(response.body.toString());
        GetSnackbars().errorSnackbar("Error", "${data['message']}");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future deleteUserFeedback(id) async {
    var uri = Api.$BASE_URL + "delete_menu_comment?comment_id=$id";
    var token = await storage.read(key: "token");
    log(uri);
    try {
      final response = await http.delete(
        Uri.parse(uri),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        GetSnackbars().successSnackbar("Success", "Feedback deleted");
      } else {
        log(response.body.toString());
        GetSnackbars().errorSnackbar("Error", "${data['message']}");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
