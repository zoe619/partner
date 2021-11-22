import 'dart:developer';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yaml/yaml.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/networking/core/services/misc_service.dart';
import 'package:order_tracker/networking/core/services/orders_service.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/authScreens/signIn.dart';
import 'package:order_tracker/view/screens/settingsScreens/comments_page.dart';
import 'package:order_tracker/view/screens/settingsScreens/feedback.dart';
import 'package:order_tracker/view/screens/settingsScreens/feedback_options.dart';
import 'package:order_tracker/view/screens/settingsScreens/opening_closing_time_screen.dart';
import 'package:slider_button/slider_button.dart';

import 'delivery_settings.dart';

class SettingsBar extends StatefulWidget {
  @override
  _SettingsBarState createState() => _SettingsBarState();
}

class _SettingsBarState extends State<SettingsBar> {
  var isOnline;
  isUserOnline() async {
    isOnline = await storage.read(key: "isOnline");
    log(isOnline.toString() + isOnline.runtimeType.toString());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    isUserOnline();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          title: Text(
            'Settings'.tr,
            style: GoogleFonts.quicksand(
              color: redColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (BuildContext bc) => [
                // PopupMenuItem(
                //   child: Text("FAQ"),
                // ),
                PopupMenuItem(
                  child: Text("Logout".tr),
                  value: '/logout',
                ),
              ],
              onSelected: (route) {
                switch (route) {
                  case '/logout':
                    storage.deleteAll();
                    Get.to(() => SignIn());
                    break;
                }
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            YMargin(30),
            SettingsCard(
              title: "Business Time".tr,
              leadingIcon: FontAwesomeIcons.solidClock,
              onTap: () => Get.to(() => OpeningClosingTime()),
            ),
            YMargin(10),
            SettingsCard(
              title: "Comment management".tr,
              leadingIcon: FontAwesomeIcons.comment,
              onTap: () {
                Get.to(() => CommentScreen());
              },
            ),
            YMargin(10),
            SettingsCard(
              title: "Delivery Settings".tr,
              leadingIcon: FeatherIcons.settings,
              onTap: () {
                // Get.to(() => DeliverySettings());
                Get.bottomSheet(DeliverySettings());
              },
            ),
            YMargin(10),
            SettingsCard(
              title: "Feedback".tr,
              leadingIcon: Icons.feedback,
              onTap: () {
                Get.to(() => FeedBackOptions());
              },
            ),
            YMargin(10),
            Padding(
              padding:
              const EdgeInsets.only(left: 10.0, right: 10, top: 10),
              child: Center(
                child: Card(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    // height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    child: ListTile(
                      title: FutureBuilder(
                          future: rootBundle.loadString("pubspec.yaml"),
                          builder: (context, snapshot) {
                            String version = "Unknown";
                            if (snapshot.hasData) {
                              var yaml = loadYaml(snapshot.data);
                              version = yaml["version"];
                            }else{
                              version = '';
                            }

                            return Container(
                              child: Text(
                                  'App Version: $version'.replaceAll('+', '.')
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SliderButton(
                dismissible: false,
                action: () {
                  isOnline == "true"
                      ? OrderService().goOfflineorOnline(false)
                      : OrderService().goOfflineorOnline(true);
                  isUserOnline();
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {});
                  });
                },
                label: Text(
                  isOnline == "true" ? "go offline".toUpperCase().tr : "GO ONLINE".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                icon: Center(
                  child: Icon(
                    FontAwesomeIcons.angleDoubleRight,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
                boxShadow: BoxShadow(),
                shimmer: false,
                width: 244,
                height: 60,
                radius: 20,
                buttonColor: isOnline == "true" ? Colors.red : Colors.green,
                backgroundColor: isOnline == "true" ? Colors.red : Colors.green,
                highlightedColor: Colors.white,
                baseColor: Colors.amber.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback onTap;
  final bool iconShow;
  const SettingsCard({
    Key key,
    this.title,
    this.leadingIcon,
    this.iconShow,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: ListTile(
            leading: iconShow == true ? null : Icon(leadingIcon),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            trailing: RotatedBox(
              quarterTurns: 2,
              child: Icon(
                Icons.arrow_back_ios,
                color: black.withOpacity(0.7),
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
