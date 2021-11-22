import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/model/restaurant_orders_model.dart' as res;
import 'package:order_tracker/networking/core/services/orders_service.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';
import 'package:order_tracker/view/screens/order_screens/view_offline_order.dart';

import 'orders.dart';

class MyOfflineOrders extends StatefulWidget {
  const MyOfflineOrders({Key key}) : super(key: key);

  @override
  _MyOfflineOrdersState createState() => _MyOfflineOrdersState();
}

class _MyOfflineOrdersState extends State<MyOfflineOrders> {
  OrderService _orderService = Get.put(OrderService());
  ScrollController _scrollController = ScrollController();
  int numberOfElementsAddedFromRegroupList = 1;

  Future<res.RestaurantOfflineOrdersModel> _future;
  bool isLoading = true, showLoader = false, isFirstLoading = false;
  int page = 1;
  List _ordersList = [].obs;
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

  Future<res.RestaurantOfflineOrdersModel> _getOrders() async {
    var d = await _orderService.getOfflineRestaurantOrders(page, restaurantLoad.data.seoUrl);
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
    return d ?? res.RestaurantOfflineOrdersModel(data: []);
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
      body: FutureBuilder<res.RestaurantOfflineOrdersModel>(
        future: _future,
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          //  else
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
            if (mainList.isEmpty) {
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
                            time:
                                // DateTime.parse("${mainList[index].createdAt}").toLocal().toString(),

                                mainList[index].humanTime,
                            onTap: () {
                              Get.to(
                                () => ViewOfflineOrder(
                                  isDelivery: true,
                                  deliveryFee: double.parse(mainList[index].courierFee.toString())
                                      .toStringAsFixed(2),
                                  orderId: mainList[index].id.toString(),
                                  status: mainList[index].orderState,
                                  deliveryDate: mainList[index].humanTime,
                                  itemName: mainList[index].orderDetail.menu,
                                  orderState: mainList[index].orderState,
                                  itemPrice: mainList[index].total.toString(),
                                  discount: "${mainList[index].discount}",
                                  orderAddress: mainList[index].orderDetail.address,
                                  orderDescription: mainList[index].orderDetail.comment,
                                ),
                              );
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
