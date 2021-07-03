// To parse this JSON data, do
//
//     final responseSetNewPassModel = responseSetNewPassModelFromMap(jsonString);

import 'dart:convert';

class ResponseSetNewPassModel {
  ResponseSetNewPassModel({
    this.status,
    this.message,
    this.error,
  });

  final int status;
  final String message;
  final List<dynamic> error;

  factory ResponseSetNewPassModel.fromJson(String str) =>
      ResponseSetNewPassModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseSetNewPassModel.fromMap(Map<String, dynamic> json) =>
      ResponseSetNewPassModel(
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
