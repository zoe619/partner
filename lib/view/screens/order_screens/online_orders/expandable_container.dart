// import 'dart:html';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:order_tracker/state/broadcast.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/order_screens/online_orders/pricing_and_delivery_option.dart';
import 'package:image_picker/image_picker.dart';

class ExpandableContainer extends StatefulWidget {
  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool _isWidthExpand = false;
  bool openOrdering = false;
  bool openTitle = false;
  bool _isOnline = false;
  bool userTest = false;
  var _controller = TextEditingController();

  final picker = ImagePicker();
  File _file;
  String _filename;

  Future getImage() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _file = File(
          pickedFile.path,
        );
        _filename = _file.path.split('/').last;
        broadcastValues['image'] = _filename;
        print("${broadcastValues['image']}");
        print("FILE NAME $_filename");
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("{Open Ordering: $openOrdering, Open Title: $openTitle}");
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
      child: Container(
        alignment: Alignment.centerLeft,
        color: Color.fromRGBO(252, 6, 6, 0.7),
        width: _isWidthExpand
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width * 0.15,
        padding: EdgeInsets.symmetric(vertical: _isWidthExpand ? 20 : 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ICON BUTTON TO EXPAND WIDGET
            IconButton(
              onPressed: () {
                setState(() {
                  _isWidthExpand = _isWidthExpand ? false : true;
                });
              },
              icon: Image.asset(_isWidthExpand
                  ? 'assets/images/fwdarrow.png'
                  : 'assets/images/bwdarrow.png'),
            ),

            //LIVE KITCHEN INTERACTION
            Expanded(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                _isWidthExpand
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        margin: EdgeInsets.only(left: 20, right: 50),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(211, 34, 22, 0.7),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(openTitle ? 20 : 50),
                              right: Radius.circular(openTitle ? 20 : 50)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Add title",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        openTitle = openTitle ? false : true;
                                        if (openTitle) openOrdering = false;
                                      });
                                    },
                                    child: Image.asset(openTitle
                                        ? 'assets/images/downarrow.png'
                                        : 'assets/images/fwdovalarrow.png'),
                                  ),
                                ],
                              ),
                            ),
                            openTitle
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    child: Container(
                                      child: TextField(
                                        style: TextStyle(color: Colors.white),
                                        controller: _controller,
                                        onChanged: (value) {
                                          print("Value $value");
                                          setState(() {
                                            broadcastValues['title'] = value;
                                          });
                                          print(
                                              "Value ${broadcastValues['title']}");
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 10),
                                          fillColor:
                                              Color.fromRGBO(109, 11, 11, 0.7),
                                          filled: true,
                                          hintText: 'Add title',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                            openTitle
                                ? Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Upload dish picture:',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                        YMargin(5),
                                        _filename == null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: DottedBorder(
                                                  borderType: BorderType.RRect,
                                                  color: Colors.black,
                                                  strokeWidth: 2,
                                                  padding: EdgeInsets.all(0),
                                                  radius: Radius.circular(1),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 5),
                                                    color: Color.fromRGBO(
                                                        169, 47, 44, 1),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'File upload',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(98,
                                                                      0, 0, 1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          'Only one image file in .jpg or .png',
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    113,
                                                                    48,
                                                                    48,
                                                                    1),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            getImage();
                                                          },
                                                          child: Text(
                                                            'Select file',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Image.asset(
                                                      'assets/images/imageicon.png'),
                                                  Text(
                                                    _filename,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Image.asset(
                                                    'assets/images/cross.png',
                                                    color: Colors.white,
                                                  )
                                                ],
                                              )
                                      ],
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 10,
                ),
                //
                // Accept Online Ordering
                //
                _isWidthExpand
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 20, right: 45),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(211, 34, 22, 0.7),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(openOrdering ? 10 : 50),
                                  right:
                                      Radius.circular(openOrdering ? 10 : 50)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Accept online ordering",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            openOrdering =
                                                openOrdering ? false : true;
                                            if (openOrdering) openTitle = false;
                                          });
                                        },
                                        child: Image.asset(openOrdering
                                            ? 'assets/images/downarrow.png'
                                            : 'assets/images/fwdovalarrow.png'),
                                      ),
                                    ],
                                  ),
                                ),
                                openOrdering
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                'Online ordering',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _isOnline = _isOnline
                                                          ? false
                                                          : true;

                                                      broadcastValues[
                                                              'isOnline'] =
                                                          _isOnline;
                                                    });
                                                  },
                                                  child: Image.asset(_isOnline
                                                      ? 'assets/images/toggleon.png'
                                                      : 'assets/images/toggleoff.png'))
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                          _isOnline
                              ? Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
                                  margin: EdgeInsets.only(left: 20, right: 45),
                                  child: PricingAndDeliveryOption())
                              : SizedBox()
                        ],
                      )
                    : SizedBox(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
