// To parse this JSON data, do
//
//     final responseOtpConfirmModel = responseOtpConfirmModelFromMap(jsonString);

import 'dart:convert';

class ResponseOtpConfirmModel {
  ResponseOtpConfirmModel({
    this.status,
    this.message,
    this.error,
  });

  final int status;
  final String message;
  final List<dynamic> error;

  factory ResponseOtpConfirmModel.fromJson(String str) =>
      ResponseOtpConfirmModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseOtpConfirmModel.fromMap(Map<String, dynamic> json) =>
      ResponseOtpConfirmModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        error: json["error"] == null
            ? null
            : List<dynamic>.from(json["error"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "error": error == null ? null : List<dynamic>.from(error.map((x) => x)),
      };
}
