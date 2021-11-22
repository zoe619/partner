import 'operating_hours_model.dart';

class GetCommentsModel {
  List<Data> data;
  Links links;
  Meta meta;
  String message;

  GetCommentsModel({this.data, this.links, this.meta, this.message});

  GetCommentsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  dynamic id;
  String comment;
  dynamic userId;
  dynamic isAllowed;
  String createdAt;
  String updatedAt;
  dynamic rating;
  dynamic deletedAt;
  dynamic parentId;
  User user;
  String humanTime;
  Commentable commentable;

  Data(
      {this.id,
      this.comment,
      this.userId,
      this.isAllowed,
      this.createdAt,
      this.updatedAt,
      this.rating,
      this.deletedAt,
      this.parentId,
      this.user,
      this.humanTime,
      this.commentable});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    userId = json['user_id'];
    isAllowed = json['is_allowed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rating = json['rating'];
    deletedAt = json['deleted_at'];
    parentId = json['parent_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    humanTime = json['human_time'];
    commentable =
        json['commentable'] != null ? new Commentable.fromJson(json['commentable']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['user_id'] = this.userId;
    data['is_allowed'] = this.isAllowed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rating'] = this.rating;
    data['deleted_at'] = this.deletedAt;
    data['parent_id'] = this.parentId;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['human_time'] = this.humanTime;
    if (this.commentable != null) {
      data['commentable'] = this.commentable.toJson();
    }
    return data;
  }
}

class User {
  String firstName;
  String lastName;
  String email;
  String image;

  User({this.firstName, this.lastName, this.email, this.image});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }
}

class Commentable {
  dynamic id;
  String name;
  dynamic price;
  dynamic foodMenuId;
  String description;
  String createdAt;
  String updatedAt;
  dynamic restaurantId;
  dynamic isSuspended;
  dynamic isActive;
  dynamic currencyId;
  dynamic videoId;
  String seoUrl;
  dynamic cookingTime;
  dynamic isDeleted;
  String mediaType;
  dynamic discount;
  dynamic subMenuId;
  String humanTime;
  dynamic activeRestaurant;
  dynamic suspendedRestaurant;
  String address;
  String city;
  String restaurantName;
  Restaurant restaurant;

  Commentable(
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
      this.subMenuId,
      this.humanTime,
      this.activeRestaurant,
      this.suspendedRestaurant,
      this.address,
      this.city,
      this.restaurantName,
      this.restaurant});

  Commentable.fromJson(Map<String, dynamic> json) {
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
    subMenuId = json['sub_menu_id'];
    humanTime = json['human_time'];
    activeRestaurant = json['active_restaurant'];
    suspendedRestaurant = json['suspended_restaurant'];
    address = json['address'];
    city = json['city'];
    restaurantName = json['restaurant_name'];
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
    data['sub_menu_id'] = this.subMenuId;
    data['human_time'] = this.humanTime;
    data['active_restaurant'] = this.activeRestaurant;
    data['suspended_restaurant'] = this.suspendedRestaurant;
    data['address'] = this.address;
    data['city'] = this.city;
    data['restaurant_name'] = this.restaurantName;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant.toJson();
    }
    return data;
  }
}

class Restaurant {
  dynamic id;
  String name;
  String phone;
  String seoUrl;
  String token;
  dynamic executiveChef;
  dynamic restaurantApplicationId;
  dynamic userId;
  dynamic vatPercent;
  dynamic countryId;
  dynamic region;
  dynamic city;
  String status;
  dynamic dressCode;
  dynamic cuisine;
  dynamic policy;
  dynamic additionalInfo;
  String createdAt;
  String updatedAt;
  String address;
  dynamic videoId;
  dynamic takeAwayEnabled;
  dynamic dineInEnabled;
  dynamic deliveryEnabled;
  dynamic currencyId;
  String whatsAppNumber;
  double lng;
  double lat;
  dynamic deliveryNote;
  dynamic website;
  dynamic isApproved;
  dynamic isSuspended;
  dynamic facebook;
  dynamic linkedIn;
  dynamic tiktok;
  dynamic instagram;
  dynamic twitter;
  dynamic pinterest;
  dynamic officeEmail;
  dynamic timezoneId;
  dynamic externalMenu;
  dynamic discount;
  dynamic cityId;
  dynamic isOnlineOrdersActive;
  String imageUrl;
  String humanTime;
  Operating operating;
  List<OperatingHours> operatingHours;

