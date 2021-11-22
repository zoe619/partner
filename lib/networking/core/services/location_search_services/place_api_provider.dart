import 'dart:convert';

import 'package:http/http.dart';
import 'package:order_tracker/networking/core/services/location_search_services/place.dart';
import 'package:order_tracker/networking/core/services/location_search_services/suggestion.dart';

class PlaceApiProvider {
  final client = Client();

  PlaceApiProvider(this.sessionToken);

  final sessionToken;

  static final String androidKey = 'AIzaSyDv7chIKxJdSiATd1fmt0vSUVP2upK0F7w';
  static final String apiKeyGeoCoding =
      "AIzaSyCGFNvnNS9xY019XQjDz_Tl1FB8gOFEmGU";
  // static final String iosKey = 'YOUR_API_KEY_HERE';
  // final apiKey = Platform.isAndroid ? androidKey : iosKey;

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=$lang&components=country:ng&key=$androidKey&sessiontoken=$sessionToken';
    print("request $request");

    final response = await client.get(request);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print("suggestion result $result");
      if (result['status'] == 'OK') {
        // compose suggestions in a list
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<Place> getPlaceDetailFromId(String placeId) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=address_component&key=$androidKey&sessiontoken=$sessionToken';
    final response = await client.get(request);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print(result);
      if (result['status'] == 'OK') {
        final components =
            result['result']['address_components'] as List<dynamic>;
        // build result
        final place = Place();
        components.forEach((c) {
          final List type = c['types'];
          if (type.contains('street_number')) {
            place.streetNumber = c['long_name'];
          }
          if (type.contains('route')) {
            place.street = c['long_name'];
          }
          if (type.contains('locality')) {
            place.city = c['long_name'];
          }
          if (type.contains('postal_code')) {
            place.zipCode = c['long_name'];
          }
        });
        print(result);
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future getLongAndLatFromPlace(place) async {
    //
    var encodedPlaceString = Uri.encodeFull(place);
    var url =
        "https://maps.googleapis.com/maps/api/geocode/json?address=$encodedPlaceString&key=$apiKeyGeoCoding";
    print(url);
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        print(result);
        LongLatModel location =
            LongLatModel.fromJson(result["results"][0]["geometry"]["location"]);
        print(location.latitude);
        print(location.longitude);
        return location;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}

class LongLatModel {
  double longitude;
  double latitude;
  LongLatModel({this.longitude, this.latitude});
  LongLatModel.fromJson(Map<String, dynamic> json) {
    longitude = json["lng"];
    latitude = json["lat"];
  }
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lng"] = longitude;
    map["lat"] = latitude;
    return map;
  }
}
