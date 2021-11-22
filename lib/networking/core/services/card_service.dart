import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:order_tracker/networking/core/api/api.dart';
import 'package:order_tracker/utils/constants.dart';
import 'package:order_tracker/utils/snackbars.dart';

class CardService extends GetxController {
  Future addCardInfo(cardNo, mmYY, cVV) async {
    var url = Api.$BASE_URL + "";
    var token = await storage.read(key: "token");
    try {
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        // body: json.encode();
      );
      print(response.body);
      if (response.statusCode == 200) {
        GetSnackbars().successSnackbar("Success", "The card details have been added.");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
