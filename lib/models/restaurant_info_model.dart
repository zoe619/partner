class RestaurantInfoModel {
  Data data;
  String message;

  RestaurantInfoModel({this.data, this.message});

  RestaurantInfoModel.fromJson(Map<String, dynamic> json) {
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

class Data {
  int id;
  String name;
  String phone;
  String seoUrl;
  String token;
  dynamic executiveChef;
  int restaurantApplicationId;
  int userId;
  dynamic vatPercent;
  int countryId;
  dynamic region;
  City city;
  String status;
  dynamic dressCode;
  dynamic cuisine;
  dynamic policy;
  dynamic additionalInfo;
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
  dynamic deliveryNote;
  dynamic website;
  int isApproved;
  int isSuspended;
  dynamic facebook;
  dynamic linkedIn;
  dynamic tiktok;
  dynamic instagram;
  dynamic twitter;
  dynamic pinterest;
  dynamic officeEmail;
  int timezoneId;
  dynamic externalMenu;
  int discount;
  int cityId;
  String imageUrl;
  String humanTime;
  Operating operating;
  Image image;
  Country country;
  Currency currency;
  Video video;
  ParkingOption parkingOption;
  Timezone timezone;
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
      this.image,
      this.country,
      this.currency,
      this.video,
      this.parkingOption,
      this.timezone,
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
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
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
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    country = json['country'] != null ? new Country.fromJson(json['country']) : null;
    currency = json['currency'] != null ? new Currency.fromJson(json['currency']) : null;
    video = json['video'] != null ? new Video.fromJson(json['video']) : null;
    parkingOption =
        json['parking_option'] != null ? new ParkingOption.fromJson(json['parking_option']) : null;
    timezone = json['timezone'] != null ? new Timezone.fromJson(json['timezone']) : null;
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
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
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
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country.toJson();
    }
    if (this.currency != null) {
      data['currency'] = this.currency.toJson();
    }
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    if (this.parkingOption != null) {
      data['parking_option'] = this.parkingOption.toJson();
    }
    if (this.timezone != null) {
      data['timezone'] = this.timezone.toJson();
    }
    if (this.operatingHours != null) {
      data['operating_hours'] = this.operatingHours.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int id;
  String country;
  String city;
  String cityAscii;
  String region;
  int population;
  String latitude;
  String longitude;
  String createdAt;
  String updatedAt;

  City(
      {this.id,
      this.country,
      this.city,
      this.cityAscii,
      this.region,
      this.population,
      this.latitude,
      this.longitude,
      this.createdAt,
      this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    city = json['city'];
    cityAscii = json['city_ascii'];
    region = json['region'];
    population = json['population'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country'] = this.country;
    data['city'] = this.city;
    data['city_ascii'] = this.cityAscii;
    data['region'] = this.region;
    data['population'] = this.population;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  int id;
  String timeFrom;
  String timeTo;
  int day;
  int isActive;
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

class Image {
  int id;
  String url;
  String path;
  String ext;
  int size;
  int height;
  int width;
  dynamic metaDescription;
  dynamic purpose;
  int storageTypeId;

  Image(
      {this.id,
      this.url,
      this.path,
      this.ext,
      this.size,
      this.height,
      this.width,
      this.metaDescription,
      this.purpose,
      this.storageTypeId});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    path = json['path'];
    ext = json['ext'];
    size = json['size'];
    height = json['height'];
    width = json['width'];
    metaDescription = json['meta_description'];
    purpose = json['purpose'];
    storageTypeId = json['storage_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['path'] = this.path;
    data['ext'] = this.ext;
    data['size'] = this.size;
    data['height'] = this.height;
    data['width'] = this.width;
    data['meta_description'] = this.metaDescription;
    data['purpose'] = this.purpose;
    data['storage_type_id'] = this.storageTypeId;
    return data;
  }
}

class Country {
  int id;
  String code;
  String seoUrl;
  dynamic description;
  int destinationEnabled;
  int top;
  String name;
  String dCode;
  int isActive;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;
  int experienceEnabled;
  String imageUrl;
  dynamic mapUrl;

  Country(
      {this.id,
      this.code,
      this.seoUrl,
      this.description,
      this.destinationEnabled,
      this.top,
      this.name,
      this.dCode,
      this.isActive,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.experienceEnabled,
      this.imageUrl,
      this.mapUrl});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    seoUrl = json['seo_url'];
    description = json['description'];
    destinationEnabled = json['destination_enabled'];
    top = json['top'];
    name = json['name'];
    dCode = json['d_code'];
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    experienceEnabled = json['experience_enabled'];
    imageUrl = json['image_url'];
    mapUrl = json['map_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['seo_url'] = this.seoUrl;
    data['description'] = this.description;
    data['destination_enabled'] = this.destinationEnabled;
    data['top'] = this.top;
    data['name'] = this.name;
    data['d_code'] = this.dCode;
    data['is_active'] = this.isActive;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['experience_enabled'] = this.experienceEnabled;
    data['image_url'] = this.imageUrl;
    data['map_url'] = this.mapUrl;
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

class Video {
  int id;
  String name;
  dynamic description;
  String seoUrl;
  String fileName;
  int channelId;
  String status;
  String ext;
  int size;
  String duration;
  int height;
  int width;
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
  String bitrate;
  dynamic token;
  String processedName;
  int isProcessed;
  int isProcessing;
  int isDraft;
  String type;
  dynamic videoableType;
  dynamic videoableId;
  int sentNotification;
  int isVoiceOrder;
  int isLivestream;
  dynamic cityId;
  String thumbnailUrl;
  Channel channel;
  dynamic country;
  dynamic tags;
  String dateCreated;
  List<dynamic> topCategories;
  String posterUrl;
  dynamic liked;
  String humanTime;
  double sumHistories;
  dynamic hoverUrl;

  Video(
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
      this.isLivestream,
      this.cityId,
      this.thumbnailUrl,
      this.channel,
      this.country,
      this.tags,
      this.dateCreated,
      this.topCategories,
      this.posterUrl,
      this.liked,
      this.humanTime,
      this.sumHistories,
      this.hoverUrl});

  Video.fromJson(Map<String, dynamic> json) {
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
    isLivestream = json['is_livestream'];
    cityId = json['city_id'];
    thumbnailUrl = json['thumbnail_url'];
    channel = json['channel'] != null ? new Channel.fromJson(json['channel']) : null;
    country = json['country'];
    tags = json['tags'];
    dateCreated = json['date_created'];
    // if (json['top_categories'] != null) {
    //   topCategories = new List<dynamic>();
    //   json['top_categories'].forEach((v) {
    //     topCategories.add(new dynamic.fromJson(v));
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
    data['is_livestream'] = this.isLivestream;
    data['city_id'] = this.cityId;
    data['thumbnail_url'] = this.thumbnailUrl;
    if (this.channel != null) {
      data['channel'] = this.channel.toJson();
    }
    data['country'] = this.country;
    data['tags'] = this.tags;
    data['date_created'] = this.dateCreated;
    if (this.topCategories != null) {
      data['top_categories'] = this.topCategories.map((v) => v.toJson()).toList();
    }
    data['poster_url'] = this.posterUrl;
    data['liked'] = this.liked;
    data['human_time'] = this.humanTime;
    data['sum_histories'] = this.sumHistories;
    data['hover_url'] = this.hoverUrl;
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
    data['channel_active_subscribers_count'] = this.channelActiveSubscribersCount;
    data['channel_image'] = this.channelImage;
    data['channel_background_image'] = this.channelBackgroundImage;
    data['is_user_subscribed'] = this.isUserSubscribed;
    data['notify_me'] = this.notifyMe;
    return data;
  }
}

class ParkingOption {
  int id;
  dynamic parkingOptionId;
  String parkingListableType;
  int parkingListableId;
  String createdAt;
  String updatedAt;
  dynamic option;

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
    option = json['option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parking_option_id'] = this.parkingOptionId;
    data['parking_listable_type'] = this.parkingListableType;
    data['parking_listable_id'] = this.parkingListableId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['option'] = this.option;
    return data;
  }
}

class Timezone {
  int id;
  String name;
  String offset;
  String diffFromGtm;
  String createdAt;
  String updatedAt;

  Timezone({this.id, this.name, this.offset, this.diffFromGtm, this.createdAt, this.updatedAt});

  Timezone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    offset = json['offset'];
    diffFromGtm = json['diff_from_gtm'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['offset'] = this.offset;
    data['diff_from_gtm'] = this.diffFromGtm;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class OperatingHours {
  int id;
  String timeFrom;
  String timeTo;
  int day;
  int isActive;
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
