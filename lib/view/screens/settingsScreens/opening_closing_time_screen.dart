import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/model/restaurant_details_model.dart';
import 'package:order_tracker/networking/core/services/auth_service.dart';
import 'package:order_tracker/networking/core/services/restaurant_Service.dart';
import 'package:order_tracker/networking/core/services/shared_Pref.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

class OpeningClosingTime extends StatefulWidget {
  @override
  _OpeningClosingTimeState createState() => _OpeningClosingTimeState();
}

class _OpeningClosingTimeState extends State<OpeningClosingTime> {
  RestaurantService _restaurantService = Get.put(RestaurantService());
  Future<TimeOfDay> selectedTimeRTL(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
    );
  }

  dynamic getDay(String dayString) {
    switch (dayString.toLowerCase()) {
      case "monday":
        return 1;
      case "tuesday":
        return 2;
      case "wednesday":
        return 3;
      case "thursday":
        return 4;
      case "friday":
        return 5;
      case "saturday":
        return 6;
      case "sunday":
        return 7;
    }
  }

  bool isDaySelected = false;
  bool isLoading = false;
  List<Map<String, dynamic>> _itemList = restaurantLoad.data.operating.allDays.isEmpty
      ? [
          {
            "day": "Mon",
            "timeBeginning": "7:00 am",
            "timeEnding": "10:00 pm",
            "isDaySelected": false
          },
          {
            "day": "Tue",
            "timeBeginning": "7:00 am",
            "timeEnding": "10:00 pm",
            "isDaySelected": false
          },
          {
            "day": "Wed",
            "timeBeginning": "7:00 am",
            "timeEnding": "10:00 pm",
            "isDaySelected": false
          },
          {
            "day": "Thur",
            "timeBeginning": "7:00 am",
            "timeEnding": "10:00 pm",
            "isDaySelected": false
          },
          {
            "day": "Fri",
            "timeBeginning": "7:00 am",
            "timeEnding": "10:00 pm",
            "isDaySelected": false
          },
          {
            "day": "Sat",
            "timeBeginning": "7:00 am",
            "timeEnding": "10:00 pm",
            "isDaySelected": false
          },
          {
            "day": "Sun",
            "timeBeginning": "7:00 am",
            "timeEnding": "10:00 pm",
            "isDaySelected": false
          },
        ]
      : [
          {
            "day": restaurantLoad.data.operating.allDays[0].dayName ?? "",
            "timeBeginning": restaurantLoad.data.operating.allDays[0].timeFrom != null
                ? restaurantLoad.data.operating.allDays[0].timeFrom
                : "7:00 am",
            "timeEnding": restaurantLoad.data.operating.allDays[0].timeTo != null
                ? restaurantLoad.data.operating.allDays[0].timeTo
                : "10:00 pm",
            "isDaySelected": false
          },
          {
            "day": restaurantLoad.data.operating.allDays[1].dayName ?? "",
            "timeBeginning": restaurantLoad.data.operating.allDays[1].timeFrom != null
                ? restaurantLoad.data.operating.allDays[1].timeFrom
                : "7:00 am",
            "timeEnding": restaurantLoad.data.operating.allDays[1].timeTo != null
                ? restaurantLoad.data.operating.allDays[1].timeTo
                : "10:00 pm",
            "isDaySelected": false
          },
          {
            "day": restaurantLoad.data.operating.allDays[2].dayName ?? "",
            "timeBeginning": restaurantLoad.data.operating.allDays[2].timeFrom != null
                ? restaurantLoad.data.operating.allDays[2].timeFrom
                : "7:00 am",
            "timeEnding": restaurantLoad.data.operating.allDays[2].timeTo != null
                ? restaurantLoad.data.operating.allDays[2].timeTo
                : "10:00 pm",
            "isDaySelected": false
          },
          {
            "day": restaurantLoad.data.operating.allDays[3].dayName ?? "",
            "timeBeginning": restaurantLoad.data.operating.allDays[3].timeFrom != null
                ? restaurantLoad.data.operating.allDays[3].timeFrom
                : "7:00 am",
            "timeEnding": restaurantLoad.data.operating.allDays[3].timeTo != null
                ? restaurantLoad.data.operating.allDays[3].timeTo
                : "10:00 pm",
            "isDaySelected": false
          },
          {
            "day": restaurantLoad.data.operating.allDays[4].dayName ?? "",
            "timeBeginning": restaurantLoad.data.operating.allDays[4].timeFrom != null
                ? restaurantLoad.data.operating.allDays[4].timeFrom
                : "7:00 am",
            "timeEnding": restaurantLoad.data.operating.allDays[4].timeTo != null
                ? restaurantLoad.data.operating.allDays[4].timeTo
                : "10:00 pm",
            "isDaySelected": false
          },
          {
            "day": restaurantLoad.data.operating.allDays[5].dayName ?? "",
            "timeBeginning": restaurantLoad.data.operating.allDays[5].timeFrom != null
                ? restaurantLoad.data.operating.allDays[5].timeFrom
                : "7:00 am",
            "timeEnding": restaurantLoad.data.operating.allDays[5].timeTo != null
                ? restaurantLoad.data.operating.allDays[5].timeTo
                : "10:00 pm",
            "isDaySelected": false
          },
          {
            "day": restaurantLoad.data.operating.allDays[6].dayName ?? "",
            "timeBeginning": restaurantLoad.data.operating.allDays[6].timeFrom != null
                ? restaurantLoad.data.operating.allDays[6].timeFrom
                : "7:00 am",
            "timeEnding": restaurantLoad.data.operating.allDays[6].timeTo != null
                ? restaurantLoad.data.operating.allDays[6].timeTo
                : "10:00 pm",
            "isDaySelected": false
          },
        ];

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
          "Opening - Closing Time".tr,
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // YMargin(50),
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [Text("Date"), Spacer(), Text("Time")],
              // ),
              YMargin(20),
              ...List.generate(_itemList.length, (index) {
                return CustomDateTimeWidget(
                  isDaySelected: _itemList[index]["isDaySelected"],
                  onDayTap: () {
                    setState(() {
                      _itemList[index]["isDaySelected"] = !_itemList[index]["isDaySelected"];
                    });
                  },
                  onTimeTap: () async {
                    print(index);
                    await selectedTimeRTL(context).then((value) {
                      setState(() {
                        if (value.hour < 12) {
                          _itemList[index]["timeBeginning"] = value.hour.toString() + " am";
                        } else {
                          _itemList[index]["timeBeginning"] = value.hour.toString() + " pm";
                        }
                      });
                      print(value.hour);
                    }).catchError((e) {
                      print(e.toString());
                    });
                  },
                  timeSelectedBeginning: _itemList[index]["timeBeginning"] == null
                      ? "7:00 am"
                      : _itemList[index]["timeBeginning"].split(" ")[0] +
                          ":00 " +
                          _itemList[index]["timeBeginning"].split(" ")[1],
                  timeSelectedEnding: _itemList[index]["timeEnding"],
                  dayOfWeek: _itemList[index]["day"],
                );
              }),
              YMargin(50),
              GestureDetector(
                onTap: () async {
                  var daysToUpdate =
                      _itemList.where((item) => item["isDaySelected"] == true).toList();
                  if (!mounted) return;
                  setState(() {
                    isLoading = true;
                  });

                  Timer(Duration(seconds: 2), () {
                    setState(() {
                      isLoading = false;
                    });
                  });
                  int i;

                  for (i = 0; i < daysToUpdate.length; i++) {
                    log("ogiers");
                    await _restaurantService
                        .updateOpeningAndClosingTime(
                            getDay(daysToUpdate[i]["day"]),
                            daysToUpdate[i]["timeBeginning"].split(" ")[0].length == 1
                                ? "0${daysToUpdate[i]["timeBeginning"].split(" ")[0] + ":00 " + daysToUpdate[i]["timeBeginning"].split(" ")[1]}"
                                : daysToUpdate[i]["timeBeginning"].split(" ")[0] +
                                    ":00 " +
                                    daysToUpdate[i]["timeBeginning"].split(" ")[1],
                            daysToUpdate[i]["timeEnding"],
                            2)
                        .then((value) {
                      AuthService().getRestaurantData().then((value) {
                        fetchStorageValues();
                      });
                    });
                  }
                },
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: isLoading == false
                        ? Text(
                            "Update time".tr,
                            style:
                                TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        : Container(
                            height: 15.0,
                            width: 15.0,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              YMargin(50),
            ],
          ),
        ),
      ),
    );
  }

  fetchStorageValues() async {
    try {
      await storage.readAll();
      RestaurantDetailsModel user =
          RestaurantDetailsModel.fromJson(await SharedPref().read("restaurantData"));
      setState(() {
        restaurantLoad = user;
      });
      print("==>>> tag ${restaurantLoad.data.name}  id ${restaurantLoad.data.officeEmail}");
    } catch (e) {
      print(e);
    }
  }
}

class CustomDateTimeWidget extends StatelessWidget {
  const CustomDateTimeWidget({
    Key key,
    this.isDaySelected,
    this.onDayTap,
    this.onTimeTap,
    this.dayOfWeek,
    this.timeSelectedBeginning,
    this.timeSelectedEnding,
  }) : super(key: key);

  final bool isDaySelected;
  final VoidCallback onDayTap, onTimeTap;
  final String dayOfWeek, timeSelectedBeginning, timeSelectedEnding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onDayTap,
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 0),
                decoration: BoxDecoration(
                  color: isDaySelected == true ? Theme.of(context).primaryColor : white,
                ),
                child: Card(
                  color: isDaySelected == true ? Theme.of(context).primaryColor : white,
                  elevation: isDaySelected == true ? 8 : 0,
                  child: Text(
                    dayOfWeek,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isDaySelected == true ? white : Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
            // Spacer(),
            GestureDetector(
              onTap: onTimeTap,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "$timeSelectedBeginning - $timeSelectedEnding",
                  style: TextStyle(
                    color: black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(color: Colors.grey),
      ],
    );
  }
}
