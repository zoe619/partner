class RestaurantOfflineOrdersModel {
  List<Data> data;
  Links links;
  Meta meta;
  String message;

  RestaurantOfflineOrdersModel({this.data, this.links, this.meta, this.message});

  RestaurantOfflineOrdersModel.fromJson(Map<String, dynamic> json) {
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

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
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
  dynamic bookingableType;
  dynamic bookingableId;
  dynamic quantity;
  dynamic total;
  dynamic redemptionCode;
  dynamic userId;
  dynamic supplierId;
  dynamic bookingStatusId;
  dynamic paymentId;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic restaurantId;
  dynamic bookingRef;
  dynamic sessionId;
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
  dynamic orderState;
  dynamic isOfflineOrder;
  dynamic discount;
  dynamic takeAwayDiscount;
  dynamic estimatedDuration;
  dynamic isDelivered;
  dynamic orderDate;
  dynamic humanTime;
  OrderDetail orderDetail;
  dynamic deliveryState;

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
      this.deliveryState});

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
    return data;
  }
}

class OrderDetail {
  dynamic menu;
  dynamic customerName;
  dynamic address;
  dynamic customerId;
  dynamic buildingNumber;
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
