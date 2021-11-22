import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:order_tracker/models/resOrderModel.dart';
import 'package:order_tracker/model/misc_country_model.dart' as msc;

import 'package:order_tracker/model/menu_category_model.dart' as menu_cat;
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

var checkToken, restaurantUrl;
String restCurrency =
    restaurantLoad.data.currency != null ? "${restaurantLoad.data.currency.symbol ?? ""}" : "";
final storage = new FlutterSecureStorage();
List<Data> allOrders = [];
// List<dynamic> orderName;
List<dynamic> comment, phoneNumber, address, orderdate, humantime, deliverymethod;
List<dynamic> quantity, total, orderId;
List<List<Items>> orderItems = [];
List<Audio> url;
List<User> lastName, orderName;
Color redColor = Color(0xffff041c);

String resName = "",
    resSeoUrl = "",
    resCountry = "",
    resCity = "",
    resParkingOption = "",
    resNumber = "",
    resWhatsappNumber = "",
    resBaseCurrency = "",
    resStreetAddress = "",
    resWebsite = "",
    resFacebook = "",
    resInstagram = "",
    resTwitter = "",
    resContactEmail = "",
    resFoodMenuLink = "",
    resLinkedIn = "",
    resPinterest = "",
    resTikTok = "",
    resUrl = "",
    resIdConst = "";

List<msc.Data> countryList = [];
List<menu_cat.Data> menuCategoryList = [];
List<Map<String, dynamic>> menuCategoryListMap = [];
List<Map<String, dynamic>> countryListMap = [];
var pageIncr = 0;
var countryPageMeta = 0;

// var deviceId = "";
var videoFile = "";
var fcmToken = "";

String personSilhouette =
    "https://drive.google.com/file/d/1wNWhwgZU8F7Yh89-HEf93fKylgUZWEBU/view?usp=sharing";
