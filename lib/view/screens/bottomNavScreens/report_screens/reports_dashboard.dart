import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:order_tracker/model/dashboard_details_model.dart';
import 'package:order_tracker/model/payouts_model.dart';
import 'package:order_tracker/networking/core/services/dashboard_service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/bottomNavScreens/report_screens/widgets/top_selling_items_widget.dart';
import 'package:order_tracker/view/screens/bottomNavScreens/widgets/barchart_screen.dart';

class ReportsDashBoard extends StatefulWidget {
  const ReportsDashBoard({Key key}) : super(key: key);

  @override
  _ReportsDashBoardState createState() => _ReportsDashBoardState();
}

class _ReportsDashBoardState extends State<ReportsDashBoard> {
  Future _future;
  DashboardService _dashboardService = Get.put(DashboardService());
  Future _reportsFuture;

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  String _startDate, _endDate;
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    _future = _dashboardService.getDashboardDetailsModel();
    _reportsFuture = _dashboardService.getPaymentHistoryModel(1);
  }

  Future<Null> _selectStartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedStartDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1800),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedStartDate = picked;
        final DateFormat formatter = DateFormat('yyyy/MM/dd');
        startDateController.text = formatter.format(selectedStartDate);
      });
  }

  Future<Null> _selectEndDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedEndDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1800),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedEndDate = picked;
        final DateFormat formatter = DateFormat('yyyy/MM/dd');
        endDateController.text = formatter.format(selectedEndDate);
      });
  }

  // ignore: missing_return
  Future<DashboardDetailsModel> _onRef() async {
    setState(() {
      _future = _dashboardService.getDashboardDetailsModel();
      _reportsFuture = _dashboardService.getPaymentHistoryModel(1);
    });
  }

  List<Map> orderHistories = [
    {"period": "Current week"},
    {"period": "Last week"},
    {"period": "Two weeks ago"},
    {"period": "4 weeks ago"},
  ];
  int selectedPeriod = 0;
  bool isCustom = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DashboardDetailsModel>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null &&
              snapshot.data.lastWeekSales != null) {
            return RefreshIndicator(
              onRefresh: _onRef,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        YMargin(10),
                        Container(
                          // height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...List.generate(
                                  orderHistories.length,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedPeriod = index;
                                          _reportsFuture =
                                              _dashboardService.getPaymentHistoryModel(index + 1);
                                        });
                                      },
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25.0),
                                              color:
                                                  selectedPeriod == index ? redColor : Colors.white,
                                            ),
                                            child: Text(
                                              "${orderHistories[index]['period']}",
                                              style: GoogleFonts.montserrat(
                                                color: selectedPeriod == index
                                                    ? Colors.white
                                                    : redColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     isCustom == false
                        //         ? TextButton(
                        //             onPressed: () {
                        //               setState(() {
                        //                 isCustom = !isCustom;
                        //               });
                        //             },
                        //             child: Text(
                        //               "Custom",
                        //               style: GoogleFonts.nunito(
                        //                 color: Colors.black,
                        //                 fontSize: 14,
                        //               ),
                        //             ),
                        //           )
                        //         : Column(
                        //             crossAxisAlignment: CrossAxisAlignment.end,
                        //             mainAxisAlignment: MainAxisAlignment.end,
                        //             children: [
                        //               Row(
                        //                 crossAxisAlignment: CrossAxisAlignment.end,
                        //                 mainAxisAlignment: MainAxisAlignment.end,
                        //                 children: [
                        //                   TextButton(
                        //                     onPressed: () {
                        //                       _selectStartDate(context);
                        //                     },
                        //                     child: Text(
                        //                       "${startDateController.text == "" ? "Start Date" : startDateController.text}",
                        //                       style: GoogleFonts.nunito(
                        //                         color: Colors.black,
                        //                         fontSize: 14,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                   XMargin(10),
                        //                   TextButton(
                        //                     onPressed: () {
                        //                       _selectEndDate(context);
                        //                     },
                        //                     child: Text(
                        //                       "${endDateController.text == "" ? "End Date" : endDateController.text}",
                        //                       style: GoogleFonts.nunito(
                        //                         color: Colors.black,
                        //                         fontSize: 14,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               GestureDetector(
                        //                 onTap: () {
                        //                   setState(() {
                        //                     _reportsFuture =
                        //                         _dashboardService.getCustomPaymentHistoryModel(
                        //                             startDateController.text,
                        //                             endDateController.text);
                        //                   });
                        //                 },
                        //                 child: Text(
                        //                   "Select",
                        //                   style: GoogleFonts.nunito(
                        //                     color: redColor,
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 14,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //   ],
                        // ),
                        YMargin(10),
                        FutureBuilder<ReportsPayoutHistory>(
                            future: _reportsFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState != ConnectionState.done) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: BarChartSample1(
                                    period: "${orderHistories[selectedPeriod]['period']}",
                                    // lastWeekSales: ,
                                    currentWeekSales: "0.00",
                                    charts: List.generate(
                                        7, (index) => Revenue(day: "TravelTube", total: 0)),
                                  ),
                                );
                              } else {
                                return GestureDetector(
                                  onTap: () {},
                                  child: BarChartSample1(
                                    period: "${orderHistories[selectedPeriod]['period']}",
                                    // lastWeekSales: ,
                                    currentWeekSales: snapshot.data.weeklyNet,
                                    charts: snapshot.data.revenue,
                                  ),
                                );
                              }
                            }),
                        YMargin(30),
                        snapshot.data.sales == null
                            ? Center(
                                child: Text(
                                  "No Sales Made Yet".tr,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  YMargin(10),
                                  snapshot.data.sales == null
                                      ? SizedBox.shrink()
                                      : Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Spacer(),
                                            Text(
                                              "Ranked by Order Volume".tr,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                  ...List.generate(snapshot.data.sales.length, (index) {
                                    //sort the sales map in ascending order with the sales quantity key
                                    snapshot.data.sales
                                        .sort((a, b) => (b.salesQty).compareTo(a.salesQty));
                                    print(snapshot.data.sales[index].salesQty);
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: TopSellingItemsWidget(
                                        index: index + 1,
                                        itemName: snapshot.data.sales[index].name,
                                        itemCount: snapshot.data.sales[index].salesQty,
                                      ),
                                    );
                                  }),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: _onRef,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            );
          }
        });
  }
}
