import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/api/endpoints.dart';
import 'package:order_tracker/model/new_post_model.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/view/screens/floatingActionScreens/createPost.dart';

class NewsFeedServices extends GetxController {
  // ignore: missing_return
  Future<NewPostModel> multiImagePostAPI(text, video) async {
    var uri = Api.$BASE_URL + Endpoints.addNewPost;
    var token = await storage.read(key: "token");
    print(uri);

    MultipartRequest request = http.MultipartRequest('POST', Uri.parse(uri));
    request.headers["Authorization"] = "Bearer $token";
    // request.headers["Accept"] = "application/json";
    request.headers["Content-Type"] = "multipart/form-data";

    Map<String, dynamic> data = Map<String, String>();
    data["message"] = text == null ? " " : text;
    data["video"] = video == null ? "" : video;
    request.fields.addAll(data);
    print(request.fields.toString());
    for (int i = 0; i < f.length; i++) {
      newList.add(await http.MultipartFile.fromPath('images[]', f[i].path));
    }
    print(newList);
    request.files.addAll(newList);

    var res = await request.send();
    print(res.statusCode);

    if (res.statusCode == 200) {
      Get.back();
      Get.snackbar("Success", "New Post Created!",
          backgroundColor: Colors.green, colorText: Colors.white);
      debugPrint("Status$res");
      // debugPrint("status : ${await res.stream.bytesToString()}");
    } else {
      print(res.statusCode);
      debugPrint("status : ${res.reasonPhrase}");
      Get.snackbar("Error", "Failed to create post",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    return NewPostModel.fromJson(json.decode(await res.stream.bytesToString()));
  }

  // ignore: missing_return, path
  Future<NewPostModel> createPost(text, List images, video) async {
    var dio = Dio();
    var uri = Api.$BASE_URL + Endpoints.addNewPost;
    var token = await storage.read(key: "token");
    print(uri);
    FormData body = FormData.fromMap({
      "message": text,
      "images": null,
      // ? null
      // : await MultipartFile.fromFile(images[0].path, filename: "{path[0]}"),
      "video": video
    });
    print(body.fields);
    final response = await dio.post(
      uri,
      data: body,
      options: Options(
        contentType: 'multipart/form-data',
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    if (response.statusCode == 200) {
      Get.back();

      Get.snackbar("Success", "New Post Created!",
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      print(response.data);
      Get.snackbar("Error", "Failed to create post",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    return NewPostModel.fromJson(response.data);
  }

  Future<int> deletePost(postId) async {
    var uri = Uri.parse(Api.$BASE_URL + Endpoints.deletePost + "?post_id=$postId");
    var token = await storage.read(key: "token");
    print(uri);

    final response = await http.delete(uri, headers: {
      'Accept': 'application/json',
      // "Content-Type": "accept/json",
      "Authorization": "Bearer $token",
    });
    int status = response.statusCode;
    print(response.body);
    print(response.statusCode);
    return status;
  }
}
