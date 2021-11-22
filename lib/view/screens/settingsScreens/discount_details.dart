import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/networking/core/services/feedback_services/discount_services.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:get/get.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

class DiscountDetailScreen extends StatefulWidget {
  @override
  _DiscountDetailScreenState createState() => _DiscountDetailScreenState();
}

class _DiscountDetailScreenState extends State<DiscountDetailScreen> {
  DiscountService _discountService = Get.put(DiscountService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          title: Text(
            'Discount details',
            style: GoogleFonts.quicksand(
              color: redColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YMargin(5),
              Card(
                elevation: 5,
                child: ListTile(
                  title: Text(
                    "Title: " +
                        _discountService.discountResponse['data']['title'],
                    style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      "Coupon Id: " +
                          _discountService.discountResponse['data']['coupon_id']
                              .toString(),
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
                ),
              ),
              YMargin(20),
              Container(
                  width: double.maxFinite,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 15)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: BorderSide(color: Colors.red)))),
                      onPressed: () {
                        Get.to(() => BottomNavigation());
                      },
                      child: Text('Confirm details')))
            ],
          ),
        ));
  }
}
