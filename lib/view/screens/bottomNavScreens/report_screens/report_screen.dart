import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/model/dashboard_details_model.dart';
import 'package:order_tracker/model/restaurant_details_model.dart';
import 'package:order_tracker/networking/core/services/dashboard_service.dart';
import 'package:order_tracker/networking/core/services/menu_service.dart';
import 'package:order_tracker/networking/core/services/misc_service.dart';
import 'package:order_tracker/networking/core/services/restaurant_Service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  RestaurantService _restaurantService = Get.put(RestaurantService());
  Future<RestaurantDetailsModel> _future;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _future = _restaurantService.getRestaurantDetails();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
          "Reports".tr,
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<RestaurantDetailsModel>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return Container();
          } else {
            return Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YMargin(10),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      // give the indicator a decoration (color and border radius)
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: 'Balances'.tr,
                        ),
                        Tab(
                          text: 'Revenue'.tr,
                        ),
                        Tab(
                          text: "Net".tr,
                        ),
                      ],
                    ),
                  ),
                  // tab bar view here
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      // physics: NeverScrollableScrollPhysics(),
                      children: [
                        // first tab bar view widget
                        Balances(),
                        // second tab bar view widget
                        Revenue(
                          resName: snapshot.data.data.name,
                          phone: snapshot.data.data.phone,
                          whatsappNumber: snapshot.data.data.whatsAppNumber,
                          city: snapshot.data.data.city.city,
                          country: snapshot.data.data.country.name,
                          // currency: snapshot.data.data.currency.name,
                          address: snapshot.data.data.address,
                          parkingOption: "",
                          resUrl: snapshot.data.data.imageUrl,
                          resAdminName: snapshot.data.data.name,
                          facebook: snapshot.data.data.facebook,
                          twitter: snapshot.data.data.twitter,
                          instagram: snapshot.data.data.instagram,
                          website: snapshot.data.data.website,
                          contactEmail: snapshot.data.data.officeEmail,
                          fullMenuLink: snapshot.data.data.externalMenu,
                          linkedIn: snapshot.data.data.linkedIn,
                          pinterest: snapshot.data.data.pinterest,
                          tiktok: snapshot.data.data.tiktok,
                          resSeoUrl: snapshot.data.data.seoUrl,
                          resId: snapshot.data.data.id.toString(),
                        ),
                        //third tab bar
                        Net(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class Balances extends StatelessWidget {
  const Balances({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          YMargin(20),
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 1,
            child: Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Starting balance",
                        style: TextStyle(fontFamily: "popmedium"),
                      ),
                      Text(
                        "0.00\$",
                        style: TextStyle(fontFamily: "popbold", fontSize: 20),
                      ),
                    ],
                  ),
                  YMargin(10),
                  Divider(color: Colors.grey),
                  YMargin(10),
                  Divider(color: Colors.grey),
                  YMargin(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Current balance",
                        style: TextStyle(fontFamily: "popmedium"),
                      ),
                      Text(
                        "0.00\$",
                        style: TextStyle(fontFamily: "popbold", fontSize: 20),
                      ),
                    ],
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
}

class Revenue extends StatefulWidget {
  final String resAdminName;
  final String resUrl;
  final String resName,
      phone,
      whatsappNumber,
      city,
      country,
      // currency,
      resSeoUrl,
      address,
      parkingOption,
      facebook,
      twitter,
      website,
      instagram,
      contactEmail,
      fullMenuLink,
      linkedIn,
      pinterest,
      tiktok,
      resId;
  const Revenue(
      {Key key,
      this.resId,
      this.resAdminName,
      this.resUrl,
      this.resName,
      this.phone,
      this.whatsappNumber,
      this.city,
      this.country,
      // this.currency,
      this.address,
      this.parkingOption,
      this.facebook,
      this.twitter,
      this.website,
      this.instagram,
      this.contactEmail,
      this.fullMenuLink,
      this.linkedIn,
      this.pinterest,
      this.tiktok,
      this.resSeoUrl})
      : super(key: key);

  @override
  _RevenueState createState() => _RevenueState();
}

class _RevenueState extends State<Revenue> {
  List<String> days = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"];
  int isSelected = 0;

  Future _future;
  DashboardService _dashboardService = Get.put(DashboardService());
  var page = 1;
  @override
  void initState() {
    super.initState();
    setState(() {
      resIdConst = widget.resId;
      resName = widget.resName;
      resNumber = widget.phone;
      resWhatsappNumber = widget.whatsappNumber;
      resCity = widget.city;
      resUrl = widget.resUrl;
      resSeoUrl = widget.resSeoUrl;
      resCountry = widget.country;
      // resBaseCurrency = widget.currency;
      resStreetAddress = widget.address;
      resParkingOption = widget.parkingOption;
      resFacebook = widget.facebook;
      resWebsite = widget.website;
      resTwitter = widget.twitter;
      resInstagram = widget.instagram;
      resLinkedIn = widget.linkedIn;
      resTikTok = widget.tiktok;
      resPinterest = widget.pinterest;
      resFoodMenuLink = widget.fullMenuLink;
      resContactEmail = widget.contactEmail;
    });
    MenuService()
      ..getMenuCategories().then((value) {
        setState(() {
          menuCategoryList = value.data;
          for (var i = 0; i < menuCategoryList.length; i++) {
            menuCategoryListMap
                .add({"id": menuCategoryList[i].id, "name": menuCategoryList[i].name});
          }
        });
      });

    MiscService()
      ..getCountryList(page).then((value) {
        countryList = value.data;
        print("country List $countryList");
        for (var i = 0; i < countryList.length; i++) {
          countryListMap.add({"id": countryList[i].id, "name": countryList[i].name});
        }
        print("countryListMap $countryListMap");
      });

    _future = _dashboardService.getDashboardDetailsModel();
  }

  // ignore: missing_return
  Future<DashboardDetailsModel> _onRef() async {
    setState(() {
      _future = _dashboardService.getDashboardDetailsModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            YMargin(20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Text("Total Revenue"), Spacer(), Text("\$280")],
              ),
            ),
            YMargin(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(days.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSelected == index
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "${days[index]}",
                            style: TextStyle(
                              color: isSelected == index ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            YMargin(10),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Center(
                child: Text("No Revenue generated"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Net extends StatefulWidget {
  const Net({Key key}) : super(key: key);

  @override
  _NetState createState() => _NetState();
}

class _NetState extends State<Net> {
  List<String> days = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"];
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            YMargin(20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Text("Net Income"), Spacer(), Text("\$240")],
              ),
            ),
            YMargin(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(days.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSelected == index
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "${days[index]}",
                            style: TextStyle(
                              color: isSelected == index ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            YMargin(10),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Center(
                child: Text("NET shows earnings excluding commissions"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
