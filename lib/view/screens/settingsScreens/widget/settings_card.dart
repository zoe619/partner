import 'package:flutter/material.dart';
import 'package:order_tracker/utils/colors.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback onTap;
  const SettingsCard({
    Key key,
    this.title,
    this.leadingIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: ListTile(
            leading: Icon(leadingIcon),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            trailing: RotatedBox(
              quarterTurns: 2,
              child: Icon(
                Icons.arrow_back_ios,
                color: black.withOpacity(0.7),
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
