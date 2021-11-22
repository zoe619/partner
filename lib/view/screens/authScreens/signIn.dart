import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/networking/core/services/auth_service.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/utils/sys_alert_window_utils.dart';
import 'package:order_tracker/view/screens/authScreens/signUp.dart';
import 'package:url_launcher/url_launcher.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _authService = Get.put(AuthService());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool authenticating = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.grey,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YMargin(
                      screenHeight(context, percent: 0.02),
                    ),
                    Container(
                      height: 30,
                      width: 150,
                      child: Image.asset(
                        "assets/images/defaultLogo.png",
                        fit: BoxFit.cover,
                        // width: 170,
                      ),
                    ),
                    YMargin(
                      screenHeight(context, percent: 0.01),
                    ),
                    Text(
                      "Partner Central",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    YMargin(
                      screenHeight(context, percent: 0.02),
                    ),
                    Text(
                      "Login".tr,
                      style: GoogleFonts.montserrat(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                    YMargin(
                      screenHeight(context, percent: 0.1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                              child: TextFormField(
                                validator: EmailValidator(errorText: 'Enter a valid email address'),
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Email Address".tr,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0, bottom: 9),
                              child: TextFormField(
                                validator: MinLengthValidator(1, errorText: 'Enter your password'),
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  // border: InputBorder.none,
                                  labelText: "Password".tr,
                                ),
                              ),
                            ),
                            YMargin(
                              screenHeight(context, percent: 0.2),
                            ),
                            Container(
                              height: 50,
                              width: 344,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    var email =
                                        emailController.text.toString().trim().replaceAll(" ", "");
                                    var password = passwordController.text
                                        .toString()
                                        .trim()
                                        .replaceAll(" ", "");
                                    setState(() {
                                      authenticating = true;
                                    });
                                    _authService.login(email, password, context).then((value) {
                                      setState(() {
                                        authenticating = false;
                                      });
                                    }).catchError((e) {
                                      setState(() {
                                        authenticating = false;
                                      });
                                    });
                                  } else {}
                                  // Get.to(() => BottomNavigation());
                                },
                                child: Builder(
                                  builder: (context) {
                                    if (authenticating == true) {
                                      return Container(
                                        height: 15,
                                        width: 15,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(Colors.white),
                                        ),
                                      );
                                    } else {
                                      return Text(
                                        "Login".tr,
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                            YMargin(
                              screenHeight(context, percent: 0.1),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       "Don't have an account? ",
                            //       style: GoogleFonts.montserrat(
                            //         fontWeight: FontWeight.w400,
                            //         color: Colors.black,
                            //         fontSize: 15,
                            //       ),
                            //     ),
                            //     GestureDetector(
                            //       onTap: () {
                            //         launchSignUp();
                            //       },
                            //       child: Text(
                            //         "Sign Up",
                            //         style: GoogleFonts.montserrat(
                            //           fontWeight: FontWeight.w400,
                            //           color: Colors.blue,
                            //           fontSize: 15,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            const YMargin(30),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void launchSignUp() async {
    var url = 'https://partnercentral.travtubes.com/restaurant-apply';
    var fallbackUrl = 'https://partnercentral.travtubes.com/';
    try {
      bool launched = await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }
}
