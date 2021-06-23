// To parse this JSON data, do
//
//     final postLoginDropperModel = postLoginDropperModelFromMap(jsonString);

import 'dart:convert';

class PostLoginDropperModel {
  PostLoginDropperModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.dropper,
  });

  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final Dropper dropper;

  factory PostLoginDropperModel.fromJson(String str) =>
      PostLoginDropperModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostLoginDropperModel.fromMap(Map<String, dynamic> json) =>
      PostLoginDropperModel(
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresIn: json["expires_in"] == null ? null : json["expires_in"],
        dropper:
            json["dropper"] == null ? null : Dropper.fromMap(json["dropper"]),
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "expires_in": expiresIn == null ? null : expiresIn,
        "dropper": dropper == null ? null : dropper.toMap(),
      };
}

class Dropper {
  Dropper({
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
  final String rating;
  final String averageAccuracy;
  final String successRate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String fullName;

  factory Dropper.fromJson(String str) => Dropper.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dropper.fromMap(Map<String, dynamic> json) => Dropper(
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
        rating: json["rating"] == null ? null : json["rating"],
        averageAccuracy:
            json["average_accuracy"] == null ? null : json["average_accuracy"],
        successRate: json["success_rate"] == null ? null : json["success_rate"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fullName: json["full_name"] == null ? null : json["full_name"],
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
        "rating": rating == null ? null : rating,
        "average_accuracy": averageAccuracy == null ? null : averageAccuracy,
        "success_rate": successRate == null ? null : successRate,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "full_name": fullName == null ? null : fullName,
      };
}
