class GetRestauarantFeedbacks {
  List<Data> data;
  Links links;
  Meta meta;
  String message;
  Restaurant restaurant;

  GetRestauarantFeedbacks(
      {this.data, this.links, this.meta, this.message, this.restaurant});

  GetRestauarantFeedbacks.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
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
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant.toJson();
    }
    return data;
  }
}

class Data {
  dynamic media;
  CreatedBy createdBy;
  String seoUrl;
  int rating;
  String comment;

  Data({this.media, this.createdBy, this.seoUrl, this.rating, this.comment});

  Data.fromJson(Map<String, dynamic> json) {
    media = json['media'];
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
    seoUrl = json['seo_url'];
    rating = json['rating'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media'] = this.media;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy.toJson();
    }
    data['seo_url'] = this.seoUrl;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    return data;
  }
}

class CreatedBy {
  int id;
  String email;
  dynamic emailVerifiedAt;
  int isSuspended;
  dynamic deletedAt;
  String timezone;
  String createdAt;
  String updatedAt;
  dynamic stripeId;
  dynamic cardBrand;
  dynamic cardLastFour;
  dynamic trialEndsAt;
  String lastSeen;
  int online;
  dynamic token;
  String customerId;
  Role role;
  String dateCreated;
  UserDetail userDetail;

