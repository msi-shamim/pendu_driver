// To parse this JSON data, do
//
//     final postDroperRegisterModel = postDroperRegisterModelFromMap(jsonString);

import 'dart:convert';

class PostDroperRegisterModel {
  PostDroperRegisterModel({
    this.status,
    this.message,
    this.data,
  });

  final int status;
  final String message;
  final Data data;

  factory PostDroperRegisterModel.fromJson(String str) =>
      PostDroperRegisterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostDroperRegisterModel.fromMap(Map<String, dynamic> json) =>
      PostDroperRegisterModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toMap(),
      };
}

class Data {
  Data({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.abn,
    this.vehicleId,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.fullName,
    this.profileImage,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String abn;
  final int vehicleId;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;
  final String fullName;
  final String profileImage;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        abn: json["abn"] == null ? null : json["abn"],
        vehicleId: json["vehicle_id"] == null ? null : json["vehicle_id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] == null ? null : json["id"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "abn": abn == null ? null : abn,
        "vehicle_id": vehicleId == null ? null : vehicleId,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "id": id == null ? null : id,
        "full_name": fullName == null ? null : fullName,
        "profile_image": profileImage == null ? null : profileImage,
      };
}
