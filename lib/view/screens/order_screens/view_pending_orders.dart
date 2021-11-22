import 'dart:developer';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/model/single_order_item_model.dart';
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/networking/core/services/order_tracking_services.dart';
import 'package:order_tracker/networking/core/services/orders_service.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/dropdown_values.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_pending_orders.dart';
import 'order_tracker.dart';

class PendingOrderDetails extends StatefulWidget {
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
      courierComment,
      orderState;

  final bool isAudioOrder, isDelivery;

  const PendingOrderDetails(
      {Key key,
      this.orderState,
      this.orderId,
      this.courierComment,
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
  _PendingOrderDetailsState createState() => _PendingOrderDetailsState();
}

class _PendingOrderDetailsState extends State<PendingOrderDetails> {
  var total = 0.0;
  String processMins;
  OrderService _orderService = Get.put(OrderService());
  Future<SingleOrderItemModel> _future;

  @override
  void initState() {
    super.initState();
    _future = _orderService.getSingleRestaurantOrders(restaurantLoad.data.seoUrl, widget.orderId);
    OrderTrackingService().initPusher(
        APPKEY: Api.$PUSHER_APIKEY,
        HOST: 'socket.travtubes.com',
        PORT: 443,
        ORDER_ID: widget.orderId);
  }

  bool isResponded = false;
  ValueNotifier<bool> _hasResponded = ValueNotifier(false);
  _updateErrorText() {
    _hasResponded.value = true;
  }

  @override
  void dispose() {
    super.dispose();
    OrderTrackingService().disConnect(ORDER_ID: widget.orderId);
  }

  Widget _buildAcceptButton(orderState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            bool isLoading = false;
            List<bool> isChecked = List.generate(myProcessJson.length, (index) => false);
            Get.dialog(
              StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(myProcessJson.length, (index) {
                          int prevIndex;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${myProcessJson[index]['name']}"),
                              Checkbox(
                                  value: isChecked[index],
                                  onChanged: (checked) {
                                    setState(() {
                                      if (index == prevIndex) {
                                        prevIndex = index;
                                        isChecked[index] = checked;
                                        processMins = myProcessJson[index]['value'];
                                      } else {
                                        prevIndex = index;
                                        isChecked[prevIndex] = false;
                                        isChecked[index] = checked;
                                        processMins = myProcessJson[index]['value'];
                                      }
                                    });
                                    log(processMins.toString());
                                  })
                            ],
                          );
                        }),
                      ],
                    ),
                    title: Text('Select an estimated prep time'),
                    actions: <Widget>[
                      isLoading == true
                          ? Container()
                          : InkWell(
                              child: Text('OK   '),
                              onTap: () async {
                                bool v =
                                    await _orderService.acceptOrder(widget.orderId, processMins);
                                if (v) {
                                  _hasResponded.value = true;

                                  // _updateErrorText();
                                  // setState(() {
                                  //   isResponded = true;
                                  // });
                                }
                              },
                            ),
                    ],
                  );
                },
              ),
            );
          },
          child: Container(
            width: 100,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Colors.green),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Accept".tr,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () async {
            Get.dialog(Container());
            bool v = await _orderService.rejectOrder(widget.orderId);
            if (v == true) {
              // _updateErrorText();
              _hasResponded.value = true;

              // setState(() {
              //   isResponded = true;
              // });
            }
          },
          child: Container(
            width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: Colors.red),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Reject".tr,
                style: TextStyle(color: Colors.white),
              ),
            )),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: Container(),
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
      body: WillPopScope(
        onWillPop: () async => Get.off(() => PendingOrders()),

        //  true,
        child: FutureBuilder<SingleOrderItemModel>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var data = snapshot.data.data;
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        YMargin(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order # " + "${data.id}",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                    ),
                                  ),
                                  YMargin(5),
                                  Row(
                                    children: [
                                      Text(
                                        "Date:",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                        ),
                                      ),
                                      XMargin(5),
                                      Text(
                                        "${widget.deliveryDate}",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Status:",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                        ),
                                      ),
                                      XMargin(5),
                                      Text(
                                        data.orderState == "accept"
                                            ? "Accepted"
                                            : data.orderState == "reject"
                                                ? "Rejected"
                                                : "Pending",
                                        style: GoogleFonts.montserrat(
                                          color: data.orderState == "accept"
                                              ? Colors.green
                                              : data.orderState == "reject"
                                                  ? Theme.of(context).primaryColor.withOpacity(0.7)
                                                  : Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  YMargin(30),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                data.courierOrder.isEmpty
                                    ? Container()
                                    : Row(
                                        children: [
                                          Icon(
                                            data.courierOrder.first.paymentMode == "cash".tr
                                                ? Icons.money
                                                : Icons.credit_card,
                                            color: Colors.green,
                                          ),
                                          XMargin(5),
                                          Text(
                                            "${data.courierOrder.first.paymentMode ?? "cash".tr}",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ],
                        ),
                        // isResponded == true ? Container() : _buildAcceptButton(widget.orderState),
                        ValueListenableBuilder(
                            valueListenable: _hasResponded,
                            builder: (BuildContext context, bool hasError, Widget child) {
                              if (_hasResponded.value == false) {
                                return _buildAcceptButton(widget.orderState);
                              } else {
                                return Container();
                              }
                            }),
                        YMargin(40),
                        widget.isAudioOrder == true
                            ? Container()
                            : Container(
                                width: double.maxFinite,
                                height: 40,
                                color: grey.shade200,
                                child: Center(
                                  child: Text(
                                    "ORDER SUMMARY",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18, fontWeight: FontWeight.w700),
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
                                        "#" + "${widget.orderId}",
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
                                      ...List.generate(
                                        data.items.length,
                                        (index) => Text(
                                          "${data.items[index].bookingItemable.name}",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14, fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      ...List.generate(
                                        data.items.length,
                                        (index) => Text(
                                          "$restCurrency " +
                                              "${data.items[index].bookingItemable.price}",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 16, fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        YMargin(20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Item Amount",
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "$restCurrency " +
                                  double.parse("${data.total ?? "0.00"}").toStringAsFixed(0),
                              style:
                                  GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        YMargin(5),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Discount",
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "- $restCurrency" + "${data.discount ?? "0.00"}",
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        YMargin(5),
                        widget.isDelivery == false
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Take-away Discount",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "- $restCurrency" + "${data.takeAwayDiscount ?? "0.00"}",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                        YMargin(5),
                        widget.isDelivery == true
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Delivery Fee",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "$restCurrency " +
                                        double.parse("${data.courierFee ?? "0.00"}")
                                            .toStringAsFixed(0),
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(),
                        YMargin(5),
                        widget.isDelivery == true ? YMargin(10) : YMargin(5),
                        Container(
                          width: double.maxFinite,
                          height: 40,
                          color: grey.shade200,
                          child: Center(
                            child: Text(
                              "CUSTOMER DETAILS",
                              style:
                                  GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        YMargin(20),
                        widget.isDelivery == false
                            ? Text("Take-away order")
                            : Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        child: Center(
                                          child: Text(
                                            "CU",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        radius: 24,
                                      ),
                                      XMargin(5),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${data.orderDetail.customerName ?? "Anonymous"}",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14, fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "${data.orderDetail.address}",
                                              style: GoogleFonts.montserrat(fontSize: 12),
                                              // overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  YMargin(20),
                                  data.orderDetail.phoneNumber == null
                                      ? SizedBox()
                                      : GestureDetector(
                                          onTap: () =>
                                              launch("tel://${data.orderDetail.phoneNumber}"),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Icon(FeatherIcons.phone),
                                                  XMargin(10),
                                                  Text(
                                                    "${data.orderDetail.phoneNumber ?? ""}",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
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
                              "ORDER NOTE",
                              style:
                                  GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        YMargin(20),
                        Text(
                          "Comment to restaurant",
                          style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "${data.orderDetail.comment ?? "No comment"}",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                          ),
                        ),
                        YMargin(10),
                        Text(
                          "Comment to courier",
                          style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "${data.orderDetail.commentToCourier ?? "No comment"}",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                          ),
                        ),
                        YMargin(50),
                        Container(
                          width: double.maxFinite,
                          height: 40,
                          color: grey.shade200,
                          child: Center(
                            child: Text(
                              "PAYMENT DETAILS",
                              style:
                                  GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        YMargin(20),
                        Text(
                          "Collect courier fee from customer".tr,
                          style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          data.orderDetail.collectPayment == 1 ? "Yes".tr : "No".tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                          ),
                        ),
                        data.courierOrder.isEmpty
                            ? SizedBox()
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  YMargin(10),
                                  Text(
                                    "Collect bill/check from customer".tr,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14, fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    data.courierOrder.first.collectInvoiceAmount == 1
                                        ? "Yes".tr
                                        : "No".tr,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                    ),
                                  ),
                                  YMargin(10),
                                ],
                              ),
                        widget.isDelivery == true ? YMargin(50) : SizedBox.shrink(),
                      ],
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }

  List<Map> _myJson = myProcessJson;
  _processMinsDropDown() {
    return Container(
      child: DropdownButton<String>(
        isExpanded: true,
        dropdownColor: Theme.of(context).backgroundColor,
        value: processMins,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 20,
        hint: new Text(
          "Select option".tr,
          style: TextStyle(color: Colors.black),
        ),
        style: TextStyle(color: Colors.black),
        elevation: 16,
        onChanged: (String newValue) {
          FocusScope.of(context).unfocus();
          setState(() {
            processMins = newValue;
          });
          print(newValue);
        },
        items: _myJson.map((Map map) {
          return new DropdownMenuItem<String>(
            value: map["value"],
            child: new Text(
              map["name"],
            ),
          );
        }).toList(),
      ),
    );
  }
}
