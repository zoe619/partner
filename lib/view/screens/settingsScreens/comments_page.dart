import 'dart:async';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/main.dart';
import 'package:order_tracker/model/get_customers_comments_model.dart';
import 'package:order_tracker/networking/core/services/comments_service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  CommentService _commentService = Get.put(CommentService());
  ScrollController _scrollController = ScrollController();
  var numberOfElementsAddedFromRegroupList = 1;

  Future<GetCommentsModel> _future;

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
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // if (numberOfElementsAddedFromRegroupList < regroupedResList.length) {
        setState(() {
          showLoader = true;
          page = page + 1;
        });
        _future = _getOrders();
      }
      // }
    });
    // _future = _commentService.getComments();
  }

  Future<GetCommentsModel> _getOrders() async {
    var d = await _commentService.getComments(page);
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
    return d ?? GetCommentsModel(data: []);
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          "Comments".tr,
          style: GoogleFonts.quicksand(
            color: redColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<GetCommentsModel>(
          future: _future,
          // ignore: missing_return
          builder: (context, snapshot) {
            if (isLoading == true) {
              return Container(
                height: height,
                width: width,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              if (snapshot.data.data.isEmpty) {
                return Container(
                  height: height,
                  width: width,
                  child: Center(
                    child: Text("No comments".tr),
                  ),
                );
              } else {
                // List<Data> restaurants = snapshot.data.data;

                // if (!hasRegrouped) {
                //   regroupedResList.clear();
                //   for (int i = 0; i < restaurants.length; i += 10) {
                //     var sublist = i + 10 > restaurants.length
                //         ? restaurants.sublist(i, restaurants.length)
                //         : restaurants.sublist(i, i + 10);
                //     regroupedResList.add(sublist);
                //   }
                //   if (regroupedResList.isNotEmpty) {
                //     mainList.addAll(regroupedResList.first);
                //   }
                //   hasRegrouped = true;
                // }
                return Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: mainList.length,
                          separatorBuilder: (context, index) {
                            return Divider(color: Colors.grey);
                          },
                          itemBuilder: (context, index) {
                            // var isLike = List.generate(
                            //     mainList.length, (index) => mainList[index].isAllowed);
                            // var _colors =
                            //     List.generate(mainList.length, (index) => Colors.grey).obs;
                            // List isLiked = isLike;
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: CachedNetworkImageProvider(
                                      mainList[index].user.image ??
                                          "https://travtubes.com/img/defaultLogo.png",
                                    ),
                                  ),
                                  XMargin(10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${mainList[index].user.firstName ?? "Anonymous"} ${mainList[index].user.lastName ?? ""}",
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "commented on ".tr,
                                                ),
                                                Text(
                                                  "${mainList[index].commentable.name}",
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        YMargin(7),
                                        Text(
                                          mainList[index].comment ?? "",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                        YMargin(10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Material(
                                              child: InkWell(
                                                onTap: () {
                                                  _commentService
                                                      .deleteUserComments(mainList[index].id);
                                                  mainList.removeAt(index);
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  size: 18,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                            // XMargin(40),
                                            // Material(
                                            //   child: InkWell(
                                            //     onTap: () {
                                            //       setState(() {
                                            //         isLiked[index] == 1
                                            //             ? isLiked[index] = 0
                                            //             : isLiked[index] = 1;
                                            //       });
                                            //       _colors[index] = Colors.red;
                                            //       log(_colors[index].toString());
                                            //       log(isLiked[index].toString());
                                            //       _commentService.likeUserComments(
                                            //         "menu",
                                            //         isLiked[index] == 0 ? 'unliked' : 'liked',
                                            //         mainList[index].id,
                                            //         isLiked[index],
                                            //       );
                                            //     },
                                            //     child: Obx(
                                            //       () => Icon(
                                            //         isLiked[index] == 1
                                            //             ? Icons.favorite
                                            //             : FontAwesomeIcons.heart,
                                            //         size: 18,
                                            //         color: _colors[index],
                                            //         //  isLiked[index] == 1
                                            //         //     ? Colors.red
                                            //         //     : Colors.grey,
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            // InkWell(
                                            //   onTap: () {},
                                            //   child: Icon(FontAwesomeIcons.comment, size: 18),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
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
                );
              }
            }
          }),
    );
  }
}