  Restaurant(
      {this.id,
      this.name,
      this.phone,
      this.seoUrl,
      this.token,
      this.executiveChef,
      this.restaurantApplicationId,
      this.userId,
      this.vatPercent,
      this.countryId,
      this.region,
      this.city,
      this.status,
      this.dressCode,
      this.cuisine,
      this.policy,
      this.additionalInfo,
      this.createdAt,
      this.updatedAt,
      this.address,
      this.videoId,
      this.takeAwayEnabled,
      this.dineInEnabled,
      this.deliveryEnabled,
      this.currencyId,
      this.whatsAppNumber,
      this.lng,
      this.lat,
      this.deliveryNote,
      this.website,
      this.isApproved,
      this.isSuspended,
      this.facebook,
      this.linkedIn,
      this.tiktok,
      this.instagram,
      this.twitter,
      this.pinterest,
      this.officeEmail,
      this.timezoneId,
      this.externalMenu,
      this.discount,
      this.cityId,
      this.isOnlineOrdersActive,
      this.imageUrl,
      this.humanTime,
      this.operating,
      this.operatingHours});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    seoUrl = json['seo_url'];
    token = json['token'];
    executiveChef = json['executive_chef'];
    restaurantApplicationId = json['restaurant_application_id'];
    userId = json['user_id'];
    vatPercent = json['vat_percent'];
    countryId = json['country_id'];
    region = json['region'];
    city = json['city'];
    status = json['status'];
    dressCode = json['dress_code'];
    cuisine = json['cuisine'];
    policy = json['policy'];
    additionalInfo = json['additional_info'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    address = json['address'];
    videoId = json['video_id'];
    takeAwayEnabled = json['take_away_enabled'];
    dineInEnabled = json['dine_in_enabled'];
    deliveryEnabled = json['delivery_enabled'];
    currencyId = json['currency_id'];
    whatsAppNumber = json['whats_app_number'];
    lng = json['lng'];
    lat = json['lat'];
    deliveryNote = json['delivery_note'];
    website = json['website'];
    isApproved = json['is_approved'];
    isSuspended = json['is_suspended'];
    facebook = json['facebook'];
    linkedIn = json['linked_in'];
    tiktok = json['tiktok'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    pinterest = json['pinterest'];
    officeEmail = json['office_email'];
    timezoneId = json['timezone_id'];
    externalMenu = json['external_menu'];
    discount = json['discount'];
    cityId = json['city_id'];
    isOnlineOrdersActive = json['is_online_orders_active'];
    imageUrl = json['image_url'];
    humanTime = json['human_time'];
    operating = json['operating'] != null ? new Operating.fromJson(json['operating']) : null;
    if (json['operating_hours'] != null) {
      operatingHours = <OperatingHours>[];
      json['operating_hours'].forEach((v) {
        operatingHours.add(new OperatingHours.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['seo_url'] = this.seoUrl;
    data['token'] = this.token;
    data['executive_chef'] = this.executiveChef;
    data['restaurant_application_id'] = this.restaurantApplicationId;
    data['user_id'] = this.userId;
    data['vat_percent'] = this.vatPercent;
    data['country_id'] = this.countryId;
    data['region'] = this.region;
    data['city'] = this.city;
    data['status'] = this.status;
    data['dress_code'] = this.dressCode;
    data['cuisine'] = this.cuisine;
    data['policy'] = this.policy;
    data['additional_info'] = this.additionalInfo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['address'] = this.address;
    data['video_id'] = this.videoId;
    data['take_away_enabled'] = this.takeAwayEnabled;
    data['dine_in_enabled'] = this.dineInEnabled;
    data['delivery_enabled'] = this.deliveryEnabled;
    data['currency_id'] = this.currencyId;
    data['whats_app_number'] = this.whatsAppNumber;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    data['delivery_note'] = this.deliveryNote;
    data['website'] = this.website;
    data['is_approved'] = this.isApproved;
    data['is_suspended'] = this.isSuspended;
    data['facebook'] = this.facebook;
    data['linked_in'] = this.linkedIn;
    data['tiktok'] = this.tiktok;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['pinterest'] = this.pinterest;
    data['office_email'] = this.officeEmail;
    data['timezone_id'] = this.timezoneId;
    data['external_menu'] = this.externalMenu;
    data['discount'] = this.discount;
    data['city_id'] = this.cityId;
    data['is_online_orders_active'] = this.isOnlineOrdersActive;
    data['image_url'] = this.imageUrl;
    data['human_time'] = this.humanTime;
    if (this.operating != null) {
      data['operating'] = this.operating.toJson();
    }
    if (this.operatingHours != null) {
      data['operating_hours'] = this.operatingHours.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Operating {
  bool isOpen;
  String openingAt;
  String closesAt;
  List<AllDays> allDays;

  Operating({this.isOpen, this.openingAt, this.closesAt, this.allDays});

  Operating.fromJson(Map<String, dynamic> json) {
    isOpen = json['is_open'];
    openingAt = json['opening_at'];
    closesAt = json['closes_at'];
    if (json['all_days'] != null) {
      allDays = <AllDays>[];
      json['all_days'].forEach((v) {
        allDays.add(new AllDays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_open'] = this.isOpen;
    data['opening_at'] = this.openingAt;
    data['closes_at'] = this.closesAt;
    if (this.allDays != null) {
      data['all_days'] = this.allDays.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllDays {
  dynamic id;
  String timeFrom;
  String timeTo;
  dynamic day;
  dynamic isActive;
  String createdAt;
  String updatedAt;
  String dayName;

  AllDays(
      {this.id,
      this.timeFrom,
      this.timeTo,
      this.day,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.dayName});

  AllDays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    day = json['day'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    dayName = json['day_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['time_from'] = this.timeFrom;
    data['time_to'] = this.timeTo;
    data['day'] = this.day;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['day_name'] = this.dayName;
    return data;
  }
}

class Links {
  String first;
  String last;
  dynamic prev;
  String next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  dynamic currentPage;
  dynamic from;
  dynamic lastPage;
  String path;
  dynamic perPage;
  dynamic to;
  dynamic total;

  Meta({this.currentPage, this.from, this.lastPage, this.path, this.perPage, this.to, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}
