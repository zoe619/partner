class CalculatedRouteModel {
  Data data;
  dynamic message;
  int status;
  CalculatedRouteModel({this.data, this.message, this.status = 400});

  CalculatedRouteModel.fromJson(Map<dynamic, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  dynamic courierFee;
  dynamic distance;
  dynamic time;
  Currency currency;

  Data({this.courierFee, this.distance, this.time, this.currency});

  Data.fromJson(Map<String, dynamic> json) {
    courierFee = json['courier_fee'];
    distance = json['distance'];
    time = json['time'];
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courier_fee'] = this.courierFee;
    data['distance'] = this.distance;
    data['time'] = this.time;
    if (this.currency != null) {
      data['currency'] = this.currency.toJson();
    }
    return data;
  }
}

class Currency {
  dynamic id;
  dynamic name;
  dynamic code;
  dynamic symbol;
  dynamic format;
  dynamic exchangeRate;
  dynamic active;
  dynamic createdAt;
  dynamic updatedAt;

  Currency(
      {this.id,
      this.name,
      this.code,
      this.symbol,
      this.format,
      this.exchangeRate,
      this.active,
      this.createdAt,
      this.updatedAt});

  Currency.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    symbol = json['symbol'];
    format = json['format'];
    exchangeRate = json['exchange_rate'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['symbol'] = this.symbol;
    data['format'] = this.format;
    data['exchange_rate'] = this.exchangeRate;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
