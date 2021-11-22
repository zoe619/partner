class Data {
  int totalBooking;
  int totalSubscription;
  int totalCommision;
  int totalViews;
  int totalScans;
  String base64;

  Data(
      {this.totalBooking,
        this.totalSubscription,
        this.totalCommision,
        this.totalViews,
        this.totalScans,
        this.base64});

  Data.fromJson(Map<String, dynamic> json) {
    totalBooking = json['total_booking'];
    totalSubscription = json['total_subscription'];
    totalCommision = json['total_commision'];
    totalViews = json['total_views'];
    totalScans = json['total_scans'];
    base64 = json['base64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_booking'] = this.totalBooking;
    data['total_subscription'] = this.totalSubscription;
    data['total_commision'] = this.totalCommision;
    data['total_views'] = this.totalViews;
    data['total_scans'] = this.totalScans;
    data['base64'] = this.base64;
    return data;
  }
}