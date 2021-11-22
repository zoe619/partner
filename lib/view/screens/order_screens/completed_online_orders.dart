import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/model/completed_online_orders_model.dart' as res;
import 'package:order_tracker/networking/core/services/orders_service.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

import 'orders.dart';
import 'orders_details.dart';

class CompletedOnlineOrders extends StatefulWidget {
  const CompletedOnlineOrders({Key key}) : super(key: key);

  @override
  _CompletedOnlineOrdersState createState() => _CompletedOnlineOrdersState();
}

class _CompletedOnlineOrdersState extends State<CompletedOnlineOrders> {
  OrderService _orderService = Get.put(OrderService());
  ScrollController _scrollController = ScrollController();
  int numberOfElementsAddedFromRegroupList = 1;

  Future<res.CompletedOnlineOrdersModel> _future;
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
        setState(() {
          showLoader = true;
          page = page + 1;
        });
        _future = _getOrders();
      }
    });
  }

  Future<res.CompletedOnlineOrdersModel> _getOrders() async {
    var d = await _orderService.getCompletedRestaurantOrders(page, restaurantLoad.data.seoUrl);
    if (d.data != null) {
      isLoading = false;
    }
    setState(() {
      showLoader = false;
      mainList.addAll(d.data);

      numberOfElementsAddedFromRegroupList++;
    });
    return d ?? res.CompletedOnlineOrdersModel(data: []);
  }

  Future<void> _onref() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      showLoader = false;
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
      body: FutureBuilder<res.CompletedOnlineOrdersModel>(
        future: _future,
        builder: (context, snapshot) {
          if (isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (mainList.isEmpty) {
              return Center(
                child: Text(
                  "No Orders Completed".tr,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              );
            } else {
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
                                Get.to(
                                  () => OrderDetails(
                                    isDelivery: true,
                                    deliveryFee: mainList[index].items == null
                                        ? ""
                                        : mainList[index]
                                            .items[0]
                                            .bookingItemable
                                            .discount
                                            .toString(),
                                    orderId: mainList[index].id.toString(),
                                    status: mainList[index].bookingStatusId.toString(),
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
                                    orderAddress: mainList[index].items == null
                                        ? ""
                                        : mainList[index].items[0].bookingItemable.address == null
                                            ? "No Address"
                                            : mainList[index].items[0].bookingItemable.address,
                                    orderDescription: mainList[index].items == null
                                        ? ""
                                        : mainList[index].orderDetail.comment == null
                                            ? "No Note"
                                            : mainList[index].orderDetail.comment,
                                  ),
                                );
                              } else {
                                Get.to(
                                  () => OrderDetails(
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
                                    customerImage: mainList[index].user.userDetail.image == null
                                        ? "No Image"
                                        : mainList[index].user.userDetail.image,
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
                                    customerName: mainList[index].user.userDetail.firstName +
                                        " " +
                                        mainList[index].user.userDetail.lastName,
                                    orderAddress: mainList[index].items == null
                                        ? ""
                                        : mainList[index].items[0].bookingItemable.address == null
                                            ? "No Address"
                                            : mainList[index].items[0].bookingItemable.address,
                                    orderDescription: mainList[index].items == null
                                        ? ""
                                        : mainList[index].orderDetail.comment == null
                                            ? "No Note"
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
            }
          }
        },
      ),
    );
  }
}
