import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/model/restaurant_order_model.dart' as res;
import 'package:order_tracker/networking/core/services/orders_service.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

import 'orders_details.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  OrderService _orderService = Get.put(OrderService());
  ScrollController _scrollController = ScrollController();
  int numberOfElementsAddedFromRegroupList = 1;

  Future<res.RestaurantOrderModel> _future;
  bool isLoading = true, showLoader = false, isFirstLoading = false;
  int page = 1;
  bool hasRegrouped = false;

  List<List<res.Data>> regroupedResList = [];
  List<res.Data> mainList = [];
  List<res.Data> childList = [];
  var lastPageNumber = 0;

  @override
  void initState() {
    super.initState();
    _future = _getOrders();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // if (numberOfElementsAddedFromRegroupList < regroupedResList.length) {
        setState(() {
          showLoader = true;
          page = page + 1;
        });
        _future = _getOrders();
      }
    });
  }

  Future<res.RestaurantOrderModel> _getOrders() async {
    var d = await _orderService.getRestaurantOrders(page, restaurantLoad.data.seoUrl);
    if (d.data != null) {
      isLoading = false;
    }
    // Timer(Duration(seconds: 3), () {
    setState(() {
      showLoader = false;
      // childList = regroupedResList[numberOfElementsAddedFromRegroupList - 1];
      mainList.addAll(d.data);

      numberOfElementsAddedFromRegroupList++;
    });
    // });
    return d ?? res.RestaurantOrderModel(data: []);
  }

  Future<void> _onref() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _future = _getOrders();
    });
  }

  double position;
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: FutureBuilder<res.RestaurantOrderModel>(
        future: _future,
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          // } else
          // if (snapshot.hasData == false || snap) {
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
          // } else {

          if (isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // List<res.Data> restaurants = snapshot.data.data;
            // if (!hasRegrouped) {
            //   regroupedResList.clear();
            //   for (int i = 0; i < restaurants.length; i += 15) {
            //     var sublist = i + 15 > restaurants.length
            //         ? restaurants.sublist(i, restaurants.length)
            //         : restaurants.sublist(i, i + 15);
            //     regroupedResList.add(sublist);
            //   }
            //   if (regroupedResList.isNotEmpty) {
            //     mainList.addAll(regroupedResList.first);
            //   }
            //   hasRegrouped = true;
            // }
            if (mainList.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RefreshIndicator(
                  onRefresh: _onref,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        YMargin(10),
                        ...List.generate(mainList.length, (index) {
                          return OrderWidget(
                            time: mainList[index].humanTime,
                            // DateTime.parse("${mainList[index].createdAt}").toLocal().toString(),
                            onTap: () {
                              // if (mainList[index].items.isEmpty) {
                              if (mainList[index].orderDetail.deliveryMethod == "delivery") {
                                Get.to(
                                  () => OrderDetails(
                                    customerImage: "No Image",
                                    customerName: mainList[index].orderDetail.customerName,
                                    isDelivery: true,
                                    deliveryFee: mainList[index].items == null
                                        ? ""
                                        : mainList[index]
                                            .items[0]
                                            .bookingItemable
                                            .discount
                                            .toString(),
                                    orderId: mainList[index].id.toString(),
                                    status: mainList[index].orderState,
                                    deliveryDate: mainList[index].humanTime,
                                    itemName: mainList[index].items == null
                                        ? ""
                                        : mainList[index].items[0].bookingItemable.name,
                                    orderState: "${mainList[index].orderState}",
                                    itemPrice: mainList[index].items == null
                                        ? ""
                                        : mainList[index].items[0].bookingItemable.price.toString(),
                                    discount: mainList[index].items == null
                                        ? ""
                                        : mainList[index]
                                                    .items[0]
                                                    .bookingItemable
                                                    .discount
                                                    .toString() ==
                                                null
                                            ? "\$0"
                                            : mainList[index]
                                                .items[0]
                                                .bookingItemable
                                                .discount
                                                .toString(),
                                    orderAddress: mainList[index].orderDetail.address,
                                    orderDescription: mainList[index].items == null
                                        ? ""
                                        : mainList[index].orderDetail.comment == null
                                            ? "No comment"
                                            : mainList[index].orderDetail.comment,
                                    courierComment: mainList[index].orderDetail.commentToCourier,
                                  ),
                                );
                              } else {
                                Get.to(
                                  () => OrderDetails(
                                    courierComment: mainList[index].orderDetail.commentToCourier,
                                    customerImage: "No Image",
                                    isDelivery: false,
                                    deliveryFee: mainList[index].items == null
                                        ? ""
                                        : mainList[index]
                                            .items[0]
                                            .bookingItemable
                                            .discount
                                            .toString(),
                                    orderState: mainList[index].orderState,
                                    orderId: mainList[index].id.toString(),
                                    status: mainList[index].bookingStatusId.toString(),
                                    deliveryDate: mainList[index].humanTime,
                                    itemName: mainList[index].items == null
                                        ? ""
                                        : mainList[index].items[0].bookingItemable.name,
                                    itemPrice: mainList[index].items == null
                                        ? ""
                                        : mainList[index].items[0].bookingItemable.price.toString(),
                                    discount: mainList[index].items == null
                                        ? ""
                                        : mainList[index]
                                                    .items[0]
                                                    .bookingItemable
                                                    .discount
                                                    .toString() ==
                                                null
                                            ? "\$0"
                                            : mainList[index]
                                                .items[0]
                                                .bookingItemable
                                                .discount
                                                .toString(),
                                    customerName: mainList[index].orderDetail.customerName,
                                    orderAddress: mainList[index].orderDetail.address,
                                    orderDescription: mainList[index].items == null
                                        ? ""
                                        : mainList[index].orderDetail.comment == null
                                            ? "No comment"
                                            : mainList[index].orderDetail.comment,
                                  ),
                                );
                              }
                              // }
                            },
                            sn: "${mainList[index].id}",
                            method: "Delivery",
                            status: "${mainList[index].orderState}",
                          );
                        }),
                        if (showLoader)
                          Transform.scale(
                            scale: 0.5,
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  "No Orders Yet".tr,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              );
            }
          }
          // }
        },
      ),
    );
  }
}

class OrderWidget extends StatelessWidget {
  final String sn, method, status, time;
  final VoidCallback onTap;
  const OrderWidget({
    Key key,
    this.sn = "",
    this.method = "",
    this.status = "",
    this.time = "",
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
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
                title: Text(
                  "Order # $sn",
                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("$time"),
                trailing: Text(
                  status == "accept"
                      ? ""
                      : status == "reject"
                          ? "Rejected"
                          : "Pending",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: status == "accept"
                        ? Colors.green
                        : Theme.of(context).primaryColor.withOpacity(0.7),
                    fontSize: 14,
                  ),
                )
                //  Text(
                //   "View Details",
                //   style: TextStyle(fontSize: 12),
                // ),
                ),
          ),
        ),
        YMargin(20),
      ],
    );
  }
}