  CreatedBy(
      {this.id,
      this.email,
      this.emailVerifiedAt,
      this.isSuspended,
      this.deletedAt,
      this.timezone,
      this.createdAt,
      this.updatedAt,
      this.stripeId,
      this.cardBrand,
      this.cardLastFour,
      this.trialEndsAt,
      this.lastSeen,
      this.online,
      this.token,
      this.customerId,
      this.role,
      this.dateCreated,
      this.userDetail});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isSuspended = json['is_suspended'];
    deletedAt = json['deleted_at'];
    timezone = json['timezone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stripeId = json['stripe_id'];
    cardBrand = json['card_brand'];
    cardLastFour = json['card_last_four'];
    trialEndsAt = json['trial_ends_at'];
    lastSeen = json['last_seen'];
    online = json['online'];
    token = json['token'];
    customerId = json['customer_id'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    dateCreated = json['date_created'];
    userDetail = json['user_detail'] != null
        ? new UserDetail.fromJson(json['user_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['is_suspended'] = this.isSuspended;
    data['deleted_at'] = this.deletedAt;
    data['timezone'] = this.timezone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['stripe_id'] = this.stripeId;
    data['card_brand'] = this.cardBrand;
    data['card_last_four'] = this.cardLastFour;
    data['trial_ends_at'] = this.trialEndsAt;
    data['last_seen'] = this.lastSeen;
    data['online'] = this.online;
    data['token'] = this.token;
    data['customer_id'] = this.customerId;
    if (this.role != null) {
      data['role'] = this.role.toJson();
    }
    data['date_created'] = this.dateCreated;
    if (this.userDetail != null) {
      data['user_detail'] = this.userDetail.toJson();
    }
    return data;
  }
}

class Role {
  int id;
  String name;
  String guardName;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  Role(
      {this.id,
      this.name,
      this.guardName,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int modelId;
  int roleId;
  String modelType;

  Pivot({this.modelId, this.roleId, this.modelType});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelId = json['model_id'];
    roleId = json['role_id'];
    modelType = json['model_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_id'] = this.modelId;
    data['role_id'] = this.roleId;
    data['model_type'] = this.modelType;
    return data;
  }
}

class UserDetail {
  int id;
  String firstName;
  String lastName;
  dynamic phone;
  dynamic address;
  dynamic description;
  dynamic dateOfBirth;
  dynamic phoneExtId;
  int countryId;
  dynamic regionId;
  dynamic cityId;
  dynamic zipCode;
  String seoUrl;
  int userId;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  String displayName;
  String privacy;
  String token;
  dynamic timeZone;
  String phoneNumber;
  int isWhatappEnabled;
  int ageGroupId;
  dynamic gender;
  dynamic paymentMethodId;
  dynamic userBankAccountId;
  dynamic location;
  dynamic lng;
  dynamic lat;
  String image;
  String email;
  int isSuspended;
  String role;
  // List<Null> socialAccounts;
  Channel channel;
  List<String> roles;
  String joined;
  List<MyInterests> myInterests;
  // List<Null> myLanguages;
  dynamic dob;

  UserDetail(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.address,
      this.description,
      this.dateOfBirth,
      this.phoneExtId,
      this.countryId,
      this.regionId,
      this.cityId,
      this.zipCode,
      this.seoUrl,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.displayName,
      this.privacy,
      this.token,
      this.timeZone,
      this.phoneNumber,
      this.isWhatappEnabled,
      this.ageGroupId,
      this.gender,
      this.paymentMethodId,
      this.userBankAccountId,
      this.location,
      this.lng,
      this.lat,
      this.image,
      this.email,
      this.isSuspended,
      this.role,
      this.channel,
      this.roles,
      this.joined,
      this.myInterests,
      this.dob});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    address = json['address'];
    description = json['description'];
    dateOfBirth = json['date_of_birth'];
    phoneExtId = json['phone_ext_id'];
    countryId = json['country_id'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    zipCode = json['zip_code'];
    seoUrl = json['seo_url'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    displayName = json['display_name'];
    privacy = json['privacy'];
    token = json['token'];
    timeZone = json['time_zone'];
    phoneNumber = json['phone_number'];
    isWhatappEnabled = json['is_whatapp_enabled'];
    ageGroupId = json['age_group_id'];
    gender = json['gender'];
    paymentMethodId = json['payment_method_id'];
    userBankAccountId = json['user_bank_account_id'];
    location = json['location'];
    lng = json['lng'];
    lat = json['lat'];
    image = json['image_url'];
    email = json['email'];
    isSuspended = json['is_suspended'];
    role = json['role'];

    channel =
        json['channel'] != null ? new Channel.fromJson(json['channel']) : null;
    roles = json['roles'].cast<String>();
    joined = json['joined'];
    if (json['my_interests'] != null) {
      myInterests = <MyInterests>[];
      json['my_interests'].forEach((v) {
        myInterests.add(new MyInterests.fromJson(v));
      });
    }

    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['description'] = this.description;
    data['date_of_birth'] = this.dateOfBirth;
    data['phone_ext_id'] = this.phoneExtId;
    data['country_id'] = this.countryId;
    data['region_id'] = this.regionId;
    data['city_id'] = this.cityId;
    data['zip_code'] = this.zipCode;
    data['seo_url'] = this.seoUrl;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['display_name'] = this.displayName;
    data['privacy'] = this.privacy;
    data['token'] = this.token;
    data['time_zone'] = this.timeZone;
    data['phone_number'] = this.phoneNumber;
    data['is_whatapp_enabled'] = this.isWhatappEnabled;
    data['age_group_id'] = this.ageGroupId;
    data['gender'] = this.gender;
    data['payment_method_id'] = this.paymentMethodId;
    data['user_bank_account_id'] = this.userBankAccountId;
    data['location'] = this.location;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    data['image'] = this.image;
    data['email'] = this.email;
    data['is_suspended'] = this.isSuspended;
    data['role'] = this.role;

    if (this.channel != null) {
      data['channel'] = this.channel.toJson();
    }
    data['roles'] = this.roles;
    data['joined'] = this.joined;
    if (this.myInterests != null) {
      data['my_interests'] = this.myInterests.map((v) => v.toJson()).toList();
    }

    data['dob'] = this.dob;
    return data;
  }
}

class Channel {
  int id;
  String name;
  dynamic description;
  String seoUrl;
  int verified;
  int isSuspended;
  dynamic countryId;
  int userId;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  int experienceEnabled;
  int channelActiveSubscribersCount;
  String channelImage;
  dynamic channelBackgroundImage;
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
    data['channel_active_subscribers_count'] =
        this.channelActiveSubscribersCount;
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

class Links {
  String first;
  String last;
  dynamic prev;
  dynamic next;

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
  List<Links> links;
  String path;
  int perPage;
  int to;
  int total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links.add(new Links.fromJson(v));
      });
    }
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
    if (this.links != null) {
      data['links'] = this.links.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Restaurant {
  String name;
  int restaurantId;
  String seoUrl;
  String phone;
  dynamic executiveChef;
  dynamic website;
  String address;
  String country;
  dynamic city;
  double lat;
  double lng;
  dynamic facebook;
  dynamic linkedIn;
  dynamic tiktok;
  dynamic instagram;
  dynamic twitter;
  dynamic officeEmail;
  int discount;
  Currency currency;
  bool isOnlineOrdersActive;
  bool isTakeAwayEnabled;
  bool isDineInEnabled;
  bool isDeliveryEnabled;
  int isCouponsEnabled;
  int freeKm;
  dynamic deliveryNote;
  String imageUrl;
  dynamic video;
  String joined;

  Restaurant(
      {this.name,
      this.restaurantId,
      this.seoUrl,
      this.phone,
      this.executiveChef,
      this.website,
      this.address,
      this.country,
      this.city,
      this.lat,
      this.lng,
      this.facebook,
      this.linkedIn,
      this.tiktok,
      this.instagram,
      this.twitter,
      this.officeEmail,
      this.discount,
      this.currency,
      this.isOnlineOrdersActive,
      this.isTakeAwayEnabled,
      this.isDineInEnabled,
      this.isDeliveryEnabled,
      this.isCouponsEnabled,
      this.freeKm,
      this.deliveryNote,
      this.imageUrl,
      this.video,
      this.joined});

  Restaurant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    restaurantId = json['restaurant_id'];
    seoUrl = json['seo_url'];
    phone = json['phone'];
    executiveChef = json['executive_chef'];
    website = json['website'];
    address = json['address'];
    country = json['country'];
    city = json['city'];
    lat = json['lat'];
    lng = json['lng'];
    facebook = json['facebook'];
    linkedIn = json['linked_in'];
    tiktok = json['tiktok'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    officeEmail = json['office_email'];
    discount = json['discount'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    isOnlineOrdersActive = json['is_online_orders_active'];
    isTakeAwayEnabled = json['is_take_away_enabled'];
    isDineInEnabled = json['is_dine_in_enabled'];
    isDeliveryEnabled = json['is_delivery_enabled'];
    isCouponsEnabled = json['is_coupons_enabled'];
    freeKm = json['free_km'];
    deliveryNote = json['delivery_note'];
    imageUrl = json['image_url'];
    video = json['video'];
    joined = json['joined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['restaurant_id'] = this.restaurantId;
    data['seo_url'] = this.seoUrl;
    data['phone'] = this.phone;
    data['executive_chef'] = this.executiveChef;
    data['website'] = this.website;
    data['address'] = this.address;
    data['country'] = this.country;
    data['city'] = this.city;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['facebook'] = this.facebook;
    data['linked_in'] = this.linkedIn;
    data['tiktok'] = this.tiktok;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['office_email'] = this.officeEmail;
    data['discount'] = this.discount;
    if (this.currency != null) {
      data['currency'] = this.currency.toJson();
    }
    data['is_online_orders_active'] = this.isOnlineOrdersActive;
    data['is_take_away_enabled'] = this.isTakeAwayEnabled;
    data['is_dine_in_enabled'] = this.isDineInEnabled;
    data['is_delivery_enabled'] = this.isDeliveryEnabled;
    data['is_coupons_enabled'] = this.isCouponsEnabled;
    data['free_km'] = this.freeKm;
    data['delivery_note'] = this.deliveryNote;
    data['image_url'] = this.imageUrl;
    data['video'] = this.video;
    data['joined'] = this.joined;
    return data;
  }
}

class Currency {
  String name;
  int currencyId;
  String symbol;
  int isActive;
  String format;
  String exchangeRate;

  Currency(
      {this.name,
      this.currencyId,
      this.symbol,
      this.isActive,
      this.format,
      this.exchangeRate});

  Currency.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    currencyId = json['currency_id'];
    symbol = json['symbol'];
    isActive = json['is_active'];
    format = json['format'];
    exchangeRate = json['exchange_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['currency_id'] = this.currencyId;
    data['symbol'] = this.symbol;
    data['is_active'] = this.isActive;
    data['format'] = this.format;
    data['exchange_rate'] = this.exchangeRate;
    return data;
  }
}
