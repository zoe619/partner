import 'package:order_tracker/models/data_model.dart';

class GetRestaurantUserData {
  Data data;
  String message;

  GetRestaurantUserData({this.data, this.message});

  GetRestaurantUserData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Channel {
  int id;
  String name;
  Null description;
  String seoUrl;
  int verified;
  int isSuspended;
  Null countryId;
  int userId;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  int experienceEnabled;
  int channelActiveSubscribersCount;
  String channelImage;
  Null channelBackgroundImage;
  bool isUserSubscribed;
  bool notifyMe;

  Channel(
      {this.id,
      this.name,
      this.description,
      this.seoUrl,
      this.verified,
      this.isSuspended,
      this.countryId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.experienceEnabled,
      this.channelActiveSubscribersCount,
      this.channelImage,
      this.channelBackgroundImage,
      this.isUserSubscribed,
      this.notifyMe});

  Channel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    seoUrl = json['seo_url'];
    verified = json['verified'];
    isSuspended = json['is_suspended'];
    countryId = json['country_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    experienceEnabled = json['experience_enabled'];
    channelActiveSubscribersCount = json['channel_active_subscribers_count'];
    channelImage = json['channel_image'];
    channelBackgroundImage = json['channel_background_image'];
    isUserSubscribed = json['is_user_subscribed'];
    notifyMe = json['notify_me'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['seo_url'] = this.seoUrl;
    data['verified'] = this.verified;
    data['is_suspended'] = this.isSuspended;
    data['country_id'] = this.countryId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['experience_enabled'] = this.experienceEnabled;
    data['channel_active_subscribers_count'] = this.channelActiveSubscribersCount;
    data['channel_image'] = this.channelImage;
    data['channel_background_image'] = this.channelBackgroundImage;
    data['is_user_subscribed'] = this.isUserSubscribed;
    data['notify_me'] = this.notifyMe;
    return data;
  }
}

class MyInterests {
  int id;
  int interestId;
  String interestableType;
  int interestableId;
  String createdAt;
  String updatedAt;
  String text;
  String value;

  MyInterests(
      {this.id,
      this.interestId,
      this.interestableType,
      this.interestableId,
      this.createdAt,
      this.updatedAt,
      this.text,
      this.value});

  MyInterests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    interestId = json['interest_id'];
    interestableType = json['interestable_type'];
    interestableId = json['interestable_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['interest_id'] = this.interestId;
    data['interestable_type'] = this.interestableType;
    data['interestable_id'] = this.interestableId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['text'] = this.text;
    data['value'] = this.value;
    return data;
  }
}
