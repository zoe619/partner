class Currency {
  int id;
  String name;
  String code;
  String symbol;
  String format;
  String exchangeRate;
  int active;
  String createdAt;
  String updatedAt;

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

  Currency.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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