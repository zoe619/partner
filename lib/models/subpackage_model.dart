class SubPackage {
  int id;
  String name;
  int isActive;
  double amount;
  int percentageOffByYear;
  String info;
  String nextStep;
  String createdAt;
  String updatedAt;
  int sort;
  String product;
  String monthlyPrice;
  String yearlyPrice;

  SubPackage(
      {this.id,
        this.name,
        this.isActive,
        this.amount,
        this.percentageOffByYear,
        this.info,
        this.nextStep,
        this.createdAt,
        this.updatedAt,
        this.sort,
        this.product,
        this.monthlyPrice,
        this.yearlyPrice});

  SubPackage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['is_active'];
    amount = json['amount'];
    percentageOffByYear = json['percentage_off_by_year'];
    info = json['info'];
    nextStep = json['next_step'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sort = json['sort'];
    product = json['product'];
    monthlyPrice = json['monthly_price'];
    yearlyPrice = json['yearly_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['amount'] = this.amount;
    data['percentage_off_by_year'] = this.percentageOffByYear;
    data['info'] = this.info;
    data['next_step'] = this.nextStep;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['sort'] = this.sort;
    data['product'] = this.product;
    data['monthly_price'] = this.monthlyPrice;
    data['yearly_price'] = this.yearlyPrice;
    return data;
  }
}