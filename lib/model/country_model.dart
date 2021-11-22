class Country {
  int id;
  String code;
  String seoUrl;
  dynamic description;
  int destinationEnabled;
  int top;
  String name;
  String dCode;
  int isActive;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;
  int experienceEnabled;
  String imageUrl;
  dynamic mapUrl;

  Country(
      {this.id,
      this.code,
      this.seoUrl,
      this.description,
      this.destinationEnabled,
      this.top,
      this.name,
      this.dCode,
      this.isActive,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.experienceEnabled,
      this.imageUrl,
      this.mapUrl});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    seoUrl = json['seo_url'];
    description = json['description'];
    destinationEnabled = json['destination_enabled'];
    top = json['top'];
    name = json['name'];
    dCode = json['d_code'];
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    experienceEnabled = json['experience_enabled'];
    imageUrl = json['image_url'];
    mapUrl = json['map_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['seo_url'] = this.seoUrl;
    data['description'] = this.description;
    data['destination_enabled'] = this.destinationEnabled;
    data['top'] = this.top;
    data['name'] = this.name;
    data['d_code'] = this.dCode;
    data['is_active'] = this.isActive;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['experience_enabled'] = this.experienceEnabled;
    data['image_url'] = this.imageUrl;
    data['map_url'] = this.mapUrl;
    return data;
  }
}
