// To parse this JSON data, do
//
//     final responseSingleTaskInfoViaOfferIdModel = responseSingleTaskInfoViaOfferIdModelFromMap(jsonString);

import 'dart:convert';

class ResponseSingleTaskInfoViaOfferIdModel {
  ResponseSingleTaskInfoViaOfferIdModel({
    this.status,
    this.message,
    this.singleTaskInfoViaOfferIdList,
  });

  final int status;
  final String message;
  final List<SingleTaskInfoViaOfferIdList> singleTaskInfoViaOfferIdList;

  factory ResponseSingleTaskInfoViaOfferIdModel.fromJson(String str) =>
      ResponseSingleTaskInfoViaOfferIdModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseSingleTaskInfoViaOfferIdModel.fromMap(
          Map<String, dynamic> json) =>
      ResponseSingleTaskInfoViaOfferIdModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        singleTaskInfoViaOfferIdList: json["data"] == null
            ? null
            : List<SingleTaskInfoViaOfferIdList>.from(json["data"]
                .map((x) => SingleTaskInfoViaOfferIdList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": singleTaskInfoViaOfferIdList == null
            ? null
            : List<dynamic>.from(
                singleTaskInfoViaOfferIdList.map((x) => x.toMap())),
      };
}

class SingleTaskInfoViaOfferIdList {
  SingleTaskInfoViaOfferIdList({
    this.id,
    this.amount,
    this.taskId,
    this.dropperId,
    this.status,
    this.acceptedAt,
    this.createdAt,
    this.updatedAt,
    this.task,
  });

  final int id;
  final String amount;
  final String taskId;
  final String dropperId;
  final String status;
  final dynamic acceptedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Task task;

  factory SingleTaskInfoViaOfferIdList.fromJson(String str) =>
      SingleTaskInfoViaOfferIdList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SingleTaskInfoViaOfferIdList.fromMap(Map<String, dynamic> json) =>
      SingleTaskInfoViaOfferIdList(
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
        task: json["task"] == null ? null : Task.fromMap(json["task"]),
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
        "task": task == null ? null : task.toMap(),
      };
}

class Task {
  Task({
    this.id,
    this.taskId,
    this.title,
    this.image,
    this.from,
    this.fromLat,
    this.fromLng,
    this.to,
    this.toLat,
    this.toLng,
    this.notes,
    this.totalCost,
    this.userId,
    this.deliveryTimeId,
    this.serviceCategoryId,
    this.vehicleId,
    this.quoteDropperId,
    this.offerId,
    this.taskType,
    this.requestStatus,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.productCategories,
    this.serviceCategory,
    this.products,
  });

  final int id;
  final String taskId;
  final String title;
  final dynamic image;
  final String from;
  final String fromLat;
  final String fromLng;
  final String to;
  final String toLat;
  final String toLng;
  final String notes;
  final String totalCost;
  final String userId;
  final String deliveryTimeId;
  final String serviceCategoryId;
  final dynamic vehicleId;
  final dynamic quoteDropperId;
  final dynamic offerId;
  final String taskType;
  final String requestStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String imageUrl;
  final List<dynamic> productCategories;
  final ServiceCategory serviceCategory;
  final List<Product> products;

  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json["id"] == null ? null : json["id"],
        taskId: json["task_id"] == null ? null : json["task_id"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"],
        from: json["from"] == null ? null : json["from"],
        fromLat: json["from_lat"] == null ? null : json["from_lat"],
        fromLng: json["from_lng"] == null ? null : json["from_lng"],
        to: json["to"] == null ? null : json["to"],
        toLat: json["to_lat"] == null ? null : json["to_lat"],
        toLng: json["to_lng"] == null ? null : json["to_lng"],
        notes: json["notes"] == null ? null : json["notes"],
        totalCost: json["total_cost"] == null ? null : json["total_cost"],
        userId: json["user_id"] == null ? null : json["user_id"],
        deliveryTimeId:
            json["delivery_time_id"] == null ? null : json["delivery_time_id"],
        serviceCategoryId: json["service_category_id"] == null
            ? null
            : json["service_category_id"],
        vehicleId: json["vehicle_id"],
        quoteDropperId: json["quote_dropper_id"],
        offerId: json["offer_id"],
        taskType: json["task_type"] == null ? null : json["task_type"],
        requestStatus:
            json["request_status"] == null ? null : json["request_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        productCategories: json["product_categories"] == null
            ? null
            : List<dynamic>.from(json["product_categories"].map((x) => x)),
        serviceCategory: json["service_category"] == null
            ? null
            : ServiceCategory.fromMap(json["service_category"]),
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "task_id": taskId == null ? null : taskId,
        "title": title == null ? null : title,
        "image": image,
        "from": from == null ? null : from,
        "from_lat": fromLat == null ? null : fromLat,
        "from_lng": fromLng == null ? null : fromLng,
        "to": to == null ? null : to,
        "to_lat": toLat == null ? null : toLat,
        "to_lng": toLng == null ? null : toLng,
        "notes": notes == null ? null : notes,
        "total_cost": totalCost == null ? null : totalCost,
        "user_id": userId == null ? null : userId,
        "delivery_time_id": deliveryTimeId == null ? null : deliveryTimeId,
        "service_category_id":
            serviceCategoryId == null ? null : serviceCategoryId,
        "vehicle_id": vehicleId,
        "quote_dropper_id": quoteDropperId,
        "offer_id": offerId,
        "task_type": taskType == null ? null : taskType,
        "request_status": requestStatus == null ? null : requestStatus,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "image_url": imageUrl == null ? null : imageUrl,
        "product_categories": productCategories == null
            ? null
            : List<dynamic>.from(productCategories.map((x) => x)),
        "service_category":
            serviceCategory == null ? null : serviceCategory.toMap(),
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toMap())),
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.qty,
    this.taskId,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final Name name;
  final String price;
  final String qty;
  final String taskId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        price: json["price"] == null ? null : json["price"],
        qty: json["qty"] == null ? null : json["qty"],
        taskId: json["task_id"] == null ? null : json["task_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : nameValues.reverse[name],
        "price": price == null ? null : price,
        "qty": qty == null ? null : qty,
        "task_id": taskId == null ? null : taskId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

enum Name { APPLE, CHIPS, JUICE }

final nameValues =
    EnumValues({"Apple": Name.APPLE, "Chips": Name.CHIPS, "Juice": Name.JUICE});

class ServiceCategory {
  ServiceCategory({
    this.id,
    this.title,
    this.slug,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String title;
  final String slug;
  final String icon;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ServiceCategory.fromJson(String str) =>
      ServiceCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceCategory.fromMap(Map<String, dynamic> json) => ServiceCategory(
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
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "icon": icon == null ? null : icon,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
