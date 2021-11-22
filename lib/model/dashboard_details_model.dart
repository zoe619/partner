class DashboardDetailsModel {
  Data data;
  String message;
  List<Chart> chart;
  var lastWeekSales;
  var currentWeekSales;
  List<Sales> sales;
  var reviewCount;
  var newCustomers;
  var oldCustomers;
  List<Reviews> reviews;

  DashboardDetailsModel(
      {this.data,
      this.message,
      this.chart,
      this.lastWeekSales,
      this.currentWeekSales,
      this.sales,
      this.reviewCount,
      this.newCustomers,
      this.oldCustomers,
      this.reviews});

  DashboardDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['chart'] != null) {
      chart = <Chart>[];
      json['chart'].forEach((v) {
        chart.add(new Chart.fromJson(v));
      });
    }
    lastWeekSales = json['last_week_sales'];
    currentWeekSales = json['current_week_sales'];
    if (json['sales'] != null) {
      sales = <Sales>[];
      json['sales'].forEach((v) {
        sales.add(new Sales.fromJson(v));
      });
    }
    reviewCount = json['review_count'];
    newCustomers = json['new_customers'];
    oldCustomers = json['old_customers'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    if (this.chart != null) {
      data['chart'] = this.chart.map((v) => v.toJson()).toList();
    }
    data['last_week_sales'] = this.lastWeekSales;
    data['current_week_sales'] = this.currentWeekSales;
    if (this.sales != null) {
      data['sales'] = this.sales.map((v) => v.toJson()).toList();
    }
    data['review_count'] = this.reviewCount;
    data['new_customers'] = this.newCustomers;
    data['old_customers'] = this.oldCustomers;
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  var id;
  String name;
  String phone;
  String seoUrl;
  String token;
  var executiveChef;
  var restaurantApplicationId;
  var userId;
  var vatPercent;
  var countryId;
  var region;
  var city;
  String status;
  var dressCode;
  var cuisine;
  var policy;
  var additionalInfo;
  String createdAt;
  String updatedAt;
  String address;
  var videoId;
  var takeAwayEnabled;
  var dineInEnabled;
  var deliveryEnabled;
  var currencyId;
  String whatsAppNumber;
  var lng;
  var lat;
  var deliveryNote;
  var website;
  var isApproved;
  var isSuspended;
  var facebook;
  var linkedIn;
  var tiktok;
  var instagram;
  var twitter;
  var pinterest;
  var officeEmail;
  var timezoneId;
  var externalMenu;
  var discount;
  var cityId;
  String imageUrl;
  String humanTime;
  Operating operating;
  List<OperatingHours> operatingHours;

  Data(
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
      this.imageUrl,
      this.humanTime,
      this.operating,
      this.operatingHours});

  Data.fromJson(Map<String, dynamic> json) {
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

class OperatingHours {
  var id;
  String timeFrom;
  String timeTo;
  var day;
  var isActive;
  String createdAt;
  String updatedAt;
  String dayName;

  OperatingHours(
      {this.id,
      this.timeFrom,
      this.timeTo,
      this.day,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.dayName});

  OperatingHours.fromJson(Map<String, dynamic> json) {
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

class AllDays {
  var id;
  String timeFrom;
  String timeTo;
  var day;
  var isActive;
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

class Chart {
  String day;
  var total;

  Chart({this.day, this.total});

  Chart.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['total'] = this.total;
    return data;
  }
}

class Sales {
  var id;
  String name;
  var salesQty;

  Sales({this.id, this.name, this.salesQty});

  Sales.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    salesQty = json['sales_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sales_qty'] = this.salesQty;
    return data;
  }
}

class Reviews {
  var id;
  var rate;
  String staus;
  var videoId;
  var businessListingId;
  var languageId;
  var isSuspended;
  var reviewId;
  String reviewableType;
  var reviewableId;
  String createdAt;
  String updatedAt;
  String seoUrl;
  var userId;
  String languageSeoUrl;
  User user;

  Reviews(
      {this.id,
      this.rate,
      this.staus,
      this.videoId,
      this.businessListingId,
      this.languageId,
      this.isSuspended,
      this.reviewId,
      this.reviewableType,
      this.reviewableId,
      this.createdAt,
      this.updatedAt,
      this.seoUrl,
      this.userId,
      this.languageSeoUrl,
      this.user});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    staus = json['staus'];
    videoId = json['video_id'];
    businessListingId = json['business_listing_id'];
    languageId = json['language_id'];
    isSuspended = json['is_suspended'];
    reviewId = json['review_id'];
    reviewableType = json['reviewable_type'];
    reviewableId = json['reviewable_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    seoUrl = json['seo_url'];
    userId = json['user_id'];
    languageSeoUrl = json['language_seo_url'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rate'] = this.rate;
    data['staus'] = this.staus;
    data['video_id'] = this.videoId;
    data['business_listing_id'] = this.businessListingId;
    data['language_id'] = this.languageId;
    data['is_suspended'] = this.isSuspended;
    data['review_id'] = this.reviewId;
    data['reviewable_type'] = this.reviewableType;
    data['reviewable_id'] = this.reviewableId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['seo_url'] = this.seoUrl;
    data['user_id'] = this.userId;
    data['language_seo_url'] = this.languageSeoUrl;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  var id;
  String email;
  var emailVerifiedAt;
  var isSuspended;
  var deletedAt;
  var timezone;
  String createdAt;
  String updatedAt;
  var stripeId;
  var cardBrand;
  var cardLastFour;
  var trialEndsAt;
  var lastSeen;
  var online;
  var token;
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
  var id;
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
  var modelId;
  var roleId;
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
  var id;
  String firstName;
  String lastName;
  var phone;
  var address;
  var description;
  var dateOfBirth;
  var phoneExtId;
  var countryId;
  var regionId;
  var cityId;
  var zipCode;
  String seoUrl;
  var userId;
  String createdAt;
  String updatedAt;
  var deletedAt;
  var displayName;
  String privacy;
  String token;
  var timeZone;
  var phoneNumber;
  var isWhatappEnabled;
  var ageGroupId;
  String gender;
  var paymentMethodId;
  var userBankAccountId;
  var location;
  var lng;
  var lat;
  var image;
  String email;
  var isSuspended;
  String role;
  // List<Null> socialAccounts;
  Channel channel;
  Roles roles;
  String joined;
  // List<Null> myInterests;
  // List<Null> myLanguages;
  var dob;

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
      // this.socialAccounts,
      this.channel,
      this.roles,
      this.joined,
      // this.myInterests,
      // this.myLanguages,
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
    // if (json['social_accounts'] != null) {
    //   socialAccounts = new List<Null>();
    //   json['social_accounts'].forEach((v) {
    //     socialAccounts.add(new Null.fromJson(v));
    //   });
    // }
    channel = json['channel'] != null ? new Channel.fromJson(json['channel']) : null;
    roles = json['roles'] != null ? new Roles.fromJson(json['roles']) : null;
    joined = json['joined'];
    // if (json['my_interests'] != null) {
    //   myInterests = new List<Null>();
    //   json['my_interests'].forEach((v) {
    //     myInterests.add(new Null.fromJson(v));
    //   });
    // // }
    // if (json['my_languages'] != null) {
    //   myLanguages = new List<Null>();
    //   json['my_languages'].forEach((v) {
    //     myLanguages.add(new Null.fromJson(v));
    //   });
    // }
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
    // if (this.socialAccounts != null) {
    //   data['social_accounts'] =
    //       this.socialAccounts.map((v) => v.toJson()).toList();
    // }
    if (this.channel != null) {
      data['channel'] = this.channel.toJson();
    }
    if (this.roles != null) {
      data['roles'] = this.roles.toJson();
    }
    // data['joined'] = this.joined;
    // if (this.myInterests != null) {
    //   data['my_interests'] = this.myInterests.map((v) => v.toJson()).toList();
    // }
    // if (this.myLanguages != null) {
    //   data['my_languages'] = this.myLanguages.map((v) => v.toJson()).toList();
    // }
    data['dob'] = this.dob;
    return data;
  }
}

class Channel {
  var id;
  String name;
  var description;
  String seoUrl;
  var verified;
  var isSuspended;
  var countryId;
  var userId;
  String createdAt;
  String updatedAt;
  var deletedAt;
  var experienceEnabled;
  var channelActiveSubscribersCount;
  var channelImage;
  var channelBackgroundImage;
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

class Roles {
  String s2;

  Roles({this.s2});

  Roles.fromJson(Map<String, dynamic> json) {
    s2 = json['2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['2'] = this.s2;
    return data;
  }
}
