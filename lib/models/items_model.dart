import 'package:order_tracker/models/booking_item.dart';

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