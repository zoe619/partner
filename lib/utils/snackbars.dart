import 'package:get/get.dart';

import 'colors.dart';

class GetSnackbars {
  void successSnackbar(String title, String message) {
    return Get.snackbar(title, message,
        colorText: white, backgroundColor: green);
  }

  void errorSnackbar(String title, String message) {
    return Get.snackbar(title, message, colorText: white, backgroundColor: red);
  }

  void neutralSnackbar(String title, String message) {
    return Get.snackbar(title, message,
        colorText: white, backgroundColor: grey);
  }
}
