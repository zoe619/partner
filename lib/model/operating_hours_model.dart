class OperatingHours {
  OperatingHours({
    this.id,
    this.timeFrom,
    this.timeTo,
    this.day,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.dayName,
  });

  int id;
  dynamic timeFrom;
  dynamic timeTo;
  int day;
  int isActive;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic dayName;

  factory OperatingHours.fromJson(Map<String, dynamic> json) => OperatingHours(
        id: json["id"],
        timeFrom: json["time_from"],
        timeTo: json["time_to"],
        day: json["day"],
        isActive: json["is_active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        dayName: json["day_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time_from": timeFrom,
        "time_to": timeTo,
        "day": day,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "day_name": dayName,
      };
}
