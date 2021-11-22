import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/networking/core/services/auth_service.dart';
import 'package:order_tracker/networking/core/services/feedback_services/discount_services.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';
import 'package:order_tracker/view/screens/settingsScreens/feedback.dart';
import 'package:order_tracker/view/screens/settingsScreens/redeem_travpon_screen.dart';
import 'package:order_tracker/view/screens/settingsScreens/set_discount_screen.dart';
import 'package:order_tracker/view/screens/settingsScreens/settings_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'opening_closing_time_screen.dart';

class FeedBackOptions extends StatefulWidget {
  const FeedBackOptions({Key key}) : super(key: key);

  @override
  _FeedBackOptionsState createState() => _FeedBackOptionsState();
}

class _FeedBackOptionsState extends State<FeedBackOptions> {
  bool _value = false;
  // bool df =
  //     restaurantLoad.data.discount == null || restaurantLoad.data.discount == 0
  //         ? false
  //         : true;
  DiscountService _discountService = Get.put(DiscountService());
  bool _isDisountEnabled = false;

  AuthService _authService = Get.put(AuthService());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('LOAD ${restaurantLoad.data.imageUrl}');
    _authService.getRestaurantData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          'Feedback options'.tr,
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YMargin(30),
            SettingsCard(
              title: "View Feedbacks".tr,
              iconShow: true,
              leadingIcon: FontAwesomeIcons.solidClock,
              onTap: () => Get.to(() => FeedbackScreen()),
            ),
            YMargin(10),
            // SettingsCard(
            //   title: "Set Discount".tr,
            //   leadingIcon: Icons.feedback,
            //   iconShow: true,
            //   onTap: () {
            //     Get.bottomSheet(

            //     );
            //   },
            // ),
            // YMargin(10),
            SettingsCard(
              title: "Redeem Travpon".tr,
              leadingIcon: Icons.feedback,
              iconShow: true,
              onTap: () {
                Get.to(() => RedeemTravponScreen());

                // redeemTravpon(context);
              },
            ),
            YMargin(10),
            SettingsCard(
              title: "Set Discount".tr,
              leadingIcon: Icons.feedback,
              iconShow: true,
              onTap: () {
                Get.to(() => SetDiscountScreen());
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   child: Container(
            //     height: 60,
            //     width: double.maxFinite,
            //     decoration: BoxDecoration(
            //       color: Colors.grey.withOpacity(0.2),
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(15),
            //       ),
            //     ),
            //     child: Center(
            //       child: SwitchListTile(
            //         value: _value,
            //         onChanged: (_) {
            //           setState(() {
            //             _value = _;
            //             _isDisountEnabled = _value;

            //             // _isDisountEn   abled
            //             //     ? setDiscount(context)
            //             //     : _discountService.disableDiscount();
            //           });
            //         },
            //         title: Text(
            //           "Discount",
            //           style: TextStyle(
            //             color: Colors.black,
            //           ),
            //         ),
            //         subtitle: Text(restaurantLoad.data.discount == null ||
            //                 restaurantLoad.data.discount == 0
            //             ? "Discount is turned off"
            //             : "${restaurantLoad.data.discount}%"),
            //       ),
            //     ),
            //   ),
            // ),
            // YMargin(10),
            // _isDisountEnabled
            //     ? SettingsCard(
            //         title: "Set Discount".tr,
            //         iconShow: true,
            //         leadingIcon: FontAwesomeIcons.solidClock,
            //         onTap: () => Get.to(() => SetDiscountScreen()),
            //       )
            //     : Container(),
          ],
        ),
      ),
    );
  }

  TextEditingController redeemController = TextEditingController();
  redeemTravpon(BuildContext buildContext, {previousDistance}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: StatefulBuilder(builder: (context, state) {
          return Container(
            width: MediaQuery.of(buildContext).size.width / 1.1,
            height: MediaQuery.of(buildContext).size.height / 2.5,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.mi,
              children: [
                YMargin(10),
                Text(
                  "Redeem Travpon Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                YMargin(40),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: redeemController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Code",
                        ),
                      ),
                      YMargin(15),
                      TextButton(
                        onPressed: () async {
                          // await _discountService
                          //     .redeemTravPonDiscount(redeemController.text);
                        },
                        child: Center(
                          child: Text(
                            "Redeem",
                            style:
                                TextStyle(fontSize: 16, fontFamily: "popbold"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
