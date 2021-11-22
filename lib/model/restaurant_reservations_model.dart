class RestaurantReservationsModel {
  List<Data> data;
  Links links;
  Meta meta;
  String message;

  RestaurantReservationsModel({this.data, this.links, this.meta, this.message});

  RestaurantReservationsModel.fromJson(Map<String, dynamic> json) {
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
  int restaurantId;
  int userId;
  String dateAndTime;
  int partySize;
  String status;
  String createdAt;
  String updatedAt;
  Customer customer;

  Data(
      {this.id,
      this.restaurantId,
      this.userId,
      this.dateAndTime,
      this.partySize,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.customer});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    userId = json['user_id'];
    dateAndTime = json['date_and_time'];
    partySize = json['party_size'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['user_id'] = this.userId;
    data['date_and_time'] = this.dateAndTime;
    data['party_size'] = this.partySize;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    return data;
  }
}

class Customer {
  int id;
  String email;
  Null emailVerifiedAt;
  int isSuspended;
  Null deletedAt;
  String timezone;
  String createdAt;
  String updatedAt;
  Null stripeId;
  Null cardBrand;
  Null cardLastFour;
  Null trialEndsAt;
  String lastSeen;
  int online;
  Null token;
  Role role;
  String dateCreated;
  UserDetail userDetail;

  Customer(
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
      this.role,
      this.dateCreated,
      this.userDetail});

  Customer.fromJson(Map<String, dynamic> json) {
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
  Null phone;
  Null address;
  Null description;
  Null dateOfBirth;
  Null phoneExtId;
  int countryId;
  Null regionId;
  Null cityId;
  Null zipCode;
  String seoUrl;
  int userId;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String displayName;
  String privacy;
  String token;
  Null timeZone;
  String phoneNumber;
  int isWhatappEnabled;
  int ageGroupId;
  Null gender;
  Null paymentMethodId;
  Null userBankAccountId;
  Null location;
  Null lng;
  Null lat;
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
  Null dob;

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
      this.myInterests,
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
    data['roles'] = this.roles;
    data['joined'] = this.joined;
    if (this.myInterests != null) {
      data['my_interests'] = this.myInterests.map((v) => v.toJson()).toList();
    }
    // if (this.myLanguages != null) {
    //   data['my_languages'] = this.myLanguages.map((v) => v.toJson()).toList();
    // }
    data['dob'] = this.dob;
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
  Null prev;
  Null next;

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
