import 'operating_hours_model.dart';

class SingleOfflineOrderItemModel {
  Data data;
  String message;

  SingleOfflineOrderItemModel({this.data, this.message});

  SingleOfflineOrderItemModel.fromJson(Map<String, dynamic> json) {
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
  String deliveryState;
  dynamic user;
  // List<dynamic> items;
  dynamic audio;
  dynamic processingTime;
  List<Histories> histories;
  PaymentCredit paymentCredit;
  Bookingable bookingable;
  Status status;
  Currency currency;
  CourierOrder courierOrder;

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
      this.user,
        this.processingTime,
      // this.items,
      this.audio,
      this.histories,
      this.paymentCredit,
      this.bookingable,
      this.status,
      this.currency,
      this.courierOrder});

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
    processingTime = json['processing_time'];
    takeAwayDiscount = json['take_away_discount'];
    estimatedDuration = json['estimated_duration'];
    isDelivered = json['is_delivered'];
    orderDate = json['order_date'];
    humanTime = json['human_time'];
    orderDetail =
        json['order_detail'] != null ? new OrderDetail.fromJson(json['order_detail']) : null;
    deliveryState = json['delivery_state'];
    user = json['user'];
    // if (json['items'] != null) {
    //   items = new List<dynamic>();
    //   json['items'].forEach((v) {
    //     items.add(new dynamic.fromJson(v));
    //   });
    // }
    audio = json['audio'];
    if (json['histories'] != null) {
      histories = <Histories>[];
      json['histories'].forEach((v) {
        histories.add(new Histories.fromJson(v));
      });
    }
    paymentCredit =
        json['payment_credit'] != null ? new PaymentCredit.fromJson(json['payment_credit']) : null;
    bookingable =
        json['bookingable'] != null ? new Bookingable.fromJson(json['bookingable']) : null;
    status = json['status'] != null ? new Status.fromJson(json['status']) : null;
    currency = json['currency'] != null ? new Currency.fromJson(json['currency']) : null;
    if (json['courier_order'] != null) {
      courierOrder =  CourierOrder.fromJson(json['courier_order']);

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
    data['user'] = this.user;
    // if (this.items != null) {
    //   data['items'] = this.items.map((v) => v.toJson()).toList();
    // }
    data['audio'] = this.audio;
    if (this.histories != null) {
      data['histories'] = this.histories.map((v) => v.toJson()).toList();
    }
    if (this.paymentCredit != null) {
      data['payment_credit'] = this.paymentCredit.toJson();
    }
    if (this.bookingable != null) {
      data['bookingable'] = this.bookingable.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    if (this.currency != null) {
      data['currency'] = this.currency.toJson();
    }
      data['courier_order'] = this.courierOrder.toJson();

    return data;
  }
}

class OrderDetail {
  String menu;
  String customerName;
  String address;
  dynamic customerId;
  String buildingNumber;
  dynamic lat;
  dynamic lng;
  String comment;
  dynamic collectPayment;
  dynamic commentToCourier;
  String phoneNumber;

  OrderDetail(
      {this.menu,
      this.customerName,
      this.address,
      this.customerId,
      this.buildingNumber,
      this.lat,
      this.lng,
      this.comment,
      this.collectPayment,
      this.commentToCourier,
      this.phoneNumber});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    menu = json['menu'];
    customerName = json['customer_name'];
    address = json['address'];
    customerId = json['customer_id'];
    buildingNumber = json['building_number'];
    lat = json['lat'];
    lng = json['lng'];
    comment = json['comment'];
    collectPayment = json['collect_payment'];
    commentToCourier = json['comment_to_courier'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu'] = this.menu;
    data['customer_name'] = this.customerName;
    data['address'] = this.address;
    data['customer_id'] = this.customerId;
    data['building_number'] = this.buildingNumber;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['comment'] = this.comment;
    data['collect_payment'] = this.collectPayment;
    data['comment_to_courier'] = this.commentToCourier;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}

class Histories {
  dynamic id;
  dynamic bookingStatusId;
  String bookingHistoryableType;
  dynamic bookingHistoryableId;
  String message;
  dynamic comment;
  String createdAt;
  String updatedAt;

  Histories(
      {this.id,
      this.bookingStatusId,
      this.bookingHistoryableType,
      this.bookingHistoryableId,
      this.message,
      this.comment,
      this.createdAt,
      this.updatedAt});

