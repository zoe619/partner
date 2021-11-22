import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class NotOfficial extends StatefulWidget {
  const NotOfficial({Key key}) : super(key: key);

  @override
  _NotOfficialState createState() => _NotOfficialState();
}

class _NotOfficialState extends State<NotOfficial> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Center(
              child: Text(
                "This account does not operate as a restaurant",
                style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
