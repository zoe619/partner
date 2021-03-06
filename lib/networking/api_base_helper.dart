import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:order_tracker/networking/app_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = "https://demoapi.travtubes.com/api/v1/";

  Future<dynamic> get(String url, {Map<String, String> headers}) async {
    var responseJson;
    try {
      final response =
          await http.get(Uri.parse(_baseUrl + url), headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + url));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
