import 'channel_model.dart';

class Video {
  int id;
  String name;
  Null description;
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
  Null deletedAt;
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
  Channel channel;
  dynamic country;
  dynamic tags;
  String dateCreated;
  // List<dynamic> topCategories;
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
    thumbnailUrl = json['thumbnail_url'];
    channel =
        json['channel'] != null ? new Channel.fromJson(json['channel']) : null;
    country = json['country'];
    tags = json['tags'];
    dateCreated = json['date_created'];
    // if (json['top_categories'] != null) {
    //   topCategories = new List<dynamic>();
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
    if (this.channel != null) {
      data['channel'] = this.channel.toJson();
    }
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
