class OrdersModel {
  List<Data> data;

  OrdersModel({this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int quantity;
  int total;
  Data data;
  String redemptionCode;
  Null userId;
  Null supplierId;
  int bookingStatusId;
  int paymentId;
  Null deletedAt;
  String createdAt;
  String updatedAt;
  Null restaurantId;
  String bookingRef;
  String sessionId;
  String orderDate;
  String humanTime;
  Null user;
  List<Items> items;

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
      this.orderDate,
      this.humanTime,
      this.user,
      this.items});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    total = json['total'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
    orderDate = json['order_date'];
    humanTime = json['human_time'];
    user = json['user'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
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
    data['order_date'] = this.orderDate;
    data['human_time'] = this.humanTime;
    data['user'] = this.user;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datta {
  String deliveryMethod;
  String comment;
  String address;

  Datta({this.deliveryMethod, this.comment, this.address});

  Datta.fromJson(Map<String, dynamic> json) {
    deliveryMethod = json['delivery-method'];
    comment = json['comment'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery-method'] = this.deliveryMethod;
    data['comment'] = this.comment;
    data['address'] = this.address;
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

class BookingItemable {
  int id;
  String name;
  int price;
  int foodMenuId;
  String description;
  String createdAt;
  String updatedAt;
  int restaurantId;
  int isSuspend;

  BookingItemable(
      {this.id,
      this.name,
      this.price,
      this.foodMenuId,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.restaurantId,
      this.isSuspend});

  BookingItemable.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    foodMenuId = json['food_menu_id'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    restaurantId = json['restaurant_id'];
    isSuspend = json['is_suspend'];
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
    data['is_suspend'] = this.isSuspend;
    return data;
  }
}
