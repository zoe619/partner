import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/utils/margin.dart';

class OfflineDeliveryDetails extends StatefulWidget {
  const OfflineDeliveryDetails({Key key}) : super(key: key);

  @override
  _OfflineDeliveryDetailsState createState() => _OfflineDeliveryDetailsState();
}

class _OfflineDeliveryDetailsState extends State<OfflineDeliveryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Offline Delivery Details".tr,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          YMargin(20),
          Row(
            children: [Text("Offline details screen".tr)],
          ),
        ],
      ),
    );
  }
}
