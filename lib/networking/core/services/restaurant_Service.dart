import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/api/endpoints.dart';
import 'package:order_tracker/model/customer_list_model.dart';
import 'package:order_tracker/model/restaurant_details_model.dart';
import 'package:order_tracker/networking/core/services/shared_Pref.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/snackbars.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

class RestaurantService extends GetxController {
  Future<RestaurantDetailsModel> getRestaurantDetails() async {
    var url = Api.$BASE_URL + Endpoints.getResData + "?restaurant_url=$resSeoUrl";
    var token = await storage.read(key: "token");
    try {
      final response = await http.get(url, headers: {
        "Authorization": "Bearer $token",
      });
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        if (res['message'] == "Successfully returned dashboard") {
          if (res['data'] == []) {
          } else {
            print("res Dets $res");
            return RestaurantDetailsModel.fromJson(res);
          }
        }
      }
    } catch (e) {
      print(e.toString());
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
  }

  Future updateResSocials(
      name,
      website,
      facebook,
      officemail,
      twitter,
      instagram,
      tiktok,
      linkedin,
      externalmenu,
      phone,
      whatsappnumber,
      videoid,
      countryid,
      region,
      city,
      address,
      lat,
      lng,
      policy,
      additionalInfo,
      dressCode,
      vatPercent,
      executiveChef,
      cuisine,
      deliveryNote,
      currencyId,
      timezoneId,
      takeAwayEnabled,
      dineInEnabled,
      deliveryEnabled) async {
    var id = int.parse(resIdConst);
    var url = Api.$BASE_URL + Endpoints.updateResData;
    // +
    // "?id=$id=$name&website=$website&facebook=$facebook&office_email=$officemail&twitter=$twitter&instagram=$instagram&tiktok=$tiktok&linked_in=$linkedin&external_menu=$externalmenu&phone=$phone&whats_app_number=$whatsappnumber&video_id=$videoid&country_id=$countryid&region=$region&city=$city&address=$address&lng=$lng&lat=$lat&policy=$policy&additional_info=$additionalInfo&dress_code=$dressCode&vat_percent=$vatPercent&executive_chef=$executiveChef&cuisine=$cuisine&delivery_note=$deliveryNote&currency_id=$currencyId&timezone_id=$timezoneId&take_away_enabled=$takeAwayEnabled&dine_in_enabled=$dineInEnabled&delivery_enabled=$deliveryEnabled";

    var token = await storage.read(key: "token");
    print(url);
    Map<String, dynamic> body = {
      "id": id,
      "name": name,
      "website": website,
      "facebook": facebook,
      "office_email": officemail,
      "twitter": twitter,
      "instagram": instagram,
      "tiktok": tiktok,
      "linked_in": linkedin,
      "external_menu": externalmenu,
      "phone": phone,
      "whats_app_number": whatsappnumber,
      "video_id": videoid,
      "country_id": countryid,
      "region": region,
      "city": city,
      "address": address,
      "lng": lng,
      "lat": lat,
      "policy": policy,
      "additional_info": additionalInfo,
      "dress_code": dressCode,
      "vat_percent": vatPercent,
      "executive_chef": executiveChef,
      "cuisine": cuisine,
      "delivery_note": deliveryNote,
      "currency_id": currencyId,
      "timezone_id": timezoneId,
      "take_away_enabled": takeAwayEnabled,
      "dine_in_enabled": dineInEnabled,
      "delivery_enabled": deliveryEnabled
    };
    print(token);
    print("res details ${body.toString()}");

    try {
      final response = await http.post(url,
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
          body: json.encode(body));
      if (response.statusCode == 200) {
        GetSnackbars().successSnackbar("Success", "Restaurant Information Updated!");
      } else if (response.statusCode == 422) {
        GetSnackbars().errorSnackbar(
            "Error", "One or more social fields cannot be empty and must start with https://");
      } else {
        print("rest update error code ${response.statusCode}");
        print("rest update error messs ${response.body}");

        GetSnackbars().errorSnackbar("Error", "Error Updating Restaurant Information");
      }
    } catch (e) {
      print(e.toString());
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
  }

  Future updateRestaurantData(
      name,
      website,
      facebook,
      officemail,
      twitter,
      instagram,
      tiktok,
      linkedin,
      externalmenu,
      phone,
      whatsappnumber,
      videoid,
      countryid,
      region,
      city,
      address,
      lat,
      lng,
      policy,
      additionalInfo,
      dressCode,
      vatPercent,
      executiveChef,
      cuisine,
      deliveryNote,
      currencyId,
      timezoneId,
      takeAwayEnabled,
      dineInEnabled,
      deliveryEnabled) async {
    var id = int.parse(resIdConst);
    var url = Api.$BASE_URL + Endpoints.updateResData;
    // +
    // "?id=$id=$name&website=$website&facebook=$facebook&office_email=$officemail&twitter=$twitter&instagram=$instagram&tiktok=$tiktok&linked_in=$linkedin&external_menu=$externalmenu&phone=$phone&whats_app_number=$whatsappnumber&video_id=$videoid&country_id=$countryid&region=$region&city=$city&address=$address&lng=$lng&lat=$lat&policy=$policy&additional_info=$additionalInfo&dress_code=$dressCode&vat_percent=$vatPercent&executive_chef=$executiveChef&cuisine=$cuisine&delivery_note=$deliveryNote&currency_id=$currencyId&timezone_id=$timezoneId&take_away_enabled=$takeAwayEnabled&dine_in_enabled=$dineInEnabled&delivery_enabled=$deliveryEnabled";

    var token = await storage.read(key: "token");
    print(url);
    Map<String, dynamic> body = {
      "id": id,
      "name": name,
      "website": website,
      "facebook": facebook,
      "office_email": officemail,
      "twitter": twitter,
      "instagram": instagram,
      "tiktok": tiktok,
      "linked_in": linkedin,
      "external_menu": externalmenu,
      "phone": phone,
      "whats_app_number": whatsappnumber,
      "video_id": videoid,
      "country_id": countryid,
      "region": region,
      "city": city,
      "address": address,
      "lng": lng,
      "lat": lat,
      "policy": policy,
      "additional_info": additionalInfo,
      "dress_code": dressCode,
      "vat_percent": vatPercent,
      "executive_chef": executiveChef,
      "cuisine": cuisine,
      "delivery_note": deliveryNote,
      "currency_id": currencyId,
      "timezone_id": timezoneId,
      "take_away_enabled": takeAwayEnabled,
      "dine_in_enabled": dineInEnabled,
      "delivery_enabled": deliveryEnabled
    };
    print(token);
    print("res details ${body.toString()}");

    try {
      final response = await http.post(url,
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
          body: json.encode(body));
      if (response.statusCode == 200) {
        GetSnackbars().successSnackbar("Success", "Restaurant Information Updated!");
      } else {
        print("rest update error code ${response.statusCode}");
        print("rest update error messs ${response.body}");

        GetSnackbars().errorSnackbar("Error", "Error Updating Restaurant Information");
      }
    } catch (e) {
      print(e.toString());
      GetSnackbars().errorSnackbar("Error", e.toString());
    }
  }

  Future<CustomerListModel> getCustomerList() async {
    var url = Api.$BASE_URL + Endpoints.getCustomerList;
    var token = await storage.read(key: "token");
    // try {
    //   final response =
    //       await http.get(url, headers: {"Authorization": "Bearer $token"});
    //   if (response.statusCode == 200) {
    //     var res = jsonDecode(response.body);
    //     if (res['message'] == "Restaurant customers") {
    //       return CustomerListModel.fromJson(res);
    //     } else {
    //       GetSnackbars().errorSnackbar("Error", "Error fetching customer list");
    //     }
    //   }
    // } catch (e) {
    //   print(e.toString());
    //   GetSnackbars().errorSnackbar("Error", e.toString());
    // }

    final response = await http.get(url, headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      if (res['message'] == "Restaurant customers") {
        return CustomerListModel.fromJson(res);
      } else {
        GetSnackbars().errorSnackbar("Error", "Error fetching customer list");
      }
    }
  }

  Future updateOpeningAndClosingTime(day, time_from, time_to, operating_id) async {
    var token = await storage.read(key: "token");
    var url = Api.$BASE_URL +
        Endpoints.updateRestaurantOpeningHour +
        "?day=$day&time_from=$time_from&time_to=$time_to";
    print(day);
    print(token);
    print(url);
    print(time_to);
    print(time_from);
    print(operating_id);
    try {
      final response = await http.patch(url, headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
        "Accept": "application/json"
      });
      var res = jsonDecode(response.body);
      print(res);
      if (response.statusCode == 200) {
        print(res);
        GetSnackbars().successSnackbar("Success", "Updated time successfully.");
      } else {
        print(res);
        GetSnackbars().errorSnackbar("Error", "Unable to update time.");
      }
    } catch (e) {
      // print(e);
      GetSnackbars().errorSnackbar("Error", "Check your connection.");
    }
  }
}
