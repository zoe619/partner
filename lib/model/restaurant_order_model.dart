import 'operating_hours_model.dart';

class RestaurantOrderModel {
  List<Data> data;
  String message;

  RestaurantOrderModel({this.data, this.message});

  RestaurantOrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  dynamic id;
  String bookingableType;
  dynamic bookingableId;
  dynamic quantity;
  dynamic total;
  String redemptionCode;
  dynamic userId;
  dynamic supplierId;
  dynamic bookingStatusId;
  dynamic paymentId;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;
  dynamic restaurantId;
  String bookingRef;
  String sessionId;
  dynamic isVoiceOrder;
  dynamic audioId;
  dynamic currencyId;
  dynamic courierFee;
  dynamic courierRestaurantPay;
  dynamic courierCustomerPay;
  dynamic distance;
  dynamic baseCharge;
  dynamic baseDistance;
  dynamic baseExtraDistance;
  dynamic baseExtraCharge;
  dynamic cartId;
  dynamic stripeSession;
  dynamic paymentPreApproved;
  String orderState;
  dynamic isOfflineOrder;
  dynamic discount;
  dynamic takeAwayDiscount;
  dynamic estimatedDuration;
  dynamic isDelivered;
  String orderDate;
  String humanTime;
  OrderDetail orderDetail;
  dynamic deliveryState;
  Bookingable bookingable;
  User user;
  List<Items> items;

