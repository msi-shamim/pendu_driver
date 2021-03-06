// To parse this JSON data, do
//
//     final postSubmitTaskOfferModel = postSubmitTaskOfferModelFromMap(jsonString);

import 'dart:convert';

class PostSubmitTaskOfferModel {
  PostSubmitTaskOfferModel({
    this.status,
    this.message,
    this.taskOffersList,
  });

  final int status;
  final String message;
  final TaskOffersList taskOffersList;

  factory PostSubmitTaskOfferModel.fromJson(String str) =>
      PostSubmitTaskOfferModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostSubmitTaskOfferModel.fromMap(Map<String, dynamic> json) =>
      PostSubmitTaskOfferModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        taskOffersList:
            json["data"] == null ? null : TaskOffersList.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": taskOffersList == null ? null : taskOffersList.toMap(),
      };
}

class TaskOffersList {
  TaskOffersList({
    this.id,
    this.amount,
    this.taskId,
    this.dropperId,
    this.status,
    this.acceptedAt,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String amount;
  final String taskId;
  final String dropperId;
  final String status;
  final dynamic acceptedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory TaskOffersList.fromJson(String str) =>
      TaskOffersList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TaskOffersList.fromMap(Map<String, dynamic> json) => TaskOffersList(
        id: json["id"] == null ? null : json["id"],
        amount: json["amount"] == null ? null : json["amount"],
        taskId: json["task_id"] == null ? null : json["task_id"],
        dropperId: json["dropper_id"] == null ? null : json["dropper_id"],
        status: json["status"] == null ? null : json["status"],
        acceptedAt: json["accepted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "amount": amount == null ? null : amount,
        "task_id": taskId == null ? null : taskId,
        "dropper_id": dropperId == null ? null : dropperId,
        "status": status == null ? null : status,
        "accepted_at": acceptedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
