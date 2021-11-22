import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/networking/core/services/offline_service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/utils/snackbars.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

class PlaceOfflineDelivery extends StatefulWidget {
  final String recipientName, courierComment;
  final String deliveryAddress;
  final String apartment;
  final String phoneNo;
  final String amount;
  final String itemDesc;
  final String deliveryNote;
  final String lng;
  final String lat;
  final bool takeCash;
  final bool takeInvoice;
  final orderId;
  final dynamic processingMins;

  const PlaceOfflineDelivery({
    Key key,
    this.processingMins,
    this.lat,
    this.lng,
    this.takeInvoice,
    this.takeCash,
    this.amount,
    this.courierComment,
    this.apartment,
    this.deliveryAddress,
    this.deliveryNote,
    this.itemDesc,
    this.phoneNo,
    this.recipientName,
    this.orderId,
  }) : super(key: key);

  @override
  _PlaceOfflineDeliveryState createState() => _PlaceOfflineDeliveryState();
}

class _PlaceOfflineDeliveryState extends State<PlaceOfflineDelivery> {
  OfflineService _offlineService = Get.put(OfflineService());

  bool isLoading = false;

  Widget textRow(title, value) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4),
      child: Row(
        children: [
          Text(
            "$title:",
            style: GoogleFonts.roboto(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          XMargin(5),
          Text(
            "$value",
            style: GoogleFonts.roboto(
              color: Colors.black,
              // fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget textColumn(title, value) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title:",
            style: GoogleFonts.roboto(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          XMargin(5),
          Text(
            "$value",
            style: GoogleFonts.roboto(
              color: Colors.black,
              // fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget blackCont() {
    return Container(
      height: 3,
      width: 30,
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height / 1.1;
    // double width = MediaQuery.of(context).size.width;
    // log("======>>>>>>>> ${widget.orderId}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Offline Food Delivery".tr,
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: height,
          // width: width,
          padding: EdgeInsets.only(top: 37, right: 17, left: 17, bottom: 33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CUSTOMER DETAILS".tr,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              YMargin(2),
              blackCont(),
              YMargin(10),
              textRow("Customer Name".tr, "${widget.recipientName}"),
              textRow("Customer Phone Number".tr, "${widget.phoneNo}"),
              textColumn("Customer Address".tr, "${widget.deliveryAddress}"),
              textRow("Apartment/Block/Room number".tr, "${widget.apartment}"),
              textColumn("Delivery Note", "${widget.deliveryNote}"),
              YMargin(5),
              Divider(color: Colors.grey),
              YMargin(20),
              Text(
                "Item Details".tr,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              YMargin(2),
              blackCont(),
              YMargin(10),
              textRow("Est process time".tr, "${widget.processingMins} mins"),
              textRow("Item amount".tr, "${widget.amount}"),
              textColumn("Item description".tr, "${widget.itemDesc}"),
              YMargin(5),
              Divider(color: Colors.grey),
              YMargin(20),
              Text(
                "Payment Details".tr,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              YMargin(2),
              blackCont(),
              YMargin(10),
              textRow("Payment Mode".tr, "cash".tr),
              textRow("Should courier collect money from customer?".tr,
                  "${widget.takeCash == true ? "Yes".tr : "No".tr}"),
              YMargin(10),
              textColumn("Should courier collect restaurant payment from customer?".tr,
                  "${widget.takeInvoice == true ? "Yes".tr : "No".tr}"),
              YMargin(5),
              YMargin(50),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  _offlineService
                      .payOfflineOrder(widget.orderId
                    // widget.amount,
                    // "offline",
                    // widget.itemDesc,
                    // widget.recipientName,
                    // widget.deliveryAddress,
                    // 0,
                    // widget.apartment,
                    // widget.lat,
                    // widget.lng,
                    // widget.deliveryNote,
                    // widget.takeCash,
                    // "",
                    // widget.phoneNo,
                  )
                      .then(
                        (value) {
                      setState(() {
                        isLoading = false;
                      });
                      // log(value.toString());
                      if (value.first == 200 || value[1] == 'Payment already registered') {
                        GetSnackbars().successSnackbar("Success".tr, "Order created".tr);
                        Future.delayed(Duration(seconds: 1), () {
                          Get.offAll(() => BottomNavigation());
                        });
                      } else {
                        GetSnackbars()
                            .errorSnackbar("Error".tr, value[1]);
                      }
                    },
                  );
                },
                child: Container(
                  height: 55,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: isLoading == true
                        ? Container(
                      height: 15.0,
                      width: 15.0,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    )
                        : Text(
                      "Place Order".tr,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
