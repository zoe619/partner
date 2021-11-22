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
  String imageableType;
  int imageableId;
  dynamic deletedAt;
  String createdAt;
  String updatedAt;

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
        this.storageTypeId,
        this.imageableType,
        this.imageableId,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

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
    imageableType = json['imageable_type'];
    imageableId = json['imageable_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['imageable_type'] = this.imageableType;
    data['imageable_id'] = this.imageableId;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}