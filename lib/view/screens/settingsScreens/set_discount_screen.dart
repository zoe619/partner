import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/networking/core/services/feedback_services/discount_services.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:get/get.dart';
import 'package:order_tracker/utils/margin.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SetDiscountScreen extends StatefulWidget {
  @override
  _SetDiscountScreenState createState() => _SetDiscountScreenState();
}

class _SetDiscountScreenState extends State<SetDiscountScreen> {
  final _titleController = TextEditingController();
  final _percentController = TextEditingController();

  DiscountService _discountService = Get.put(DiscountService());

  Future setCouponDiscount() async {
    if (_titleController.text.isEmpty || _percentController.text.isEmpty) {
      setState(() {
        isSubmit = false;
      });
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await _discountService.setDiscount(
        _titleController.text, int.parse(_percentController.text));

    if (_discountService.disCountStatus == 200) {
      Get.snackbar('Submitted successfully', 'Coupon service now active',
          backgroundColor: green,
          snackPosition: SnackPosition.TOP,
          colorText: white);
      setState(() {
        isSubmit = false;
        _title = prefs.getString('discountTitle');
        _pcnt = prefs.getString('discountPcnt');
      });
      // Get.to(() => DiscountDetailScreen());
    } else {
      Get.snackbar('Invalid details',
          'Unable to add discount. Please check your details again',
          backgroundColor: redColor, snackPosition: SnackPosition.TOP);
      return;
    }
  }

  String _title;
  String _pcnt;

  _getTitlePcnt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _title = prefs.getString('discountTitle') ?? "";
      _pcnt = prefs.getString('discountPcnt') ?? "";
      print(_title);
    });
  }

  @override
  void initState() {
    super.initState();
    _getTitlePcnt();
  }

  bool isSubmit = false;
  bool isDisabled = false;

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
            'Set Discount',
            style: GoogleFonts.quicksand(
              color: redColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                YMargin(5),
                Text(
                  'Add New Feedback Coupon',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                YMargin(10),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                              hintText: 'Coupon Title',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        YMargin(15),
                        TextField(
                          controller: _percentController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Percentage Discount (%)',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        YMargin(20),
                        Container(
                            // width: double.maxFinite,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            side: BorderSide(
                                                color: Colors.red)))),
                                onPressed: () async {
                                  setState(() {
                                    isSubmit = isSubmit ? false : true;
                                  });
                                  await setCouponDiscount();
                                  print(_discountService.disCountStatus);
                                },
                                child: isSubmit
                                    ? Container(
                                        height: 7,
                                        width: 7,
                                        child: CircularProgressIndicator(
                                         // color: white,
                                        ),
                                      )
                                    : Text('Submit'))),
                      ],
                    ),
                  ),
                ),
                YMargin(35),
                _title == "" || _title == null
                    ? Container()
                    : Text('Discount details',
                        style: TextStyle(
                            // color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                YMargin(5),
                _title == "" || _title == null
                    ? Container()
                    : Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: Colors.red[500],
                                    borderRadius: BorderRadius.circular(18)),
                                child: Text('Lastest Feedback Travpon',
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                              ListTile(
                                  title: Text('Title'),
                                  trailing: Text(_title ?? "")),
                              Divider(
                                thickness: 2,
                              ),
                              ListTile(
                                  title: Text('Percentage (%)'),
                                  trailing: Text(_pcnt ?? '')),
                              Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  // width: double.maxFinite,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 20)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  side: BorderSide(
                                                      color: Colors.red)))),
                                      onPressed: () async {
                                        await _discountService
                                            .disableDiscount();
                                        setState(() {
                                          isDisabled =
                                              isDisabled ? false : true;
                                        });
                                        Future.delayed(Duration(seconds: 3),
                                            () {
                                          setState(() {
                                            _title = '';
                                            isDisabled = false;
                                          });
                                        });
                                        // await setCouponDiscount();
                                        // print(_discountService.disCountStatus);
                                      },
                                      child: isDisabled
                                          ? Container(
                                              height: 7,
                                              width: 7,
                                              child: CircularProgressIndicator(
                                               // color: white,
                                              ),
                                            )
                                          : Text('Disable'))),
                            ],
                          ),
                        ))
              ],
            ),
          ),
        ));
  }
}
