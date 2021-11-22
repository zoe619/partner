// To parse this JSON data, do
//
//     final newPostModel = newPostModelFromJson(jsonString);

import 'dart:convert';

NewPostModel newPostModelFromJson(String str) => NewPostModel.fromJson(json.decode(str));

String newPostModelToJson(NewPostModel data) => json.encode(data.toJson());

class NewPostModel {
  NewPostModel({
    this.data,
  });

  Data data;

  factory NewPostModel.fromJson(Map<String, dynamic> json) => NewPostModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.post,
    this.userId,
    this.seoUrl,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.likesCount,
    this.type,
    this.user,
    this.humanTime,
    this.images,
    this.comments,
    this.video,
    this.allImages,
  });

  String post;
  int userId;
  String seoUrl;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  int likesCount;
  String type;
  User user;
  String humanTime;
  List<dynamic> images;
  List<dynamic> comments;
  Videoo video;
  List<dynamic> allImages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        post: json["post"],
        userId: json["user_id"],
        seoUrl: json["seo_url"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        likesCount: json["likes_count"],
        type: json["type"],
        user: User.fromJson(json["user"]),
        humanTime: json["human_time"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        video: json["video"] == null ? null : Videoo.fromJson(json["video"]),
        allImages: List<dynamic>.from(json["all_images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "post": post,
        "user_id": userId,
        "seo_url": seoUrl,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "likes_count": likesCount,
        "type": type,
        "user": user.toJson(),
        "human_time": humanTime,
        "images": List<dynamic>.from(images.map((x) => x)),
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "video": video,
        "all_images": List<dynamic>.from(allImages.map((x) => x)),
      };
}

class User {
  User({
    this.firstName,
    this.lastName,
    this.email,
    this.image,
  });

  String firstName;
  String lastName;
  String email;
  String image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "image": image,
      };
}

class Videoo {
  Videoo({
    this.id,
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
    this.topCategories,
    this.posterUrl,
    this.liked,
    this.humanTime,
    this.sumHistories,
    this.hoverUrl,
  });

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
  DateTime createdAt;
  DateTime updatedAt;
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
  String thumbnailUrl;
  dynamic channel;
  dynamic country;
  dynamic tags;
  String dateCreated;
  List<dynamic> topCategories;
  String posterUrl;
  dynamic liked;
  String humanTime;
  int sumHistories;
  dynamic hoverUrl;

  factory Videoo.fromJson(Map<String, dynamic> json) => Videoo(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        seoUrl: json["seo_url"],
        fileName: json["file_name"],
        channelId: json["channel_id"],
        status: json["status"],
        ext: json["ext"],
        size: json["size"],
        duration: json["duration"],
        height: json["height"],
        width: json["width"],
        metaDescription: json["meta_description"],
        path: json["path"],
        url: json["url"],
        storageTypeId: json["storage_type_id"],
        isSuspended: json["is_suspended"],
        isApproved: json["is_approved"],
        scheduled: json["scheduled"],
        scheduledDate: json["scheduled_date"],
        scheduledTime: json["scheduled_time"],
        scheduledTimeZone: json["scheduled_time_zone"],
        countryId: json["country_id"],
        languageId: json["language_id"],
        regionId: json["region_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        isUploaded: json["is_uploaded"],
        bitrate: json["bitrate"],
        token: json["token"],
        processedName: json["processed_name"],
        isProcessed: json["is_processed"],
        isProcessing: json["is_processing"],
        isDraft: json["is_draft"],
        type: json["type"],
        videoableType: json["videoable_type"],
        videoableId: json["videoable_id"],
        sentNotification: json["sent_notification"],
        isVoiceOrder: json["is_voice_order"],
        thumbnailUrl: json["thumbnail_url"],
        channel: json["channel"],
        country: json["country"],
        tags: json["tags"],
        dateCreated: json["date_created"],
        topCategories: List<dynamic>.from(json["top_categories"].map((x) => x)),
        posterUrl: json["poster_url"],
        liked: json["liked"],
        humanTime: json["human_time"],
        sumHistories: json["sum_histories"],
        hoverUrl: json["hover_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "seo_url": seoUrl,
        "file_name": fileName,
        "channel_id": channelId,
        "status": status,
        "ext": ext,
        "size": size,
        "duration": duration,
        "height": height,
        "width": width,
        "meta_description": metaDescription,
        "path": path,
        "url": url,
        "storage_type_id": storageTypeId,
        "is_suspended": isSuspended,
        "is_approved": isApproved,
        "scheduled": scheduled,
        "scheduled_date": scheduledDate,
        "scheduled_time": scheduledTime,
        "scheduled_time_zone": scheduledTimeZone,
        "country_id": countryId,
        "language_id": languageId,
        "region_id": regionId,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "is_uploaded": isUploaded,
        "bitrate": bitrate,
        "token": token,
        "processed_name": processedName,
        "is_processed": isProcessed,
        "is_processing": isProcessing,
        "is_draft": isDraft,
        "type": type,
        "videoable_type": videoableType,
        "videoable_id": videoableId,
        "sent_notification": sentNotification,
        "is_voice_order": isVoiceOrder,
        "thumbnail_url": thumbnailUrl,
        "channel": channel,
        "country": country,
        "tags": tags,
        "date_created": dateCreated,
        "top_categories": List<dynamic>.from(topCategories.map((x) => x)),
        "poster_url": posterUrl,
        "liked": liked,
        "human_time": humanTime,
        "sum_histories": sumHistories,
        "hover_url": hoverUrl,
      };
}
