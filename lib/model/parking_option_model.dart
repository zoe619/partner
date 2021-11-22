import 'option_model.dart';

class ParkingOption {
  int id;
  int parkingOptionId;
  String parkingListableType;
  int parkingListableId;
  String createdAt;
  String updatedAt;
  Option option;

  ParkingOption(
      {this.id,
      this.parkingOptionId,
      this.parkingListableType,
      this.parkingListableId,
      this.createdAt,
      this.updatedAt,
      this.option});

  ParkingOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parkingOptionId = json['parking_option_id'];
    parkingListableType = json['parking_listable_type'];
    parkingListableId = json['parking_listable_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    option =
        json['option'] != null ? new Option.fromJson(json['option']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parking_option_id'] = this.parkingOptionId;
    data['parking_listable_type'] = this.parkingListableType;
    data['parking_listable_id'] = this.parkingListableId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.option != null) {
      data['option'] = this.option.toJson();
    }
    return data;
  }
}
