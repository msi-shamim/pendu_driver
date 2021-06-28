import 'dart:convert';

class ResponseVehiclesDataModel {
  ResponseVehiclesDataModel({
    this.status,
    this.message,
    this.vehiclesList,
  });

  final int status;
  final String message;
  final List<VehiclesList> vehiclesList;

  factory ResponseVehiclesDataModel.fromJson(String str) =>
      ResponseVehiclesDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseVehiclesDataModel.fromMap(Map<String, dynamic> json) =>
      ResponseVehiclesDataModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        vehiclesList: json["data"] == null
            ? null
            : List<VehiclesList>.from(
                json["data"].map((x) => VehiclesList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": vehiclesList == null
            ? null
            : List<dynamic>.from(vehiclesList.map((x) => x.toMap())),
      };
}

class VehiclesList {
  VehiclesList({
    this.id,
    this.title,
    this.icon,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String title;
  final String icon;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory VehiclesList.fromJson(String str) =>
      VehiclesList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VehiclesList.fromMap(Map<String, dynamic> json) => VehiclesList(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        icon: json["icon"] == null ? null : json["icon"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "icon": icon == null ? null : icon,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
