import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/order_screens/completed_online_orders.dart';
import 'package:order_tracker/view/screens/order_screens/my_offline_orders.dart';
import 'package:order_tracker/view/screens/order_screens/orders.dart';
import 'package:get/get.dart';

class OrdersBar extends StatefulWidget {
  @override
  _OrdersBarState createState() => _OrdersBarState();
}

class _OrdersBarState extends State<OrdersBar>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  TabController _tabController;

  bool shouldKeepAlive = true;
  @override
  bool get wantKeepAlive => shouldKeepAlive;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: SpeedDial(
      //   icon: Icons.add,
      //   activeIcon: Icons.close,
      //   overlayColor: Colors.black,
      //   children: [
      //     SpeedDialChild(
      //       backgroundColor: redColor,
      //       label: "Offline Ordering",
      //       onTap: () {
      //         Get.to(() => RequestCustomerLocation());
      //       },
      //       child: Icon(
      //         Mdi.bikeFast,
      //         color: Colors.white,
      //       ),
      //     ),
      //   ],
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          "Orders".tr,
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YMargin(10),
            Container(
              height: 30,
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: redColor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Online Orders'.tr,
                  ),
                  Tab(
                    text: 'Completed'.tr,
                  ),
                  Tab(
                    text: 'Offline Orders'.tr,
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  OrdersScreen(),
                  CompletedOnlineOrders(),
                  MyOfflineOrders(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
