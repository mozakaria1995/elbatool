class ClinicInfoModel {
  Data? data;

  ClinicInfoModel({this.data});

  ClinicInfoModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? clinicName;
  String? email;
  String? whatsapp;
  String? faceBook;
  String? faceBookCallbackURL;
  String? googleStoreLink;
  String? appleStoreLink;
  String? address;
  var lat;
  var lng;
  String? clinicInfo;
  String? introVideo;
  String? specialty1;
  String? number1;
  String? specialty2;
  String? number2;
  String? specialty3;
  String? number3;
  String? specialty4;
  String? number4;
  List<ImagesGallery>? imagesGallery;

  Data(
      {this.id,
        this.clinicName,
        this.email,
        this.whatsapp,
        this.address,
        this.lat,
        this.lng,
        this.clinicInfo,
        this.introVideo,
        this.specialty1,
        this.number1,
        this.specialty2,
        this.number2,
        this.specialty3,
        this.faceBook,
        this.number3,
        this.specialty4,
        this.number4,
        this.imagesGallery});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicName = json['clinic_name'];
    email = json['email'];
    whatsapp = json['whatsapp'];
    faceBook = json['facebook_page'];
    faceBookCallbackURL = json['facebook_callback_url'];
    address = json['address'];
    googleStoreLink = json['google_store_link'];
    appleStoreLink = json['apple_store_link'];
    lat = json['lat'];
    lng = json['lng'];
    clinicInfo = json['clinic_info'];
    introVideo = json['intro_video'];
    specialty1 = json['Specialty_1'];
    number1 = json['number1'];
    specialty2 = json['Specialty_2'];
    number2 = json['number2'];
    specialty3 = json['Specialty_3'];
    number3 = json['number3'];
    specialty4 = json['Specialty_4'];
    number4 = json['number4'];
    if (json['images_gallery'] != null) {
      imagesGallery = <ImagesGallery>[];
      json['images_gallery'].forEach((v) {
        imagesGallery!.add(new ImagesGallery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['clinic_name'] = clinicName;
    data['email'] = email;
    data['google_store_link'] = googleStoreLink;
    data['apple_store_link'] = appleStoreLink;
    data['whatsapp'] = whatsapp;
    data['facebook_page'] = faceBook;
    data['facebook_callback_url'] = faceBookCallbackURL;
    data['address'] = address;
    data['lat'] = lat;
    data['lng'] = lng;
    data['clinic_info'] = clinicInfo;
    data['intro_video'] = introVideo;
    data['Specialty_1'] = specialty1;
    data['number1'] = number1;
    data['Specialty_2'] = specialty2;
    data['number2'] = number2;
    data['Specialty_3'] = specialty3;
    data['number3'] = number3;
    data['Specialty_4'] = specialty4;
    data['number4'] = number4;
    if (imagesGallery != null) {
      data['images_gallery'] =
          imagesGallery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class ImagesGallery {
  int? id;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  ImagesGallery(
      {this.id, this.image, this.createdAt, this.updatedAt, this.imageUrl});

  ImagesGallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    return data;
  }
}