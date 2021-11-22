import 'package:flutter/material.dart';
import 'package:order_tracker/model/payouts_model.dart';
import 'package:order_tracker/networking/core/services/dashboard_service.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';
import 'package:get/get.dart';

class PayoutReport extends StatefulWidget {
  const PayoutReport({Key key}) : super(key: key);

  @override
  _PayoutReportState createState() => _PayoutReportState();
}

class _PayoutReportState extends State<PayoutReport> {
  DashboardService _dashboardService = Get.put(DashboardService());

  Future _reportsFuture;
  @override
  void initState() {
    super.initState();
    _reportsFuture = _dashboardService.getPaymentHistoryModel(1);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ReportsPayoutHistory>(
        future: _reportsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  // YMargin(20),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 1,
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "Payouts".tr,
                                style: TextStyle(
                                    fontFamily: "popmedium",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Spacer(),
                            ],
                          ),
                          YMargin(10),
                          Divider(color: Colors.grey),
                          YMargin(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Current payout balance".tr,
                                style: TextStyle(fontFamily: "popmedium"),
                              ),
                              Text(
                                "${restaurantLoad.data.currency == null ? "" : restaurantLoad.data.currency.symbol} ${snapshot.data.payoutBalance ?? "0.00"}",
                                style: TextStyle(fontFamily: "popbold", fontSize: 20),
                              ),
                            ],
                          ),
                          YMargin(5),
                          Text(
                            "Only credit card transactions".tr,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
