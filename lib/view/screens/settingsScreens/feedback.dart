import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/model/get_restaurant_feedbacks.dart';
import 'package:order_tracker/networking/core/services/feedback_service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/settingsScreens/view_feedbacks.dart';
import 'settings_bar.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  FeedbackService _feedbackService = Get.put(FeedbackService());
  ScrollController _scrollController = ScrollController();
  var numberOfElementsAddedFromRegroupList = 1;

  Future<GetRestauarantFeedbacks> _future;

  bool isLoading = true, showLoader = false, isFirstLoading = false;
  int page = 1;
  bool hasRegrouped = false;

  List<List<Data>> regroupedResList = [];
  List<Data> mainList = [];
  List<Data> childList = [];
  var lastPageNumber = 0;
  @override
  void initState() {
    super.initState();
    _future = _getOrders();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          showLoader = true;
          page = page + 1;
        });
        _future = _getOrders();
      }
    });
  }

  Future<GetRestauarantFeedbacks> _getOrders() async {
    var d = await _feedbackService.getFeedbacks(page);
    if (d.data != null) {
      isLoading = false;
    }
    setState(() {
      showLoader = false;
      mainList.addAll(d.data);
      numberOfElementsAddedFromRegroupList++;
    });
    return d ?? GetRestauarantFeedbacks(data: []);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // print(mainList[0].createdBy.userDetail.email);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          "Feedbacks".tr,
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<GetRestauarantFeedbacks>(
          future: _future,
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: height,
                width: width,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
              // } else {
              //   if (snapshot.data.data.isEmpty) {
              //     return Container(
              //       height: height,
              //       width: width,
              //       child: Center(
              //         child: Text("No comments".tr),
              //       ),
              //     );
            } else {
              return Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: ListView.separated(
                  controller: _scrollController,
                  // reverse: true,
                  // physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _feedbackService.getResFeedbacks.length,
                  separatorBuilder: (context, index) {
                    return Divider(color: Colors.grey);
                  },
                  itemBuilder: (context, index) {
                    print(
                        'IMAGE ${_feedbackService.getResFeedbacks[index]['image_url']}');
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => ViewFeedback(
                            feedbackDetails:
                                _feedbackService.getResFeedbacks[index],
                          ),
                        );
                      },
                      child: Material(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: CachedNetworkImageProvider(
                                  _feedbackService.getResFeedbacks[index]
                                          ['created_by']['image_url'] ??
                                      "https://travtubes.com/img/defaultLogo.png",
                                ),
                              ),
                              XMargin(10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${_feedbackService.getResFeedbacks[index]['created_by']['full_name']}",
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                            ),
                                            RatingBarIndicator(
                                              rating: double.parse(
                                                  "${_feedbackService.getResFeedbacks[index]['rating']}"),
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: redColor,
                                              ),
                                              itemCount: 5,
                                              itemSize: 20.0,
                                              direction: Axis.horizontal,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    YMargin(7),
                                    Text(
                                      _feedbackService.getResFeedbacks[index]
                                              ['comment'] ??
                                          "",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    YMargin(10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            // }
          }),
    );
  }
}
