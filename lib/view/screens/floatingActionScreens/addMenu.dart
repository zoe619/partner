import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mdi/mdi.dart';
import 'package:order_tracker/networking/core/services/menu_service.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/utils/snackbars.dart';

class AddMenu extends StatefulWidget {
  @override
  _AddMenuState createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  final _formKey = GlobalKey<FormState>();
  final _itemNameController = TextEditingController();
  final _itemPriceController = TextEditingController();
  final _itemDescController = TextEditingController();
  final _itemDiscountController = TextEditingController();
  var _imageFile;

  MenuService _menuService = Get.put(MenuService());
  bool isAddingLoading = false;
  var menuDropDownValue, menuDropDownId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add new menu".tr,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const YMargin(30),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _itemNameController,
                  validator: MinLengthValidator(5, errorText: 'Enter a proper name for the item'),
                  decoration: InputDecoration(
                    labelText: "Menu name".tr,
                    labelStyle: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      size: 14,
                      color: Colors.black,
                    ),
                    // border: InputBorder.none,
                  ),
                ),
                const YMargin(10),
                menuCategoryListItem(),
                const YMargin(10),

                TextFormField(
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  controller: _itemPriceController,
                  validator: MinLengthValidator(2, errorText: 'Set item price'),
                  decoration: InputDecoration(
                    labelText: "Price".tr,
                    labelStyle: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.money,
                      size: 14,
                      color: Colors.black,
                    ),
                    // border: InputBorder.none,
                  ),
                ),
                const YMargin(10),
                // TextFormField(
                //   style: TextStyle(color: Colors.black),
                //   validator: MinLengthValidator(5,
                //       errorText: 'Enter a proper description of the item'),
                //   decoration: InputDecoration(
                //     labelText: "Menu Category",
                //     labelStyle: GoogleFonts.montserrat(
                //       fontSize: 14,
                //     ),
                //     prefixIcon: Icon(
                //       Icons.category,
                //       size: 14,
                //       color: Colors.black,
                //     ),
                //     // border: InputBorder.none,
                //   ),
                // ),
                // const YMargin(10),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _itemDiscountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Discount".tr,
                    labelStyle: GoogleFonts.montserrat(
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Mdi.percent,
                      size: 14,
                      color: Colors.black,
                    ),
                    // border: InputBorder.none,
                  ),
                ),
                YMargin(
                  screenHeight(context, percent: 0.06),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Menu description".tr,
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      height: 100,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        // color: Colors.grey.withOpacity(.3),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(
                        maxLines: 5,
                        controller: _itemDescController,
                        style: TextStyle(color: Colors.black),
                        validator: MinLengthValidator(5,
                            errorText: 'Enter a proper description of the item'.tr),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const YMargin(30),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Media".tr,
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        openImagePickerModal(context);
                      },
                      child: Text("Upload an image"),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        openImagePickerModal(context);
                      },
                      child: Text("Upload a video"),
                    ),
                    Spacer(),
                  ],
                ),
                _image != null ? YMargin(10) : SizedBox(),
                _image != null ? Text(_image.path.split("/").last) : SizedBox(),
                const YMargin(30),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 42,
                    width: 336,
                    // width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        primary: Theme.of(context).primaryColor,
                      ),
                      child: isAddingLoading == true
                          ? Container(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.white),
                              ),
                            )
                          : Text(
                              "Add item".tr,
                              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
                            ),
                      onPressed: () async {
                        print(_image.toString());
                        var name = _itemNameController.text.toString().replaceAll(" ", "");
                        var price = _itemPriceController.text.toString().replaceAll(" ", "");
                        var discount = _itemDiscountController.text.toString().replaceAll(" ", "");
                        var description = _itemDescController.text.toString().replaceAll(" ", "");
                        if (name.isNotEmpty && price.isNotEmpty) {
                          // var binImage = await _image.readAsBytes();
                          setState(() {
                            isAddingLoading = true;
                          });
                          _menuService
                              .postWithDio(name, double.parse(price), description,
                                  int.parse(menuDropDownValue), double.parse(discount), _image.uri)
                              .then((value) {
                            setState(() {
                              isAddingLoading = false;
                            });
                          }).catchError((e) {
                            setState(() {
                              isAddingLoading = false;
                            });
                          });
                        } else {
                          setState(() {
                            isAddingLoading = false;
                          });
                          GetSnackbars()
                              .errorSnackbar("Error", "Item name and price fields cannot be empty");
                        }
                      },
                    ),
                  ),
                ),
                const YMargin(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  menuCategoryListItem() {
    return Container(
      child: DropdownButton<String>(
        isExpanded: true,
        dropdownColor: white,
        value: menuDropDownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 20,
        hint: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            XMargin(16),
            Icon(
              FontAwesomeIcons.listAlt,
              size: 12,
            ),
            XMargin(20),
            Text(
              "Category".tr,
              style: GoogleFonts.montserrat(
                fontSize: 14,
              ),
            ),
          ],
        ),
        style: TextStyle(color: black),
        elevation: 16,
        onChanged: (String newMenuValue) {
          setState(() {
            menuDropDownValue = newMenuValue;
          });
        },
        items: menuCategoryListMap.map(
          (Map map) {
            print("map id ${map["id"].toString()}");
            return new DropdownMenuItem<String>(
              value: map["id"].toString(),
              child: new Text(
                map["name"],
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  File _image;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  void openImagePickerModal(BuildContext context) {
    print('Image Picker Modal Called');
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.grey[600],
            // color: Color(0xff060813),
            child: Container(
              decoration: BoxDecoration(
                // color: Theme.of(context).backgroundColor,
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              ),
              height: MediaQuery.of(context).size.height / 4,
              padding: EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Choose an option'.tr,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    child: Text('Take a Picture'),
                    onPressed: () {
                      _imgFromCamera();
                      // _getImage(context, ImageSource.camera);
                    },
                  ),
                  ElevatedButton(
                    child: Text('Pick Image from Gallery'),
                    onPressed: () {
                      _imgFromGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
