import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/networking/core/services/feedback_services/discount_services.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:get/get.dart';
import 'package:order_tracker/utils/margin.dart';

import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:order_tracker/view/screens/settingsScreens/feedback_options.dart';

class RedeemTravponScreen extends StatefulWidget {
  @override
  _RedeemTravponScreenState createState() => _RedeemTravponScreenState();
}

class _RedeemTravponScreenState extends State<RedeemTravponScreen> {
  final _codeController = TextEditingController();
  final _amountController = TextEditingController();

  DiscountService _discountService = Get.put(DiscountService());

  Future redeemCoupon() async {
    if (_codeController.text.isEmpty || _amountController.text.isEmpty) {
      setState(() {
        isSubmit = false;
      });
      return;
    }

    await _discountService.redeemTravPonDiscount(
        _codeController.text, int.parse(_amountController.text));

    if (_discountService.gettravponRedeemResp['message'] ==
        "Travpon redeem succesfully") {
      Get.dialog(Dialog(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.44,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YMargin(5),
                Container(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.check_circle_outline_outlined,
                    size: 50,
                    color: green,
                  ),
                ),
                YMargin(10),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Travpon Redeemed Successfully',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                YMargin(10),
                Text(
                  'Travpon details',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: redColor),
                ),
                ListTile(
                  title: Text(
                    'Travpon code',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  trailing: Text(_discountService.gettravponRedeemResp['data']
                      ['coupon_code']),
                ),
                Divider(
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'Percentage',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  trailing: Text(_discountService.gettravponRedeemResp['data']
                              ['value']
                          .toString() +
                      '%'),
                ),
                Divider(
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'Amount',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  trailing: Text(_discountService
                      .gettravponRedeemResp['discount_off']
                      .toString()),
                ),
              ],
            ),
          ),
        ),
      ));

      Future.delayed(
          Duration(seconds: 3), () => Get.off(() => FeedBackOptions()));
    } else {
      Get.snackbar('Invalid travpon', 'This travpon is invalid',
          colorText: white,
          backgroundColor: redColor,
          snackPosition: SnackPosition.TOP);
      setState(() {
        isSubmit = false;
      });
      return;
    }
  }

  bool isSubmit = false;

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
            'Redeem Travpon',
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
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              YMargin(5),
              Text(
                'Fill the boxes below to redeem travpon',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              YMargin(30),
              TextField(
                controller: _codeController,
                decoration: InputDecoration(
                    hintText: 'Travpon code',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              YMargin(20),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Amount',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
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
                      onPressed: () async {
                        setState(() {
                          isSubmit = isSubmit ? false : true;
                        });
                        await redeemCoupon();
                        print(_discountService.disCountStatus);
                      },
                      child: isSubmit
                          ? Container(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                //color: white,
                              ),
                            )
                          : Text('Redeem Travpon')))
            ],
          ),
        ));
  }
}
