import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Broadcast extends GetxController {
  Future startLiveStream(String streamTitle, bool onlineOrder, int price,
      String deliveryMeans) async {
    final uri =
        "https://demoapi.travtubes.com/api/v1/livestream/broadcast/start_stream";

    print("$streamTitle, $onlineOrder, $price, $deliveryMeans");

    final response = await http.post(Uri.parse(uri),
        body: jsonEncode({
          'stream_title': streamTitle,
          'online_order': onlineOrder,
          'price': price,
          'options': {'delivery_means': deliveryMeans}
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5MTRlNTc0ZC01YWYwLTRiNDEtYTljMy1jNTJjMjY2ZGI4MTgiLCJqdGkiOiIzMzE5YmQyYWNjZDQ0OWRkYWE0NmVlMTFhNjVkMTliNTI1YmRhZTQwZWUwMWQ4OTZhNmZhN2NmNGIwZTdhNTRlNmE2ZmU5ZmY0NWE1NzQ5OSIsImlhdCI6MTYzMDI0Njg5MiwibmJmIjoxNjMwMjQ2ODkyLCJleHAiOjE2NjE3ODI4OTIsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.erowCbe84cQFoq1DK0qAIO3xM53GSjElkvBsZ39S1Zm-ClO_NTY_VZGMTToIWSZ7Qj6rnZdVLpCVP-uswckNITf9NVvaNDzsuhBqQ20-YBmas8IkBHq5Q6RhdYOoFE38228rmXZHlaU9jCRc8RyRk6idnpwRATn4h8AUu0Dd8bUrta0iRRoOy3nOyvGJ3HzceMsP0imGWg8nWKW4tMyLGUZHtiMjL1KGQeI4OJSQZX3VK_6YVXGbzz7wrJZ1j-5y2QkV8W5tB2V6dp6nP4D8oXWyRiii86JMovBLbHN7RMMCWS-gWa4NEr3IvSarBAfuhvyBTsZKhpkghE7Wvn3XR_e5ZU-WatBtHYohfyqI9Y_fgpVmWX7CnniG6Ya0FMZdY9yMG4BZffEAd68PREDEKoA5I2HXbIQc41wsqVBh01c7jkvcug4ewGDrs-nAB1r20-iEPfDIivJiCAZOzeotT3z0q-6n2bdzYlq5MKDcqLlXHP4ZU5FQdMPeS63v4OlB-B3GoqD4vp7CjRBxJYxkJqEi3hem0YIQRMRgOqyeBV0ReS-kDHcDJliDi_HQclM1i8ZokZOlxurF1xQmemYIjpurgTHz3EGzXpCjfSzTdckSXd2dKSfZs1cwdUkQ-ooILyB-dTjR6jVi64ODVMasy8v90jhphFuszhGP2aBKqAs'
        });

    print("$streamTitle, $onlineOrder, $price, $deliveryMeans");

    final responseBody = response.body;

    print('BROADCAST start live stream $responseBody');
  }
}

Map<String, dynamic> broadcastValues = {
  "title": '',
  'image': '',
  'isOnline': false,
  'price': 0,
  'option': ''
};

Map<String, dynamic> responseValues = {
  "channelId": "",
  "channelName": "",
  "userId": 0,
  "token": ""
};
