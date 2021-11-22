import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/utils/snackbars.dart';
import 'package:order_tracker/view/screens/bottomNavScreens/notifications_screens/incoming_notification_animation/notification_bell_painter.dart';

import 'get_directions_page.dart';
import 'incoming_notification_animation/curve_wave.dart';

class NotificationDetails extends StatefulWidget {
  const NotificationDetails({
    Key key,
    this.size = 80.0,
    this.color = Colors.red,
    this.onPressed,
    this.child,
  }) : super(key: key);
  final double size;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;
  @override
  _NotificationDetailsState createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                widget.color,
                Color.lerp(widget.color, Colors.black, .05)
              ],
            ),
          ),
          child: ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const CurveWave(),
                ),
              ),
              child: Text(
                "Delivery".tr,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        elevation: 0,
        title: Text(
          "Incoming Order".tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          YMargin(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 100,
                margin: const EdgeInsets.only(left: 20, right: 20),
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        "reject".toUpperCase().tr,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // YMargin0),
          Center(
            child: CustomPaint(
              painter: NotificationBellPainter(
                _controller,
                color: widget.color,
              ),
              //             child: CircleAvatar(
              //   minRadius: 60,
              //   maxRadius: 120,
              //   backgroundColor: Theme.of(context).primaryColor,
              //   child: Center(
              //     child: Icon(
              //       FontAwesomeIcons.solidBell,
              //       size: 140,
              //     ),
              //   ),
              // ),
              child: SizedBox(
                  width: widget.size * 4.125,
                  height: widget.size * 4.125,
                  child: _button()),
            ),
          ),
          YMargin(50),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Payment Method: ".tr,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                XMargin(5),
                Text(
                  "Cash ${Emojis.moneyBag}".tr,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
            ),
          ),
          YMargin(20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Details: ".tr,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                XMargin(5),
                Text(
                  "Chicken Pizza",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          YMargin(20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Details: ".tr,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                XMargin(5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chicken Pizza",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Soda",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Fruit Salad",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            ),
          ),
          YMargin(20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Amount ".tr,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                XMargin(5),
                Text(
                  "\$250",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Spacer(),
                Text(
                  "Delivery Fee: ".tr,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                XMargin(5),
                Text(
                  "\$ -23.4",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
            ),
          ),

          YMargin(20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Customer:".tr,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                XMargin(5),
                Text(
                  "Frank B.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          YMargin(50),
          GestureDetector(
            onTap: () => getDirectionsDialog(context),
            child: Container(
              height: 70,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  "Accept".toUpperCase().tr,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // launchMap() async {
  //   if (await MapLauncher.isMapAvailable(MapType.google)) {
  //     await MapLauncher.showMarker(
  //       mapType: MapType.google,
  //       coords: Coords(37.759392, -122.5107336),
  //       title: "Directions",
  //       // description: description,
  //     );
  //   }
  // }

  getDirectionsDialog(BuildContext buildContext) => showDialog(
      context: buildContext,
      builder: (buildContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            width: MediaQuery.of(buildContext).size.width / 1.1,
            height: MediaQuery.of(buildContext).size.height / 4.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                YMargin(30),
                Center(
                  child: Text(
                    "Get Directions?".tr,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                YMargin(30),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                            Get.to(() => MapView());
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Yes".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      XMargin(15),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            GetSnackbars().errorSnackbar(
                                "Order Rejected", "You Rejected this Order");
                            Get.back();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "No".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
