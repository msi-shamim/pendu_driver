// To parse this JSON data, do
//
//     final responseDropperProfileModel = responseDropperProfileModelFromMap(jsonString);

import 'dart:convert';

class ResponseDropperProfileModel {
  ResponseDropperProfileModel({
    this.status,
    this.message,
    this.dropperList,
  });

  final int status;
  final String message;
  final DropperList dropperList;

  factory ResponseDropperProfileModel.fromJson(String str) =>
      ResponseDropperProfileModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseDropperProfileModel.fromMap(Map<String, dynamic> json) =>
      ResponseDropperProfileModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        dropperList:
            json["data"] == null ? null : DropperList.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": dropperList == null ? null : dropperList.toMap(),
      };
}

class DropperList {
  DropperList({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.abn,
    this.balance,
    this.vehicleId,
    this.dropperGroupId,
    this.licenseFront,
    this.licenseBack,
    this.profileImage,
    this.rating,
    this.averageAccuracy,
    this.successRate,
    this.createdAt,
    this.updatedAt,
    this.fullName,
    this.referralLink,
    this.services,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String abn;
  final String balance;
  final String vehicleId;
  final String dropperGroupId;
  final dynamic licenseFront;
  final dynamic licenseBack;
  final String profileImage;
  final dynamic rating;
  final dynamic averageAccuracy;
  final dynamic successRate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String fullName;
  final String referralLink;
  final List<Service> services;

  factory DropperList.fromJson(String str) =>
      DropperList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DropperList.fromMap(Map<String, dynamic> json) => DropperList(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        abn: json["abn"] == null ? null : json["abn"],
        balance: json["balance"] == null ? null : json["balance"],
        vehicleId: json["vehicle_id"] == null ? null : json["vehicle_id"],
        dropperGroupId:
            json["dropper_group_id"] == null ? null : json["dropper_group_id"],
        licenseFront: json["license_front"],
        licenseBack: json["license_back"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        rating: json["rating"],
        averageAccuracy: json["average_accuracy"],
        successRate: json["success_rate"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fullName: json["full_name"] == null ? null : json["full_name"],
        referralLink:
            json["referral_link"] == null ? null : json["referral_link"],
        services: json["services"] == null
            ? null
            : List<Service>.from(
                json["services"].map((x) => Service.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "abn": abn == null ? null : abn,
        "balance": balance == null ? null : balance,
        "vehicle_id": vehicleId == null ? null : vehicleId,
        "dropper_group_id": dropperGroupId == null ? null : dropperGroupId,
        "license_front": licenseFront,
        "license_back": licenseBack,
        "profile_image": profileImage == null ? null : profileImage,
        "rating": rating,
        "average_accuracy": averageAccuracy,
        "success_rate": successRate,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "full_name": fullName == null ? null : fullName,
        "referral_link": referralLink == null ? null : referralLink,
        "services": services == null
            ? null
            : List<dynamic>.from(services.map((x) => x.toMap())),
      };
}

class Service {
  Service({
    this.id,
    this.title,
    this.slug,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  final int id;
  final String title;
  final String slug;
  final String icon;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  factory Service.fromJson(String str) => Service.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Service.fromMap(Map<String, dynamic> json) => Service(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        icon: json["icon"] == null ? null : json["icon"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromMap(json["pivot"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "icon": icon == null ? null : icon,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "pivot": pivot == null ? null : pivot.toMap(),
      };
}

class Pivot {
  Pivot({
    this.dropperId,
    this.serviceCategoryId,
  });

  final String dropperId;
  final String serviceCategoryId;

  factory Pivot.fromJson(String str) => Pivot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pivot.fromMap(Map<String, dynamic> json) => Pivot(
        dropperId: json["dropper_id"] == null ? null : json["dropper_id"],
        serviceCategoryId: json["service_category_id"] == null
            ? null
            : json["service_category_id"],
      );

  Map<String, dynamic> toMap() => {
        "dropper_id": dropperId == null ? null : dropperId,
        "service_category_id":
            serviceCategoryId == null ? null : serviceCategoryId,
      };
}
