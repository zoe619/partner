import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/model/get_restaurant_feedbacks.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewFeedback extends StatefulWidget {
  final feedbackDetails;
  const ViewFeedback({Key key, this.feedbackDetails}) : super(key: key);

  @override
  _ViewFeedbackState createState() => _ViewFeedbackState();
}

class _ViewFeedbackState extends State<ViewFeedback> {
  TextEditingController replyController = TextEditingController();
  bool replying = false;
  @override
  Widget build(BuildContext context) {
    var data = widget.feedbackDetails;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "${data['created_by']['first_name']}".tr,
            style: GoogleFonts.quicksand(
              color: redColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // YMargin(10),
              // Text(
              //   "Rating Details",
              //   style: GoogleFonts.poppins(
              //     fontWeight: FontWeight.w600,
              //     fontSize: 18,
              //   ),
              // ),
              YMargin(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data['created_by']['full_name']}",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  RatingBarIndicator(
                    rating: double.parse("${data['rating']}"),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: redColor,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              YMargin(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email:",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  XMargin(10),
                  Text(
                    data['created_by']['email'] ?? "No email",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              YMargin(5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone:",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  XMargin(10),
                  GestureDetector(
                    onTap: () {
                      // launch(
                      // "tel://${data.createdBy.userDetail.phoneNumber}"
                      // )?
                    },
                    child: Text(
                      // data.createdBy.userDetail.phoneNumber.toString() ??
                      "No phone number",
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              YMargin(20),
              Text(
                "Comment",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              YMargin(5),
              Text(
                data['comment'],
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // // YMargin(30),
              // Spacer(),
              // offlineOrderField(
              //     "Enter a message".tr,
              //     true,
              //     "Reply to customer".tr,
              //     replyController,
              //     TextInputType.emailAddress,
              //     3,
              //     Icons.person),
              // YMargin(10),
              // Container(
              //   height: 55,
              //   width: 344,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       elevation: 0,
              //       primary: Theme.of(context).primaryColor,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(6),
              //       ),
              //     ),
              //     onPressed: () {
              //       if (replyController.text == "") {
              //       } else {}
              //     },
              //     child: Builder(
              //       builder: (context) {
              //         if (replying == true) {
              //           return Container(
              //             height: 15,
              //             width: 15,
              //             child: CircularProgressIndicator(
              //               valueColor: AlwaysStoppedAnimation(Colors.white),
              //             ),
              //           );
              //         } else {
              //           return Text(
              //             "Reply".tr,
              //             style: GoogleFonts.montserrat(
              //               fontWeight: FontWeight.w700,
              //               color: Colors.white,
              //               fontSize: 20,
              //             ),
              //           );
              //         }
              //       },
              //     ),
              //   ),
              // ),
              // YMargin(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget offlineOrderField(
      String label,
      bool enabled,
      String overHead,
      TextEditingController controller,
      TextInputType textInputType,
      int lines,
      IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overHead,
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        YMargin(10),
        TextFormField(
          keyboardType: textInputType,
          controller: controller,
          enabled: enabled,
          maxLines: lines,
          decoration: InputDecoration(
            // prefixIcon: Icon(icon, color: icon == Icons.money ? Colors.green : Colors.black),
            labelText: label,
            labelStyle: GoogleFonts.manrope(
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(121, 121, 121, 1),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
