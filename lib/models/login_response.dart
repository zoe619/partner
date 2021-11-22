
class LoginResponse {
  bool _success;
  String _data;
  String _message;

  bool get success => _success;
  String get data => _data;
  String get message => _message;

  LoginResponse({
      bool success, 
      String data, 
      String message}){
    _success = success;
    _data = data;
    _message = message;
}

  LoginResponse.fromJson(dynamic json) {
    _success = json["success"];
    _data = json["data"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    map["data"] = _data;
    map["message"] = _message;
    return map;
  }

}