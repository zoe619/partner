import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:order_tracker/model/get_customers_comments_model.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:order_tracker/utils/snackbars.dart';

class CommentService extends GetxController {
  Future<GetCommentsModel> getComments(page) async {
    var uri = Api.$BASE_URL + "get_restaurant_menu_comments?page=$page";
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
      if (response.statusCode == 200) {
        return GetCommentsModel.fromJson(data);
      } else {
        log(response.body.toString());
        GetSnackbars().errorSnackbar("Error", "${data['message']}");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<GetCommentsModel> deleteUserComments(id) async {
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
        GetSnackbars().successSnackbar("Success", "Comment removed successfully");
      } else {
        log(response.body.toString());
        GetSnackbars().errorSnackbar("Error", "${data['message']}");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<GetCommentsModel> likeUserComments(type, cType, id, status) async {
    var uri = Api.$BASE_URL + "like_unlike_post?like_type=menu&like_id=$id&status=$status";
    var token = await storage.read(key: "token");
    log(uri);
    try {
      final response = await http.post(
        Uri.parse(uri),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        GetSnackbars().successSnackbar("Success", "Comment $cType successfully");
      } else {
        log(response.body.toString());
        GetSnackbars().errorSnackbar("Error", "${data['message']}");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
