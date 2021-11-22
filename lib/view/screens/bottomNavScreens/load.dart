import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/order_screens/my_pending_orders.dart';
import 'package:order_tracker/view/screens/order_screens/orders_bar.dart';

class LoadNew extends StatefulWidget {
  @override
  _LoadNewState createState() => _LoadNewState();
}

class _LoadNewState extends State<LoadNew> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      Get.to(() => PendingOrders());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight(context, percent: 1),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
