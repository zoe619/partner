import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_pusher/pusher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/utils/constants.dart';

//final hostsocketResponse = StreamController.broadcast();
final courierOrderResponse = StreamController.broadcast();

var getOrderData = [].obs;

//Pusher service for the Order User
class OrderTrackingService extends GetxController {
  //Channel channel;
  Future<void> disConnect({@required var ORDER_ID}) async {
    getOrderData.clear();
    Pusher.unsubscribe('order.' + ORDER_ID);
    Pusher.disconnect();
  }

  Future<void> initPusher(
      {@required String APPKEY,
      @required String HOST,
      @required int PORT,
      @required var ORDER_ID}) async {
    var token = await storage.read(key: "token");

    print('order.' + ORDER_ID);
    try {
      await Pusher.init(
          "$APPKEY",
          PusherOptions(
            cluster: "eu",
            auth: new PusherAuth(
              "${Api.$BASE_PUSHER_URL}",
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer ' + token,
              },
            ),
            host: HOST,
            port: PORT,
          ),
          enableLogging: true);
    } on PlatformException catch (e) {
      print('e.message: ' + e.message);
    }
    Pusher.connect(onConnectionStateChange: (val) {
      print('Pusher Connection State ${val.currentState}');
      print('CONNECTED CONFIRMATION: ' + ORDER_ID.toString());
      if (val.currentState == "CONNECTED") {
        log("connected");

        Pusher.subscribe('order.' + ORDER_ID).then(
          (value) => {
            value.bind("courier_order", (onEvent) {
              Map<String, dynamic> eventJson = jsonDecode(onEvent.data);
              print(eventJson);
              getOrderData.insert(0, eventJson);
              courierOrderResponse.add(getOrderData);
              print("new courier " + eventJson.toString());
              print(onEvent.toString());
            }),
          },
        );
      } else {
        print("CONNECTION DISCONTINUED");
      }
    }, onError: (err) {
      print("Pusher Error State ${err.message}");
    });
  }
}
