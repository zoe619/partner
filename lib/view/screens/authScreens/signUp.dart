import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker/networking/core/services/auth_service.dart';
import 'package:order_tracker/utils/colors.dart';
import 'package:order_tracker/utils/dropdown_values.dart';
import 'package:order_tracker/utils/margin.dart';
import 'package:order_tracker/view/screens/authScreens/signIn.dart';
import 'package:order_tracker/view/screens/navigation/bottomNav.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthService _authService = Get.put(AuthService());
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  var dropdownvalue;
  String genderdropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.grey,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   toolbarHeight: 80,
            //   title: Image.asset(
            //     "assets/images/defaultLogo.png",
            //     width: 170,
            //   ),
            //   backgroundColor: Colors.grey[100],
            //   elevation: 0,
            // ),
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
                      height: 45,
                      width: 225,
                      child: Image.asset(
                        "assets/images/defaultLogo.png",
                        fit: BoxFit.cover,
                        // width: 170,
                      ),
                    ),
                    YMargin(
                      screenHeight(context, percent: 0.02),
                    ),
                    Text(
                      "Create account".tr,
                      style: GoogleFonts.montserrat(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                    YMargin(
                      screenHeight(context, percent: 0.08),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 5),
                              child: Container(
                                height: 61,
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(0, 0, 0, 0.12),
                                ),
                                child: TextFormField(
                                  validator: MinLengthValidator(1,
                                      errorText: "Enter your first name"),
                                  controller: firstNameController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    // border: InputBorder.none,
                                    labelText: "First Name",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 5),
                              child: Container(
                                height: 61,
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(0, 0, 0, 0.12),
                                ),
                                child: TextFormField(
                                  validator: MinLengthValidator(1,
                                      errorText: "Enter your last name"),
                                  controller: lastNameController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    // border: InputBorder.none,
                                    labelText: "Last Name",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 5),
                              child: Container(
                                height: 61,
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(0, 0, 0, 0.12),
                                ),
                                child: TextFormField(
                                  validator: EmailValidator(
                                      errorText: 'Enter a valid email address'),
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    // border: InputBorder.none,
                                    labelText: "Email Address".tr,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 5),
                              child: _genderDropDown(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 5),
                              child: _ageGroupDropDown(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 5),
                              child: Container(
                                height: 61,
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromRGBO(0, 0, 0, 0.12),
                                ),
                                child: TextFormField(
                                  validator: MinLengthValidator(1,
                                      errorText: 'Enter your password'),
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    // border: InputBorder.none,
                                    labelText: "Password".tr,
                                  ),
                                ),
                              ),
                            ),
                            YMargin(
                              screenHeight(context, percent: 0.08),
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
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    var email = emailController.text
                                        .toString()
                                        .trim()
                                        .replaceAll(" ", "");
                                    var password = passwordController.text
                                        .toString()
                                        .trim()
                                        .replaceAll(" ", "");
                                    var firstName = firstNameController.text
                                        .toString()
                                        .trim()
                                        .replaceAll(" ", "");
                                    var lastName = lastNameController.text
                                        .toString()
                                        .trim()
                                        .replaceAll(" ", "");

                                    _authService
                                        .signUp(
                                            firstName,
                                            lastName,
                                            email,
                                            genderdropdownvalue.toLowerCase(),
                                            int.parse(dropdownvalue),
                                            password,
                                            context)
                                        .then((value) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }).catchError((e) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    });
                                  }

                                  // Get.offAll(() => BottomNavigation());
                                },
                                child: _isLoading == true
                                    ? Center(
                                        child: SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    white),
                                          ),
                                        ),
                                      )
                                    : Text(
                                        "Create Account",
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                              ),
                            ),
                            YMargin(
                              screenHeight(context, percent: 0.03),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.off(() => SignIn());
                                  },
                                  child: Text(
                                    "Sign in",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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

  List<Map> _myAgeGroup = myAgeGroup;
  _ageGroupDropDown() {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 5, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(0, 0, 0, 0.12),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        dropdownColor: white,
        value: dropdownvalue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 20,
        hint: new Text(
          "Age Group",
          style: TextStyle(color: black),
        ),
        style: TextStyle(color: black),
        elevation: 16,
        onChanged: (String newAgeValue) {
          setState(() {
            dropdownvalue = newAgeValue;
          });
          print("age group drop down value $dropdownvalue");
        },
        items: _myAgeGroup.map((Map map) {
          return new DropdownMenuItem<String>(
            value: map["value"],
            child: new Text(
              map["age_group"],
            ),
          );
        }).toList(),
      ),
    );
  }

  List<Map> _myGender = gender;
  _genderDropDown() {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 5, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(0, 0, 0, 0.12),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        dropdownColor: white,
        value: genderdropdownvalue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 20,
        hint: new Text(
          "Gender",
          style: TextStyle(color: black),
        ),
        style: TextStyle(color: black),
        elevation: 16,
        onChanged: (String newGenderValue) {
          setState(() {
            genderdropdownvalue = newGenderValue;
          });
          print("gender drop down value $genderdropdownvalue");
        },
        items: _myGender.map((Map map) {
          return new DropdownMenuItem<String>(
            value: map["gender"],
            child: new Text(
              map["gender"],
            ),
          );
        }).toList(),
      ),
    );
  }
}
