class CountriesModel {
  List<Data> data;
  Links links;
  Meta meta;
  String message;

  CountriesModel({this.data, this.links, this.meta, this.message});

  CountriesModel.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Data {
  int id;
  String code;
  String seoUrl;
  Null description;
  int destinationEnabled;
  int top;
  String name;
  String dCode;
  int isActive;
  Null deletedAt;
  String createdAt;
  String updatedAt;
  int experienceEnabled;
  String imageUrl;
  Null mapUrl;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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

class Links {
  String first;
  String last;
  Null prev;
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
