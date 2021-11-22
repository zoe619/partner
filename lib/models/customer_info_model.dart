class CustomerModel {
  dynamic id;
  dynamic name;
  dynamic phone;
  dynamic address;
  dynamic building;
  dynamic email;
  dynamic courierConsumerableType;
  dynamic courierConsumerableId;
  dynamic cityId;
  dynamic countryId;
  dynamic courierCustomerId;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic lat;
  dynamic lng;

  CustomerModel(
      {this.id,
      this.name,
      this.phone,
      this.address,
      this.building,
      this.email,
      this.courierConsumerableType,
      this.courierConsumerableId,
      this.cityId,
      this.countryId,
      this.courierCustomerId,
      this.createdAt,
      this.updatedAt,
      this.lat,
      this.lng});

  CustomerModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    building = json['building'];
    email = json['email'];
    courierConsumerableType = json['courier_consumerable_type'];
    courierConsumerableId = json['courier_consumerable_id'];
    cityId = json['city_id'];
    countryId = json['country_id'];
    courierCustomerId = json['courier_customer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['building'] = this.building;
    data['email'] = this.email;
    data['courier_consumerable_type'] = this.courierConsumerableType;
    data['courier_consumerable_id'] = this.courierConsumerableId;
    data['city_id'] = this.cityId;
    data['country_id'] = this.countryId;
    data['courier_customer_id'] = this.courierCustomerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
