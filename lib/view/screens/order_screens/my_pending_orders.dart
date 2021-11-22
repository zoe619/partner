import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/models/get_pending_ordes_model.dart' as res;
import 'package:order_tracker/networking/core/services/orders_service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';
import 'package:order_tracker/view/screens/order_screens/orders.dart';
import 'package:order_tracker/view/screens/order_screens/orders_details.dart';

import 'view_pending_orders.dart';

class PendingOrders extends StatefulWidget {
  const PendingOrders({Key key}) : super(key: key);

  @override
  _PendingOrdersState createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  OrderService _orderService = Get.put(OrderService());
  ScrollController _scrollController = ScrollController();
  int numberOfElementsAddedFromRegroupList = 1;

  Future<res.RestaurantPendingOrdersModel> _future;
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
      // }
    });
  }

  Future<res.RestaurantPendingOrdersModel> _getOrders() async {
    var d = await _orderService.getWaitingOrders(page, restaurantLoad.data.seoUrl);
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
    return d ?? res.RestaurantPendingOrdersModel(data: []);
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          "Waiting Orders".tr,
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<res.RestaurantPendingOrdersModel>(
        future: _future,
        builder: (context, snapshot) {
          if (isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data.data == [] || mainList.isEmpty) {
            return Center(
              child: Text(
                "No Orders".tr,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            );
          } else {
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
                            onTap: () {
                              // if (mainList[index].items.isEmpty) {
                              if (mainList[index].orderDetail.deliveryMethod == "delivery") {
                                Get.off(
                                  () => PendingOrderDetails(
                                    customerImage: "No Image",
                                    customerName: mainList[index].orderDetail.customerName,
                                    isDelivery: true,
                                    deliveryFee: "",
                                    orderId: mainList[index].id.toString(),
                                    status: mainList[index].orderState,
                                    deliveryDate: mainList[index].humanTime,
                                    itemName: "",
                                    orderState: "${mainList[index].orderState}",
                                    itemPrice: "",
                                    discount: "",
                                    orderAddress: mainList[index].orderDetail.address,
                                    orderDescription: "",
                                    courierComment: mainList[index].orderDetail.commentToCourier,
                                  ),
                                );
                              } else {
                                Get.off(
                                  () => PendingOrderDetails(
                                    courierComment: mainList[index].orderDetail.commentToCourier,
                                    customerImage: "No Image",
                                    isDelivery: false,
                                    deliveryFee: "",
                                    orderState: mainList[index].orderState,
                                    orderId: mainList[index].id.toString(),
                                    status: mainList[index].bookingStatusId.toString(),
                                    deliveryDate: mainList[index].humanTime,
                                    itemName: "",
                                    itemPrice: "",
                                    discount: "",
                                    customerName: mainList[index].orderDetail.customerName,
                                    orderAddress: mainList[index].orderDetail.address,
                                    orderDescription: "",
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
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
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
