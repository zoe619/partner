import 'package:order_tracker/models/booking_item.dart';

class OrderModel {
  List<Data> data;
  Links links;
  Meta meta;
  String message;
  int commision;

  OrderModel({this.data, this.links, this.meta, this.message, this.commision});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    commision = json['commision'];
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
    data['commision'] = this.commision;
    return data;
  }
}

class Data {
  int id;
  int quantity;
  int total;
  String data;
  String redemptionCode;
  int userId;
  dynamic supplierId;
  int bookingStatusId;
  int paymentId;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;
  dynamic restaurantId;
  String bookingRef;
  String sessionId;
  int isVoiceOrder;
  int audioId;
  String orderDate;
  String humanTime;
  User user;
  List<Items> items;
  Audio audio;
  OrderDetail orderDetail;

  Data(
      {this.id,
      this.quantity,
      this.total,
      this.data,
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
      this.orderDate,
      this.humanTime,
      this.user,
      this.items,
      this.audio,
      this.orderDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    total = json['total'];
    data = json['data'];
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
    orderDate = json['order_date'];
    humanTime = json['human_time'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    audio = json['audio'] != null ? new Audio.fromJson(json['audio']) : null;
    orderDetail = json['order_detail'] != null
        ? new OrderDetail.fromJson(json['order_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['data'] = this.data;
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
    data['order_date'] = this.orderDate;
    data['human_time'] = this.humanTime;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    if (this.audio != null) {
      data['audio'] = this.audio.toJson();
    }
    if (this.orderDetail != null) {
      data['order_detail'] = this.orderDetail.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String email;
  dynamic emailVerifiedAt;
  int isSuspended;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;
  dynamic stripeId;
  dynamic cardBrand;
  dynamic cardLastFour;
  dynamic trialEndsAt;
  String lastSeen;
  int online;
  dynamic token;
  Role role;
  String dateCreated;
  UserDetail userDetail;

  User(
      {this.id,
      this.email,
      this.emailVerifiedAt,
      this.isSuspended,
      this.deletedAt,
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

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isSuspended = json['is_suspended'];
    deletedAt = json['deleted_at'];
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

class Items {
  int id;
  int bookingId;
  int quantity;
  String bookingItemableType;
  int bookingItemableId;
  int total;
  String createdAt;
  String updatedAt;
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
    if (this.bookingItemable != null) {
      data['booking_itemable'] = this.bookingItemable.toJson();
    }
    return data;
  }
}

class Audio {
  int id;
  String name;
  dynamic description;
  String seoUrl;
  String fileName;
  dynamic channelId;
  String status;
  String ext;
  int size;
  String duration;
  dynamic height;
  dynamic width;
  dynamic metaDescription;
  String path;
  String url;
  int storageTypeId;
  int isSuspended;
  int isApproved;
  int scheduled;
  dynamic scheduledDate;
  dynamic scheduledTime;
  dynamic scheduledTimeZone;
  dynamic countryId;
  dynamic languageId;
  dynamic regionId;
  int userId;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  int isUploaded;
  dynamic bitrate;
  dynamic token;
  dynamic processedName;
  int isProcessed;
  int isProcessing;
  int isDraft;
  String type;
  dynamic videoableType;
  dynamic videoableId;
  int sentNotification;
  int isVoiceOrder;
  dynamic thumbnailUrl;
  dynamic channel;
  dynamic country;
  dynamic tags;
  String dateCreated;
  // List<Null> topCategories;
  dynamic posterUrl;
  dynamic liked;
  String humanTime;
  int sumHistories;
  dynamic hoverUrl;

  Audio(
      {this.id,
      this.name,
      this.description,
      this.seoUrl,
      this.fileName,
      this.channelId,
      this.status,
      this.ext,
      this.size,
      this.duration,
      this.height,
      this.width,
      this.metaDescription,
      this.path,
      this.url,
      this.storageTypeId,
      this.isSuspended,
      this.isApproved,
      this.scheduled,
      this.scheduledDate,
      this.scheduledTime,
      this.scheduledTimeZone,
      this.countryId,
      this.languageId,
      this.regionId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.isUploaded,
      this.bitrate,
      this.token,
      this.processedName,
      this.isProcessed,
      this.isProcessing,
      this.isDraft,
      this.type,
      this.videoableType,
      this.videoableId,
      this.sentNotification,
      this.isVoiceOrder,
      this.thumbnailUrl,
      this.channel,
      this.country,
      this.tags,
      this.dateCreated,
      // this.topCategories,
      this.posterUrl,
      this.liked,
      this.humanTime,
      this.sumHistories,
      this.hoverUrl});

  Audio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    seoUrl = json['seo_url'];
    fileName = json['file_name'];
    channelId = json['channel_id'];
    status = json['status'];
    ext = json['ext'];
    size = json['size'];
    duration = json['duration'];
    height = json['height'];
    width = json['width'];
    metaDescription = json['meta_description'];
    path = json['path'];
    url = json['url'];
    storageTypeId = json['storage_type_id'];
    isSuspended = json['is_suspended'];
    isApproved = json['is_approved'];
    scheduled = json['scheduled'];
    scheduledDate = json['scheduled_date'];
    scheduledTime = json['scheduled_time'];
    scheduledTimeZone = json['scheduled_time_zone'];
    countryId = json['country_id'];
    languageId = json['language_id'];
    regionId = json['region_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isUploaded = json['is_uploaded'];
    bitrate = json['bitrate'];
    token = json['token'];
    processedName = json['processed_name'];
    isProcessed = json['is_processed'];
    isProcessing = json['is_processing'];
    isDraft = json['is_draft'];
    type = json['type'];
    videoableType = json['videoable_type'];
    videoableId = json['videoable_id'];
    sentNotification = json['sent_notification'];
    isVoiceOrder = json['is_voice_order'];
    thumbnailUrl = json['thumbnail_url'];
    channel = json['channel'];
    country = json['country'];
    tags = json['tags'];
    dateCreated = json['date_created'];
    // if (json['top_categories'] != null) {
    //   topCategories = new List<Null>();
    //   json['top_categories'].forEach((v) {
    //     topCategories.add(new Null.fromJson(v));
    //   });
    // }
    posterUrl = json['poster_url'];
    liked = json['liked'];
    humanTime = json['human_time'];
    sumHistories = json['sum_histories'];
    hoverUrl = json['hover_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['seo_url'] = this.seoUrl;
    data['file_name'] = this.fileName;
    data['channel_id'] = this.channelId;
    data['status'] = this.status;
    data['ext'] = this.ext;
    data['size'] = this.size;
    data['duration'] = this.duration;
    data['height'] = this.height;
    data['width'] = this.width;
    data['meta_description'] = this.metaDescription;
    data['path'] = this.path;
    data['url'] = this.url;
    data['storage_type_id'] = this.storageTypeId;
    data['is_suspended'] = this.isSuspended;
    data['is_approved'] = this.isApproved;
    data['scheduled'] = this.scheduled;
    data['scheduled_date'] = this.scheduledDate;
    data['scheduled_time'] = this.scheduledTime;
    data['scheduled_time_zone'] = this.scheduledTimeZone;
    data['country_id'] = this.countryId;
    data['language_id'] = this.languageId;
    data['region_id'] = this.regionId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['is_uploaded'] = this.isUploaded;
    data['bitrate'] = this.bitrate;
    data['token'] = this.token;
    data['processed_name'] = this.processedName;
    data['is_processed'] = this.isProcessed;
    data['is_processing'] = this.isProcessing;
    data['is_draft'] = this.isDraft;
    data['type'] = this.type;
    data['videoable_type'] = this.videoableType;
    data['videoable_id'] = this.videoableId;
    data['sent_notification'] = this.sentNotification;
    data['is_voice_order'] = this.isVoiceOrder;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['channel'] = this.channel;
    data['country'] = this.country;
    data['tags'] = this.tags;
    data['date_created'] = this.dateCreated;
    // if (this.topCategories != null) {
    //   data['top_categories'] =
    //       this.topCategories.map((v) => v.toJson()).toList();
    // }
    data['poster_url'] = this.posterUrl;
    data['liked'] = this.liked;
    data['human_time'] = this.humanTime;
    data['sum_histories'] = this.sumHistories;
    data['hover_url'] = this.hoverUrl;
    return data;
  }
}

class OrderDetail {
  String deliveryMethod;
  dynamic comment;
  String address;
  String phoneNumber;

  OrderDetail(
      {this.deliveryMethod, this.comment, this.address, this.phoneNumber});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    deliveryMethod = json['delivery-method'];
    comment = json['comment'];
    address = json['address'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery-method'] = this.deliveryMethod;
    data['comment'] = this.comment;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
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
