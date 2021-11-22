import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NetworkErrorAnimation extends StatefulWidget {
  @override
  _NetworkErrorAnimationState createState() => _NetworkErrorAnimationState();
}

class _NetworkErrorAnimationState extends State<NetworkErrorAnimation> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0.0),
      backgroundColor: Colors.white.withOpacity(0.1),
      child: Container(
        height: 53,
        // MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "No internet connection detected!",
              style: GoogleFonts.montserrat(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
