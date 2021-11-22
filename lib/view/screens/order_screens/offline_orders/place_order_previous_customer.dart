import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:order_tracker/models/my_customers_model.dart';
import 'package:order_tracker/networking/core/services/offline_service.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/dropdown_values.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/utils/snackbars.dart';

import 'place_offline_delivery.dart';

class PlaceOrderPrevCustomer extends StatefulWidget {
  final String deliveryAddress;
  final dynamic lng;
  final dynamic lat;
  final Data customerModel;
  final dynamic amount;
  final dynamic distance;
  final dynamic currency;
  const PlaceOrderPrevCustomer(
      {Key key,
      this.lat,
      this.lng,
      this.deliveryAddress,
      this.customerModel,
      this.amount,
      this.currency,
      this.distance})
      : super(key: key);

  @override
  _PlaceOrderPrevCustomerState createState() => _PlaceOrderPrevCustomerState();
}

class _PlaceOrderPrevCustomerState extends State<PlaceOrderPrevCustomer> {
  final OfflineService _offlineService = Get.put(OfflineService());
  final _phoneController = TextEditingController();
  String phoneNumber = '';
  PhoneNumber number;
  String processMins;
  Future<String> getCountryName() async {
    Position position =
        await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final coordinates = Coordinates(position.latitude, position.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      number = PhoneNumber(
          isoCode: addresses.first.countryCode, phoneNumber: widget.customerModel.phone);
    });
    return first.countryCode; // this will return country name
  }

  String customerCommentToCourier;
  String currentPaymentMethod = "Cash";
  bool isCreditCardEnabled = false, isLoading = false;
  bool takeCash = false;
  bool takeInvoiceAmount = true;

  @override
  void initState() {
    super.initState();
    getCountryName();
  }

  Widget offlineOrderField(String label, bool enabled, String overHead,
      TextEditingController controller, TextInputType textInputType, int lines, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overHead,
          style: GoogleFonts.roboto(
            color: Colors.grey,
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
            prefixIcon: Icon(icon, color: icon == Icons.money ? Colors.green : Colors.black),
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

  TextEditingController _amountController = TextEditingController();

  TextEditingController _itemDescController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  TextEditingController courierCommentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController _addressController =
        TextEditingController(text: widget.customerModel.building);
    TextEditingController _nameController = TextEditingController(text: widget.customerModel.name);
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
          padding: EdgeInsets.only(top: 27, right: 17, left: 17, bottom: 33),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Delivery Address".tr,
                style: GoogleFonts.roboto(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              YMargin(5),
              Text(
                "${widget.deliveryAddress}",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              YMargin(20),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.directions_bike),
                    XMargin(20),
                    Text(
                      "${double.parse(widget.distance.toString()).toStringAsFixed(1)} km",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${widget.currency} ${double.parse("${widget.amount ?? "0.00"}").toStringAsFixed(2)}",
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              YMargin(15),
              Divider(color: Colors.grey),
              YMargin(10),
              Text(
                "Customer delivery details".tr,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              YMargin(15),
              offlineOrderField("Enter recipient name".tr, true, "Recipient name".tr,
                  _nameController, TextInputType.emailAddress, 1, Icons.person),
              YMargin(20),
              offlineOrderField(
                "Enter recipient building number".tr,
                true,
                "Recipient apartment/floor/office number (optional)".tr,
                _addressController,
                TextInputType.emailAddress,
                1,
                Icons.apartment,
              ),
              YMargin(20),
              InternationalPhoneNumberInput(
                hintText: "Please enter your phone number".tr,
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                  setState(() {
                    phoneNumber = number.phoneNumber;
                  });
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                inputDecoration: InputDecoration(
                  counterText: '',
                  suffixIcon: Icon(
                    FontAwesomeIcons.phone,
                    color: Colors.red,
                  ),
                  filled: true,
                  // fillColor: HexColor(fillColorCode),
                  contentPadding: EdgeInsets.all(18.0),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  labelText: "Phone number".tr,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: "Phone number".tr,
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                // keyboardType: TextInputType.number,
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: _phoneController,
                formatInput: true,
                inputBorder: OutlineInputBorder(),
              ),
              YMargin(30),
              Divider(color: Colors.grey),
              YMargin(10),
              Text(
                "Item information".tr,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              YMargin(15),
              offlineOrderField("Enter total amount".tr, true, "Amount".tr, _amountController,
                  TextInputType.number, 1, Icons.money),
              YMargin(20),
              offlineOrderField("Enter item description".tr, true, "Item description".tr,
                  _itemDescController, TextInputType.emailAddress, 3, Icons.description),
              YMargin(30),
              Divider(color: Colors.grey),
              YMargin(10),
              offlineOrderField("Leave a note".tr, true, "Delivery note(optional)".tr,
                  _noteController, TextInputType.emailAddress, 3, Icons.comment),
              YMargin(20),
              Text(
                "Where should the order be left?(optional)".tr,
                style: GoogleFonts.roboto(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              _commentsDropDown(),
              YMargin(10),
              Text(
                "Estimated processing time".tr,
                style: GoogleFonts.roboto(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              _processMinsDropDown(),
              customerCommentToCourier == "Others"
                  ? offlineOrderField("Enter your comment".tr, true, "comment to courier".tr,
                      courierCommentController, TextInputType.emailAddress, 3, Icons.comment)
                  : Container(),
              YMargin(30),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          takeInvoiceAmount = !takeInvoiceAmount;
                        });
                      },
                      child: Icon(
                        takeInvoiceAmount ? FontAwesomeIcons.dotCircle : FontAwesomeIcons.circle,
                        color: takeInvoiceAmount ? redColor : Colors.grey,
                      )),
                  XMargin(10),
                  Expanded(
                    child: Text(
                      "Collect bill/cheque from customer".tr,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              YMargin(30),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          takeCash = !takeCash;
                        });
                      },
                      child: Icon(
                        takeCash ? FontAwesomeIcons.dotCircle : FontAwesomeIcons.circle,
                        color: takeCash ? redColor : Colors.grey,
                      )),
                  XMargin(10),
                  Expanded(
                    child: Text(
                      "Collect courier fee from customer".tr,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              YMargin(50),
              GestureDetector(
                onTap: () async {
                  if (_amountController.text == "" ||
                      _itemDescController.text == "" ||
                      processMins == null) {
                    GetSnackbars().errorSnackbar(
                        "Incomplete fields".tr, "Please fill all required fields".tr);
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    _offlineService
                        .createOfflineOrder(
                      _amountController.text,
                      "offline",
                      _itemDescController.text,
                      _nameController.text,
                      widget.deliveryAddress,
                      widget.customerModel.id,
                      _addressController.text,
                      widget.lat,
                      widget.lng,
                      _noteController.text,
                      takeCash,
                      customerCommentToCourier == "Others"
                          ? courierCommentController.text
                          : customerCommentToCourier,
                      phoneNumber,
                      takeInvoiceAmount,
                      processMins,
                    )
                        .then(
                      (value) {
                        setState(() {
                          isLoading = false;
                        });
                        if (value.first == 200) {
                          Get.to(
                            () => PlaceOfflineDelivery(
                              processingMins: processMins,
                              courierComment: customerCommentToCourier == "Others"
                                  ? courierCommentController.text
                                  : customerCommentToCourier,
                              orderId: value[1]['data']['id'],
                              lat: widget.lat.toString(),
                              lng: widget.lng.toString(),
                              amount: _amountController.text,
                              phoneNo: phoneNumber,
                              deliveryNote: _noteController.text,
                              itemDesc: _itemDescController.text,
                              recipientName: _nameController.text,
                              apartment: _addressController.text,
                              deliveryAddress: widget.deliveryAddress,
                              takeCash: takeCash,
                              takeInvoice: takeInvoiceAmount,
                            ),
                          );
                        } else {
                          GetSnackbars()
                              .errorSnackbar("Error".tr, "Failed to create order, try again".tr);
                        }
                      },
                    );
                  }
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
                        ? SizedBox(
                            height: 15.0,
                            width: 15.0,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          )
                        : Text(
                            "Request Order".tr,
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

  // ignore: prefer_final_fields
  List<Map> _myJson = myJson;
  _commentsDropDown() {
    return SizedBox(
      child: DropdownButton<String>(
        isExpanded: true,
        dropdownColor: Theme.of(context).backgroundColor,
        value: customerCommentToCourier,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 20,
        hint: Text(
          "Select option".tr,
          style: TextStyle(color: Colors.black),
        ),
        style: TextStyle(color: Colors.black),
        elevation: 16,
        onChanged: (String newValue) {
          FocusScope.of(context).unfocus();
          setState(() {
            customerCommentToCourier = newValue;
          });
          print(newValue);
        },
        items: _myJson.map((Map map) {
          return DropdownMenuItem<String>(
            value: map["name"],
            child: Text(
              map["name"],
            ),
          );
        }).toList(),
      ),
    );
  }

  List<Map> _myProcessJson = myProcessJson;
  _processMinsDropDown() {
    return Container(
      child: DropdownButton<String>(
        isExpanded: true,
        dropdownColor: Theme.of(context).backgroundColor,
        value: processMins,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 20,
        hint: new Text(
          "Select option".tr,
          style: TextStyle(color: Colors.black),
        ),
        style: TextStyle(color: Colors.black),
        elevation: 16,
        onChanged: (String newValue) {
          FocusScope.of(context).unfocus();
          setState(() {
            processMins = newValue;
          });
          print(newValue);
        },
        items: _myProcessJson.map((Map map) {
          return new DropdownMenuItem<String>(
            value: map["value"],
            child: new Text(
              map["name"],
            ),
          );
        }).toList(),
      ),
    );
  }
}
