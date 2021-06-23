// To parse this JSON data, do
//
//     final postRefreshTokenModel = postRefreshTokenModelFromMap(jsonString);

import 'dart:convert';

class PostRefreshTokenModel {
  PostRefreshTokenModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.dropper,
  });

  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final dynamic dropper;

  factory PostRefreshTokenModel.fromJson(String str) =>
      PostRefreshTokenModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostRefreshTokenModel.fromMap(Map<String, dynamic> json) =>
      PostRefreshTokenModel(
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresIn: json["expires_in"] == null ? null : json["expires_in"],
        dropper: json["dropper"],
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "expires_in": expiresIn == null ? null : expiresIn,
        "dropper": dropper,
      };
}
