import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/models/resOrderModel.dart';
import 'package:get/get.dart';

class OrderDetailsWId extends StatelessWidget {
  final String date,
      time,
      type,
      location,
      phoneNO,
      comment,
      amount,
      quantity,
      name;
  final List<Items> items;
  final List<Items> itemQuantity;

  const OrderDetailsWId(
      {this.date,
      this.time,
      this.name,
      this.type,
      this.location,
      this.phoneNO,
      this.comment,
      @required this.items,
      this.amount,
      this.quantity,
      this.itemQuantity});
  _callNumber() async {
    if (phoneNO != "null") {
      await FlutterPhoneDirectCaller.callNumber(phoneNO);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Invoice Details".tr,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    dense: true,
                    leading: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Name:  ".tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: name == null ? "Not set" : name,
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                      ]),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Date:  ".tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: date,
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                      ]),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Time:  ".tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: time,
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                      ]),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Type:  ".tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Delivery".tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                      ]),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 14.0, top: 8, bottom: 8, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location:  ".tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              location == "null" ? "Not Set" : location,
                              style: GoogleFonts.montserrat(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // ListTile(
                  //   // dense: true,
                  //   leading: RichText(
                  //     text: TextSpan(children: [
                  //       TextSpan(
                  //         text: "Location:  ",
                  //         style: GoogleFonts.montserrat(
                  //           fontSize: 17,
                  //           fontWeight: FontWeight.w700,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //       TextSpan(
                  //         text: location == "null" ? "Not Set" : location,
                  //         style: GoogleFonts.montserrat(
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.w500,
                  //           color: Colors.grey[600],
                  //         ),
                  //       ),
                  //     ]),
                  //   ),
                  // ),
                  ListTile(
                    dense: true,
                    onTap: () {
                      _callNumber();
                    },
                    leading: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Phone number:  ".tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: phoneNO == null ? "Not set" : phoneNO,
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  ListTile(
                    // dense: true,
                    leading: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Comment:  ".tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: comment == "null" ? "No Comments" : comment,
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                      ]),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Amount:  ".tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: amount == "null" ? "Not Set" : "\$$amount",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                      ]),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Quantity:  ".tr,
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: quantity == "null" ? "Not Set" : quantity,
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "Items:  ".tr,
                            style: GoogleFonts.montserrat(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            items.length,
                            (index) {
                              return Container(
                                child: Text(
                                  items[index].bookingItemable.name +
                                      " " +
                                      "(Qty: ${itemQuantity[index].quantity.toString()})",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
