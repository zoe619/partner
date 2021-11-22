import 'package:order_tracker/models/restaurant_model.dart';

class BookingItemable {
  int id;
  String name;
  int price;
  int foodMenuId;
  dynamic description;
  String createdAt;
  String updatedAt;
  int restaurantId;
  int isSuspended;
  int isActive;
  var currencyId;
  int videoId;
  String seoUrl;
  int cookingTime;
  int isDeleted;
  String mediaType;
  int discount;
  String humanTime;
  int activeRestaurant;
  int suspendedRestaurant;
  String address;
  String city;
  Restaurant restaurant;

  BookingItemable(
      {this.id,
        this.name,
        this.price,
        this.foodMenuId,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.restaurantId,
        this.isSuspended,
        this.isActive,
        this.currencyId,
        this.videoId,
        this.seoUrl,
        this.cookingTime,
        this.isDeleted,
        this.mediaType,
        this.discount,
        this.humanTime,
        this.activeRestaurant,
        this.suspendedRestaurant,
        this.address,
        this.city,
        this.restaurant});

  BookingItemable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    foodMenuId = json['food_menu_id'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    restaurantId = json['restaurant_id'];
    isSuspended = json['is_suspended'];
    isActive = json['is_active'];
    currencyId = json['currency_id'];
    videoId = json['video_id'];
    seoUrl = json['seo_url'];
    cookingTime = json['cooking_time'];
    isDeleted = json['is_deleted'];
    mediaType = json['media_type'];
    discount = json['discount'];
    humanTime = json['human_time'];
    activeRestaurant = json['active_restaurant'];
    suspendedRestaurant = json['suspended_restaurant'];
    address = json['address'];
    city = json['city'];
    restaurant = json['restaurant'] != null ? new Restaurant.fromJson(json['restaurant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['food_menu_id'] = this.foodMenuId;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['restaurant_id'] = this.restaurantId;
    data['is_suspended'] = this.isSuspended;
    data['is_active'] = this.isActive;
    data['currency_id'] = this.currencyId;
    data['video_id'] = this.videoId;
    data['seo_url'] = this.seoUrl;
    data['cooking_time'] = this.cookingTime;
    data['is_deleted'] = this.isDeleted;
    data['media_type'] = this.mediaType;
    data['discount'] = this.discount;
    data['human_time'] = this.humanTime;
    data['active_restaurant'] = this.activeRestaurant;
    data['suspended_restaurant'] = this.suspendedRestaurant;
    data['address'] = this.address;
    data['city'] = this.city;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant.toJson();
    }
    return data;
  }
}