  Histories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingStatusId = json['booking_status_id'];
    bookingHistoryableType = json['booking_historyable_type'];
    bookingHistoryableId = json['booking_historyable_id'];
    message = json['message'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_status_id'] = this.bookingStatusId;
    data['booking_historyable_type'] = this.bookingHistoryableType;
    data['booking_historyable_id'] = this.bookingHistoryableId;
    data['message'] = this.message;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PaymentCredit {
  dynamic id;
  dynamic userId;
  dynamic amount;
  String paymentGatway;
  String paymentRef;
  dynamic grouped;
  String createdAt;
  String updatedAt;
  String confirmationCode;
  String paymentType;
  dynamic paymentId;
  String status;
  String sessionId;
  dynamic amountPaid;
  dynamic exchangeRate;
  dynamic currencyId;
  dynamic paymentableId;
  String paymentableType;

  PaymentCredit(
      {this.id,
      this.userId,
      this.amount,
      this.paymentGatway,
      this.paymentRef,
      this.grouped,
      this.createdAt,
      this.updatedAt,
      this.confirmationCode,
      this.paymentType,
      this.paymentId,
      this.status,
      this.sessionId,
      this.amountPaid,
      this.exchangeRate,
      this.currencyId,
      this.paymentableId,
      this.paymentableType});

  PaymentCredit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    paymentGatway = json['payment_gatway'];
    paymentRef = json['payment_ref'];
    grouped = json['grouped'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    confirmationCode = json['confirmation_code'];
    paymentType = json['payment_type'];
    paymentId = json['payment_id'];
    status = json['status'];
    sessionId = json['session_id'];
    amountPaid = json['amount_paid'];
    exchangeRate = json['exchange_rate'];
    currencyId = json['currency_id'];
    paymentableId = json['paymentable_id'];
    paymentableType = json['paymentable_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['amount'] = this.amount;
    data['payment_gatway'] = this.paymentGatway;
    data['payment_ref'] = this.paymentRef;
    data['grouped'] = this.grouped;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['confirmation_code'] = this.confirmationCode;
    data['payment_type'] = this.paymentType;
    data['payment_id'] = this.paymentId;
    data['status'] = this.status;
    data['session_id'] = this.sessionId;
    data['amount_paid'] = this.amountPaid;
    data['exchange_rate'] = this.exchangeRate;
    data['currency_id'] = this.currencyId;
    data['paymentable_id'] = this.paymentableId;
    data['paymentable_type'] = this.paymentableType;
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
  dynamic isOpen;
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

class Status {
  dynamic id;
  String name;
  String displayName;
  dynamic isAllowed;
  String createdAt;
  String updatedAt;

  Status({this.id, this.name, this.displayName, this.isAllowed, this.createdAt, this.updatedAt});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['display_name'];
    isAllowed = json['is_allowed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    data['is_allowed'] = this.isAllowed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Currency {
  dynamic id;
  String name;
  String code;
  String symbol;
  String format;
  String exchangeRate;
  dynamic active;
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

class CourierOrder {
  dynamic id;
  dynamic courierId;
  dynamic courierCustomerId;
  dynamic bookingStatusId;
  dynamic currencyId;
  dynamic countryId;
  dynamic courierTransportModeId;
  String orderRef;
  dynamic delivered;
  String itemDescription;
  String customerPhoneNumber;
  String customerAddress;
  String consumerPhoneNumber;
  String consumerAddress;
  String orderValue;
  dynamic finaleDistance;
  dynamic courierFee;
  dynamic distance;
  dynamic baseCharge;
  dynamic baseExtraCharge;
  String paymentMode;
  dynamic pickedUpTime;
  dynamic deliveredTime;
  String createdAt;
  String updatedAt;
  String courierOrderableType;
  dynamic courierOrderableId;
  String deliveryMode;
  String comment;
  dynamic collectPayment;
  String building;
  dynamic consumerPays;
  dynamic customerPays;
  dynamic cityId;
  dynamic courierConsumerId;
  String consumerName;
  dynamic isReady;
  dynamic customerLat;
  dynamic collectInvoiceAmount;
  dynamic customerLng;
  dynamic consumerLat;
  dynamic consumerLng;
  dynamic customerFinaleLat;
  dynamic customerFinaleLng;
  dynamic consumerFinaleLat;
  dynamic consumerFinaleLng;
  dynamic arrivalTime;
  dynamic commentToCourier;
  dynamic estimatedDuration;
  String humanTime;
  dynamic courier;

  CourierOrder(
      {this.id,
      this.courierId,
      this.courierCustomerId,
      this.bookingStatusId,
      this.currencyId,
      this.countryId,
      this.courierTransportModeId,
      this.orderRef,
      this.delivered,
      this.collectInvoiceAmount,
      this.itemDescription,
      this.customerPhoneNumber,
      this.customerAddress,
      this.consumerPhoneNumber,
      this.consumerAddress,
      this.orderValue,
      this.finaleDistance,
      this.courierFee,
      this.distance,
      this.baseCharge,
      this.baseExtraCharge,
      this.paymentMode,
      this.pickedUpTime,
      this.deliveredTime,
      this.createdAt,
      this.updatedAt,
      this.courierOrderableType,
      this.courierOrderableId,
      this.deliveryMode,
      this.comment,
      this.collectPayment,
      this.building,
      this.consumerPays,
      this.customerPays,
      this.cityId,
      this.courierConsumerId,
      this.consumerName,
      this.isReady,
      this.customerLat,
      this.customerLng,
      this.consumerLat,
      this.consumerLng,
      this.customerFinaleLat,
      this.customerFinaleLng,
      this.consumerFinaleLat,
      this.consumerFinaleLng,
      this.arrivalTime,
      this.commentToCourier,
      this.estimatedDuration,
      this.humanTime,
      this.courier});

  CourierOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectInvoiceAmount = json['collect_invoice_amount'];
    courierId = json['courier_id'];
    courierCustomerId = json['courier_customer_id'];
    bookingStatusId = json['booking_status_id'];
    currencyId = json['currency_id'];
    countryId = json['country_id'];
    courierTransportModeId = json['courier_transport_mode_id'];
    orderRef = json['order_ref'];
    delivered = json['delivered'];
    itemDescription = json['item_description'];
    customerPhoneNumber = json['customer_phone_number'];
    customerAddress = json['customer_address'];
    consumerPhoneNumber = json['consumer_phone_number'];
    consumerAddress = json['consumer_address'];
    orderValue = json['order_value'];
    finaleDistance = json['finale_distance'];
    courierFee = json['courier_fee'];
    distance = json['distance'];
    baseCharge = json['base_charge'];
    baseExtraCharge = json['base_extra_charge'];
    paymentMode = json['payment_mode'];
    pickedUpTime = json['picked_up_time'];
    deliveredTime = json['delivered_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    courierOrderableType = json['courier_orderable_type'];
    courierOrderableId = json['courier_orderable_id'];
    deliveryMode = json['delivery_mode'];
    comment = json['comment'];
    collectPayment = json['collect_payment'];
    building = json['building'];
    consumerPays = json['consumer_pays'];
    customerPays = json['customer_pays'];
    cityId = json['city_id'];
    courierConsumerId = json['courier_consumer_id'];
    consumerName = json['consumer_name'];
    isReady = json['is_ready'];
    customerLat = json['customer_lat'];
    customerLng = json['customer_lng'];
    consumerLat = json['consumer_lat'];
    consumerLng = json['consumer_lng'];
    customerFinaleLat = json['customer_finale_lat'];
    customerFinaleLng = json['customer_finale_lng'];
    consumerFinaleLat = json['consumer_finale_lat'];
    consumerFinaleLng = json['consumer_finale_lng'];
    arrivalTime = json['arrival_time'];
    commentToCourier = json['comment_to_courier'];
    estimatedDuration = json['estimated_duration'];
    humanTime = json['human_time'];
    courier = json['courier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['collect_invoice_amount'] = this.collectInvoiceAmount;
    data['courier_id'] = this.courierId;
    data['courier_customer_id'] = this.courierCustomerId;
    data['booking_status_id'] = this.bookingStatusId;
    data['currency_id'] = this.currencyId;
    data['country_id'] = this.countryId;
    data['courier_transport_mode_id'] = this.courierTransportModeId;
    data['order_ref'] = this.orderRef;
    data['delivered'] = this.delivered;
    data['item_description'] = this.itemDescription;
    data['customer_phone_number'] = this.customerPhoneNumber;
    data['customer_address'] = this.customerAddress;
    data['consumer_phone_number'] = this.consumerPhoneNumber;
    data['consumer_address'] = this.consumerAddress;
    data['order_value'] = this.orderValue;
    data['finale_distance'] = this.finaleDistance;
    data['courier_fee'] = this.courierFee;
    data['distance'] = this.distance;
    data['base_charge'] = this.baseCharge;
    data['base_extra_charge'] = this.baseExtraCharge;
    data['payment_mode'] = this.paymentMode;
    data['picked_up_time'] = this.pickedUpTime;
    data['delivered_time'] = this.deliveredTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['courier_orderable_type'] = this.courierOrderableType;
    data['courier_orderable_id'] = this.courierOrderableId;
    data['delivery_mode'] = this.deliveryMode;
    data['comment'] = this.comment;
    data['collect_payment'] = this.collectPayment;
    data['building'] = this.building;
    data['consumer_pays'] = this.consumerPays;
    data['customer_pays'] = this.customerPays;
    data['city_id'] = this.cityId;
    data['courier_consumer_id'] = this.courierConsumerId;
    data['consumer_name'] = this.consumerName;
    data['is_ready'] = this.isReady;
    data['customer_lat'] = this.customerLat;
    data['customer_lng'] = this.customerLng;
    data['consumer_lat'] = this.consumerLat;
    data['consumer_lng'] = this.consumerLng;
    data['customer_finale_lat'] = this.customerFinaleLat;
    data['customer_finale_lng'] = this.customerFinaleLng;
    data['consumer_finale_lat'] = this.consumerFinaleLat;
    data['consumer_finale_lng'] = this.consumerFinaleLng;
    data['arrival_time'] = this.arrivalTime;
    data['comment_to_courier'] = this.commentToCourier;
    data['estimated_duration'] = this.estimatedDuration;
    data['human_time'] = this.humanTime;
    data['courier'] = this.courier;
    return data;
  }
}
