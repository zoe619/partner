import 'package:flutter/material.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/margin.dart';

class TopSellingItemsWidget extends StatefulWidget {
  final int index, itemCount;
  final String itemName;

  const TopSellingItemsWidget(
      {Key key, this.index, this.itemCount, this.itemName})
      : super(key: key);
  @override
  _TopSellingItemsWidgetState createState() => _TopSellingItemsWidgetState();
}

class _TopSellingItemsWidgetState extends State<TopSellingItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YMargin(10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.index == 1 ? amber.shade200 : grey),
              child: Center(
                child: Text(
                  "0" + widget.index.toString(),
                  style: TextStyle(
                      color: widget.index == 1 ? white : grey.shade200,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            XMargin(10),
            Text(
              widget.itemName,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Text(
              widget.itemCount.toString(),
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ],
    );
  }
}
