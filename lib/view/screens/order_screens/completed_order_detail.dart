import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class CompletedOrderDetail extends StatefulWidget {
  final String orderId,
      itemName,
      itemPrice,
      discount,
      status,
      deliveryFee,
      deliveryDate,
      customerName,
      orderAddress,
      customerImage,
      orderDescription,
      orderState;

  final bool isAudioOrder, isDelivery;
  const CompletedOrderDetail(
      {Key key,
      this.orderState,
      this.orderId,
      this.itemName,
      this.orderAddress,
      this.orderDescription,
      this.itemPrice,
      this.discount,
      this.status,
      this.deliveryDate,
      this.customerName,
      this.customerImage,
      this.isAudioOrder,
      this.isDelivery,
      this.deliveryFee})
      : super(key: key);

  @override
  _CompletedOrderDetailState createState() => _CompletedOrderDetailState();
}

class _CompletedOrderDetailState extends State<CompletedOrderDetail> {
  var total = 0.0;

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
          "Order Details".tr,
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YMargin(30),
              Text(
                "Order # ".tr + widget.orderId,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Status:".tr,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                  ),
                  XMargin(5),
                  Text(
                    widget.status == "1" ? "Accepted".tr : "Rejected".tr,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                  ),
                  YMargin(30),
                  Text(
                    "Date:".tr,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                  ),
                  XMargin(5),
                  Text(
                    widget.deliveryDate,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              YMargin(40),
              widget.isAudioOrder == true
                  ? Container()
                  : Container(
                      width: double.maxFinite,
                      height: 40,
                      color: grey.shade200,
                      child: Center(
                        child: Text(
                          "ORDER SUMMARY".tr,
                          style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
              YMargin(20),
              widget.isAudioOrder == true
                  ? Container()
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          child: Center(
                            child: Text(
                              "O" + widget.orderId.substring(0, 2),
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          radius: 24,
                        ),
                        XMargin(5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.itemName,
                              style:
                                  GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              widget.orderDescription,
                              style: GoogleFonts.montserrat(fontSize: 12),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          "\$" + widget.itemPrice,
                          style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
              YMargin(20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Subtotal".tr,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "\$" + widget.itemPrice,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              YMargin(5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Discount".tr,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  Text(
                    widget.discount == null ? "\$0" : "\$" + widget.discount,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              YMargin(5),
              widget.isDelivery == true
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Delivery Fee".tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        Text(
                          widget.deliveryFee == "null" ? "\$0" : "\$" + widget.deliveryFee,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
              YMargin(5),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Total".tr,
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "\$" + total.toString(),
                    style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              widget.isDelivery == true ? YMargin(10) : YMargin(5),
              Container(
                width: double.maxFinite,
                height: 40,
                color: grey.shade200,
                child: Center(
                  child: Text(
                    "CUSTOMER DETAILS".tr,
                    style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              YMargin(20),
              widget.isDelivery == true
                  ? Text("Delivered to customer".tr)
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.customerImage == "No Image"
                            ? CircleAvatar(
                                child: Center(
                                  child: Text(
                                    widget.customerName.substring(0, 3).toUpperCase(),
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                radius: 24,
                              )
                            : CircleAvatar(
                                backgroundImage: NetworkImage(widget.customerImage),
                                radius: 24,
                              ),
                        XMargin(5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.customerName,
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                              widget.isAudioOrder == true
                                  ? SizedBox()
                                  : Text(
                                      widget.orderAddress,
                                      style: GoogleFonts.montserrat(fontSize: 12),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
              YMargin(50),
              Container(
                width: double.maxFinite,
                height: 40,
                color: grey.shade200,
                child: Center(
                  child: Text(
                    "ORDER NOTE".tr,
                    style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              YMargin(20),
              Text(
                widget.orderDescription,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                ),
              ),
              YMargin(50),
              widget.isDelivery == true
                  ? Container(
                      width: double.maxFinite,
                      height: 40,
                      color: grey.shade200,
                      child: Center(
                        child: Text(
                          "COURIER DETAILS".tr,
                          style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              widget.isDelivery == true ? YMargin(20) : SizedBox.shrink(),
              widget.isDelivery == true
                  ? Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Courier Name".tr,
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                              ),
                            ),
                            YMargin(10),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "+125464456".tr,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                  ),
                                ),
                                XMargin(5),
                                IconButton(
                                    icon: RotatedBox(
                                      quarterTurns: 1,
                                      child: Icon(FontAwesomeIcons.phone),
                                    ),
                                    onPressed: () => launch("tel://125464456")),
                                XMargin(5),
                                IconButton(
                                    icon: Icon(FontAwesomeIcons.solidCommentAlt),
                                    onPressed: () => launch("sms:125464456"))
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 30,
                          child: Center(
                            child: Text("CN"),
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
              widget.isDelivery == true ? YMargin(50) : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
