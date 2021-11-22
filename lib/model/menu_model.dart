class MenuModel {
  List<Data> data;
  Links links;
  Meta meta;
  String message;

  MenuModel({this.data, this.links, this.meta, this.message});

  MenuModel.fromJson(Map<String, dynamic> json) {
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
  int id;
  String name;
  var price;
  int foodMenuId;
  String description;
  String createdAt;
  String updatedAt;
  int restaurantId;
  int isSuspended;
  int isActive;
  int currencyId;
  int videoId;
  String seoUrl;
  int cookingTime;
  int isDeleted;
  String mediaType;
  var discount;
  int dislikesCount;
  int likedsCount;
  int visitorsCount;
  int imageCount;
  String humanTime;
  int activeRestaurant;
  int suspendedRestaurant;
  String address;
  String city;
  Currency currency;
  Restaurant restaurant;

  Data(
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
      this.dislikesCount,
      this.likedsCount,
      this.visitorsCount,
      this.imageCount,
      this.humanTime,
      this.activeRestaurant,
      this.suspendedRestaurant,
      this.address,
      this.city,
      this.currency,
      this.restaurant});

  Data.fromJson(Map<String, dynamic> json) {
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
    dislikesCount = json['dislikes_count'];
    likedsCount = json['likeds_count'];
    visitorsCount = json['visitors_count'];
    imageCount = json['image_count'];
    humanTime = json['human_time'];
    activeRestaurant = json['active_restaurant'];
    suspendedRestaurant = json['suspended_restaurant'];
    address = json['address'];
    city = json['city'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
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
    data['dislikes_count'] = this.dislikesCount;
    data['likeds_count'] = this.likedsCount;
    data['visitors_count'] = this.visitorsCount;
    data['image_count'] = this.imageCount;
    data['human_time'] = this.humanTime;
    data['active_restaurant'] = this.activeRestaurant;
    data['suspended_restaurant'] = this.suspendedRestaurant;
    data['address'] = this.address;
    data['city'] = this.city;
    if (this.currency != null) {
      data['currency'] = this.currency.toJson();
    }
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant.toJson();
    }
    return data;
  }
}

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

class Restaurant {
  int id;
  String name;
  String phone;
  String seoUrl;
  String token;
  var executiveChef;
  int restaurantApplicationId;
  int userId;
  int vatPercent;
  int countryId;
  var region;
  String city;
  String status;
  var dressCode;
  var cuisine;
  var policy;
  var additionalInfo;
  String createdAt;
  String updatedAt;
  String address;
  int videoId;
  int takeAwayEnabled;
  int dineInEnabled;
  int deliveryEnabled;
  int currencyId;
  String whatsAppNumber;
  double lng;
  double lat;
  var deliveryNote;
  String website;
  int isApproved;
  int isSuspended;
  var facebook;
  var linkedIn;
  var tiktok;
  var instagram;
  var twitter;
  var pinterest;
  var officeEmail;
  var timezoneId;
  String externalMenu;
  String imageUrl;
  String humanTime;
  Currency currency;

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
      this.imageUrl,
      this.humanTime,
      this.currency});

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
    imageUrl = json['image_url'];
    humanTime = json['human_time'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
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
    data['image_url'] = this.imageUrl;
    data['human_time'] = this.humanTime;
    if (this.currency != null) {
      data['currency'] = this.currency.toJson();
    }
    return data;
  }
}

class Links {
  String first;
  String last;
  var prev;
  var next;

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
  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

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