  Data(
      {this.id,
      this.bookingableType,
      this.bookingableId,
      this.quantity,
      this.total,
      this.redemptionCode,
      this.userId,
      this.supplierId,
      this.bookingStatusId,
      this.paymentId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.restaurantId,
      this.bookingRef,
      this.sessionId,
      this.isVoiceOrder,
      this.audioId,
      this.currencyId,
      this.courierFee,
      this.courierRestaurantPay,
      this.courierCustomerPay,
      this.distance,
      this.baseCharge,
      this.baseDistance,
      this.baseExtraDistance,
      this.baseExtraCharge,
      this.cartId,
      this.stripeSession,
      this.paymentPreApproved,
      this.orderState,
      this.isOfflineOrder,
      this.discount,
      this.takeAwayDiscount,
      this.estimatedDuration,
      this.isDelivered,
      this.orderDate,
      this.humanTime,
      this.orderDetail,
      this.deliveryState,
      this.bookingable,
      this.user,
      this.items});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingableType = json['bookingable_type'];
    bookingableId = json['bookingable_id'];
    quantity = json['quantity'];
    total = json['total'];
    redemptionCode = json['redemption_code'];
    userId = json['user_id'];
    supplierId = json['supplier_id'];
    bookingStatusId = json['booking_status_id'];
    paymentId = json['payment_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    restaurantId = json['restaurant_id'];
    bookingRef = json['booking_ref'];
    sessionId = json['session_id'];
    isVoiceOrder = json['is_voice_order'];
    audioId = json['audio_id'];
    currencyId = json['currency_id'];
    courierFee = json['courier_fee'];
    courierRestaurantPay = json['courier_restaurant_pay'];
    courierCustomerPay = json['courier_customer_pay'];
    distance = json['distance'];
    baseCharge = json['base_charge'];
    baseDistance = json['base_distance'];
    baseExtraDistance = json['base_extra_distance'];
    baseExtraCharge = json['base_extra_charge'];
    cartId = json['cart_id'];
    stripeSession = json['stripe_session'];
    paymentPreApproved = json['payment_pre_approved'];
    orderState = json['order_state'];
    isOfflineOrder = json['is_offline_order'];
    discount = json['discount'];
    takeAwayDiscount = json['take_away_discount'];
    estimatedDuration = json['estimated_duration'];
    isDelivered = json['is_delivered'];
    orderDate = json['order_date'];
    humanTime = json['human_time'];
    orderDetail =
        json['order_detail'] != null ? new OrderDetail.fromJson(json['order_detail']) : null;
    deliveryState = json['delivery_state'];
    bookingable =
        json['bookingable'] != null ? new Bookingable.fromJson(json['bookingable']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookingable_type'] = this.bookingableType;
    data['bookingable_id'] = this.bookingableId;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['redemption_code'] = this.redemptionCode;
    data['user_id'] = this.userId;
    data['supplier_id'] = this.supplierId;
    data['booking_status_id'] = this.bookingStatusId;
    data['payment_id'] = this.paymentId;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['restaurant_id'] = this.restaurantId;
    data['booking_ref'] = this.bookingRef;
    data['session_id'] = this.sessionId;
    data['is_voice_order'] = this.isVoiceOrder;
    data['audio_id'] = this.audioId;
    data['currency_id'] = this.currencyId;
    data['courier_fee'] = this.courierFee;
    data['courier_restaurant_pay'] = this.courierRestaurantPay;
    data['courier_customer_pay'] = this.courierCustomerPay;
    data['distance'] = this.distance;
    data['base_charge'] = this.baseCharge;
    data['base_distance'] = this.baseDistance;
    data['base_extra_distance'] = this.baseExtraDistance;
    data['base_extra_charge'] = this.baseExtraCharge;
    data['cart_id'] = this.cartId;
    data['stripe_session'] = this.stripeSession;
    data['payment_pre_approved'] = this.paymentPreApproved;
    data['order_state'] = this.orderState;
    data['is_offline_order'] = this.isOfflineOrder;
    data['discount'] = this.discount;
    data['take_away_discount'] = this.takeAwayDiscount;
    data['estimated_duration'] = this.estimatedDuration;
    data['is_delivered'] = this.isDelivered;
    data['order_date'] = this.orderDate;
    data['human_time'] = this.humanTime;
    if (this.orderDetail != null) {
      data['order_detail'] = this.orderDetail.toJson();
    }
    data['delivery_state'] = this.deliveryState;
    if (this.bookingable != null) {
      data['bookingable'] = this.bookingable.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetail {
  String deliveryMethod;
  String comment;
  String address;
  String phoneNumber;
  dynamic lat;
  dynamic lng;
  String buildingNumber;
  String commentToCourier;
  dynamic collectPayment;
  String customerName;

  OrderDetail(
      {this.deliveryMethod,
      this.comment,
      this.address,
      this.phoneNumber,
      this.lat,
      this.lng,
      this.buildingNumber,
      this.commentToCourier,
      this.collectPayment,
      this.customerName});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    deliveryMethod = json['delivery-method'];
    comment = json['comment'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    lat = json['lat'];
    lng = json['lng'];
    buildingNumber = json['building_number'];
    commentToCourier = json['comment_to_courier'];
    collectPayment = json['collect_payment'];
    customerName = json['customer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery-method'] = this.deliveryMethod;
    data['comment'] = this.comment;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['building_number'] = this.buildingNumber;
    data['comment_to_courier'] = this.commentToCourier;
    data['collect_payment'] = this.collectPayment;
    data['customer_name'] = this.customerName;
    return data;
  }
}

class Bookingable {
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
  dynamic lng;
  dynamic lat;
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

  Bookingable(
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

  Bookingable.fromJson(Map<String, dynamic> json) {
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

class User {
  dynamic id;
  String email;
  dynamic emailVerifiedAt;
  dynamic isSuspended;
  dynamic deletedAt;
  String timezone;
  String createdAt;
  String updatedAt;
  dynamic stripeId;
  dynamic cardBrand;
  dynamic cardLastFour;
  dynamic trialEndsAt;
  String lastSeen;
  dynamic online;
  dynamic token;
  String customerId;
  Role role;
  String dateCreated;
  UserDetail userDetail;

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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
    userDetail = json['user_detail'] != null ? new UserDetail.fromJson(json['user_detail']) : null;
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
  dynamic id;
  String name;
  String guardName;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  Role({this.id, this.name, this.guardName, this.createdAt, this.updatedAt, this.pivot});

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
  dynamic modelId;
  dynamic roleId;
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
  dynamic id;
  String firstName;
  String lastName;
  String phone;
  dynamic address;
  dynamic description;
  dynamic dateOfBirth;
  dynamic phoneExtId;
  dynamic countryId;
  dynamic regionId;
  dynamic cityId;
  dynamic zipCode;
  String seoUrl;
  dynamic userId;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  String displayName;
  String privacy;
  String token;
  dynamic timeZone;
  String phoneNumber;
  dynamic isWhatappEnabled;
  dynamic ageGroupId;
  String gender;
  dynamic paymentMethodId;
  dynamic userBankAccountId;
  dynamic location;
  dynamic lng;
  dynamic lat;
  String image;
  String email;
  dynamic isSuspended;
  String role;
  List<SocialAccounts> socialAccounts;
  Channel channel;
  List<String> roles;
  String joined;
  List<MyInterests> myInterests;
  List<MyLanguages> myLanguages;
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
      this.socialAccounts,
      this.channel,
      this.roles,
      this.joined,
      this.myInterests,
      this.myLanguages,
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
    image = json['image'];
    email = json['email'];
    isSuspended = json['is_suspended'];
    role = json['role'];
    if (json['social_accounts'] != null) {
      socialAccounts = <SocialAccounts>[];
      json['social_accounts'].forEach((v) {
        socialAccounts.add(new SocialAccounts.fromJson(v));
      });
    }
    channel = json['channel'] != null ? new Channel.fromJson(json['channel']) : null;
    roles = json['roles'].cast<String>();
    joined = json['joined'];
    if (json['my_interests'] != null) {
      myInterests = <MyInterests>[];
      json['my_interests'].forEach((v) {
        myInterests.add(new MyInterests.fromJson(v));
      });
    }
    if (json['my_languages'] != null) {
      myLanguages = <MyLanguages>[];
      json['my_languages'].forEach((v) {
        myLanguages.add(new MyLanguages.fromJson(v));
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
    if (this.socialAccounts != null) {
      data['social_accounts'] = this.socialAccounts.map((v) => v.toJson()).toList();
    }
    if (this.channel != null) {
      data['channel'] = this.channel.toJson();
    }
    data['roles'] = this.roles;
    data['joined'] = this.joined;
    if (this.myInterests != null) {
      data['my_interests'] = this.myInterests.map((v) => v.toJson()).toList();
    }
    if (this.myLanguages != null) {
      data['my_languages'] = this.myLanguages.map((v) => v.toJson()).toList();
    }
    data['dob'] = this.dob;
    return data;
  }
}

class SocialAccounts {
  dynamic id;
  String value;
  dynamic userId;
  dynamic socialAccountId;
  String createdAt;
  String updatedAt;
  String accountName;

  SocialAccounts(
      {this.id,
      this.value,
      this.userId,
      this.socialAccountId,
      this.createdAt,
      this.updatedAt,
      this.accountName});

  SocialAccounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    userId = json['user_id'];
    socialAccountId = json['social_account_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accountName = json['account_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['user_id'] = this.userId;
    data['social_account_id'] = this.socialAccountId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['account_name'] = this.accountName;
    return data;
  }
}

class Channel {
  dynamic id;
  String name;
  dynamic description;
  String seoUrl;
  dynamic verified;
  dynamic isSuspended;
  dynamic countryId;
  dynamic userId;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  dynamic experienceEnabled;
  dynamic channelActiveSubscribersCount;
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
    data['channel_active_subscribers_count'] = this.channelActiveSubscribersCount;
    data['channel_image'] = this.channelImage;
    data['channel_background_image'] = this.channelBackgroundImage;
    data['is_user_subscribed'] = this.isUserSubscribed;
    data['notify_me'] = this.notifyMe;
    return data;
  }
}

class MyInterests {
  dynamic id;
  dynamic interestId;
  String interestableType;
  dynamic interestableId;
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

class MyLanguages {
  dynamic id;
  dynamic languageId;
  String userLanguageableType;
  dynamic userLanguageableId;
  String createdAt;
  String updatedAt;
  String text;

  MyLanguages(
      {this.id,
      this.languageId,
      this.userLanguageableType,
      this.userLanguageableId,
      this.createdAt,
      this.updatedAt,
      this.text});

  MyLanguages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageId = json['language_id'];
    userLanguageableType = json['user_languageable_type'];
    userLanguageableId = json['user_languageable_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['language_id'] = this.languageId;
    data['user_languageable_type'] = this.userLanguageableType;
    data['user_languageable_id'] = this.userLanguageableId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['text'] = this.text;
    return data;
  }
}

class Items {
  dynamic id;
  dynamic bookingId;
  dynamic quantity;
  String bookingItemableType;
  dynamic bookingItemableId;
  String total;
  String createdAt;
  String updatedAt;
  dynamic discount;
  BookingItemable bookingItemable;

  Items(
      {this.id,
      this.bookingId,
      this.quantity,
      this.bookingItemableType,
      this.bookingItemableId,
      this.total,
      this.createdAt,
      this.updatedAt,
      this.discount,
      this.bookingItemable});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    quantity = json['quantity'];
    bookingItemableType = json['booking_itemable_type'];
    bookingItemableId = json['booking_itemable_id'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    discount = json['discount'];
    bookingItemable = json['booking_itemable'] != null
        ? new BookingItemable.fromJson(json['booking_itemable'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['quantity'] = this.quantity;
    data['booking_itemable_type'] = this.bookingItemableType;
    data['booking_itemable_id'] = this.bookingItemableId;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['discount'] = this.discount;
    if (this.bookingItemable != null) {
      data['booking_itemable'] = this.bookingItemable.toJson();
    }
    return data;
  }
}

class BookingItemable {
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
  Bookingable restaurant;

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
      this.subMenuId,
      this.humanTime,
      this.activeRestaurant,
      this.suspendedRestaurant,
      this.address,
      this.city,
      this.restaurantName,
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
    subMenuId = json['sub_menu_id'];
    humanTime = json['human_time'];
    activeRestaurant = json['active_restaurant'];
    suspendedRestaurant = json['suspended_restaurant'];
    address = json['address'];
    city = json['city'];
    restaurantName = json['restaurant_name'];
    restaurant = json['restaurant'] != null ? new Bookingable.fromJson(json['restaurant']) : null;
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
