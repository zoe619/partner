import 'package:flutter/material.dart';
import 'package:order_tracker/state/broadcast.dart';

class PricingAndDeliveryOption extends StatefulWidget {
  @override
  _PricingAndDeliveryOptionState createState() =>
      _PricingAndDeliveryOptionState();
}

class _PricingAndDeliveryOptionState extends State<PricingAndDeliveryOption> {
  int group = 0;
  bool openOrder = false;
  bool openDelivery = false;
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(211, 34, 22, 0.7),
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(openOrder ? 20 : 50),
                  right: Radius.circular(openOrder ? 20 : 50)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add price for online ordering",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            openOrder = openOrder ? false : true;
                            if (openOrder) openDelivery = false;
                          });
                        },
                        child: Image.asset(openOrder
                            ? 'assets/images/downarrow.png'
                            : 'assets/images/fwdovalarrow.png'),
                      ),
                    ],
                  ),
                ),
                openOrder
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Container(
                          child: Row(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "E",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    controller: _controller,
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (value) {
                                      setState(() {
                                        broadcastValues['price'] = value;
                                      });
                                      print(
                                          "price ${broadcastValues['price']}");
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
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
                                      hintText: 'Price',
                                      hintStyle: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ),
          //
          // DELIVERY
          //
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(211, 34, 22, 0.7),
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(openDelivery ? 20 : 50),
                  right: Radius.circular(openDelivery ? 20 : 50)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select your option",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            openDelivery = openDelivery ? false : true;
                            if (openDelivery) openOrder = false;
                          });
                        },
                        child: Image.asset(openDelivery
                            ? 'assets/images/downarrow.png'
                            : 'assets/images/fwdovalarrow.png'),
                      ),
                    ],
                  ),
                ),
                openDelivery
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: group,
                                    onChanged: (int i) {
                                      setState(() {
                                        group = i;
                                        broadcastValues['option'] = 'Delivery';
                                      });
                                    },
                                    activeColor: Colors.white,
                                  ),
                                  Text(
                                    'Delivery',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Radio(
                                    value: 2,
                                    groupValue: group,
                                    onChanged: (int i) {
                                      setState(() {
                                        group = i;
                                        broadcastValues['option'] = 'Takeaway';
                                      });
                                    },
                                    activeColor: Colors.white,
                                  ),
                                  Text('Takeaway',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 3,
                                    groupValue: group,
                                    onChanged: (int i) {
                                      setState(() {
                                        group = i;
                                        broadcastValues['option'] = 'Both';
                                      });
                                    },
                                    activeColor: Colors.white,
                                  ),
                                  Text(
                                    'Both',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
