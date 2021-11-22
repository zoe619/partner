class ReportsPayoutHistory {
  // List<Null> data;
  String message;
  List<Revenue> revenue;
  dynamic earning;
  dynamic currentBalance;
  dynamic payoutBalance;
  dynamic weeklyNet;

  ReportsPayoutHistory(
      {
      // this.data,
      this.message,
      this.revenue,
      this.earning,
      this.currentBalance,
      this.payoutBalance,
      this.weeklyNet});

  ReportsPayoutHistory.fromJson(Map<String, dynamic> json) {
    // if (json['data'] != null) {
    //   data = new List<Null>();
    //   json['data'].forEach((v) {
    //     data.add(new Null.fromJson(v));
    //   });
    // }
    message = json['message'];
    if (json['revenue'] != null) {
      revenue = <Revenue>[];
      json['revenue'].forEach((v) {
        revenue.add(new Revenue.fromJson(v));
      });
    }
    earning = json['earning'];
    currentBalance = json['current_balance'];
    payoutBalance = json['payout_balance'];
    weeklyNet = json['weekly_net'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.data != null) {
    //   data['data'] = this.data.map((v) => v.toJson()).toList();
    // }
    data['message'] = this.message;
    if (this.revenue != null) {
      data['revenue'] = this.revenue.map((v) => v.toJson()).toList();
    }
    data['earning'] = this.earning;
    data['current_balance'] = this.currentBalance;
    data['payout_balance'] = this.payoutBalance;
    data['weekly_net'] = this.weeklyNet;
    return data;
  }
}

class Revenue {
  String day;
  dynamic total;

  Revenue({this.day, this.total});

  Revenue.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['total'] = this.total;
    return data;
  }
}
