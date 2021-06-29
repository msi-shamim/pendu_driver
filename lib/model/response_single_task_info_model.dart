// To parse this JSON data, do
//
//     final responseSingleTaskInfoModel = responseSingleTaskInfoModelFromMap(jsonString);

import 'dart:convert';

class ResponseSingleTaskInfoModel {
  ResponseSingleTaskInfoModel({
    this.status,
    this.message,
    this.singleTaskList,
  });

  final int status;
  final String message;
  final List<SingleTaskList> singleTaskList;

  factory ResponseSingleTaskInfoModel.fromJson(String str) =>
      ResponseSingleTaskInfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseSingleTaskInfoModel.fromMap(Map<String, dynamic> json) =>
      ResponseSingleTaskInfoModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        singleTaskList: json["data"] == null
            ? null
            : List<SingleTaskList>.from(
                json["data"].map((x) => SingleTaskList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": singleTaskList == null
            ? null
            : List<dynamic>.from(singleTaskList.map((x) => x.toMap())),
      };
}

class SingleTaskList {
  SingleTaskList({
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
    this.offersCount,
    this.imageUrl,
    this.user,
    this.products,
    this.serviceCategory,
    this.deliveryTime,
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
  final String offersCount;
  final String imageUrl;
  final User user;
  final List<Product> products;
  final DeliveryTime serviceCategory;
  final DeliveryTime deliveryTime;

  factory SingleTaskList.fromJson(String str) =>
      SingleTaskList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SingleTaskList.fromMap(Map<String, dynamic> json) => SingleTaskList(
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
        offersCount: json["offers_count"] == null ? null : json["offers_count"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromMap(x))),
        serviceCategory: json["service_category"] == null
            ? null
            : DeliveryTime.fromMap(json["service_category"]),
        deliveryTime: json["delivery_time"] == null
            ? null
            : DeliveryTime.fromMap(json["delivery_time"]),
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
        "offers_count": offersCount == null ? null : offersCount,
        "image_url": imageUrl == null ? null : imageUrl,
        "user": user == null ? null : user.toMap(),
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toMap())),
        "service_category":
            serviceCategory == null ? null : serviceCategory.toMap(),
        "delivery_time": deliveryTime == null ? null : deliveryTime.toMap(),
      };
}

class DeliveryTime {
  DeliveryTime({
    this.id,
    this.title,
    this.slug,
    this.icon,
    this.time,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String title;
  final String slug;
  final String icon;
  final DateTime time;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory DeliveryTime.fromJson(String str) =>
      DeliveryTime.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeliveryTime.fromMap(Map<String, dynamic> json) => DeliveryTime(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        icon: json["icon"] == null ? null : json["icon"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
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
        "time": time == null ? null : time.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
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
  final String name;
  final String price;
  final String qty;
  final String taskId;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
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
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "qty": qty == null ? null : qty,
        "task_id": taskId == null ? null : taskId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.balance,
    this.suburb,
    this.phone,
    this.profilePhoto,
    this.roleId,
    this.email,
    this.phoneVerifiedAt,
    this.emailVerifiedAt,
    this.referralId,
    this.createdAt,
    this.updatedAt,
    this.referralLink,
  });

  final int id;
  final String name;
  final String balance;
  final String suburb;
  final String phone;
  final String profilePhoto;
  final String roleId;
  final String email;
  final DateTime phoneVerifiedAt;
  final dynamic emailVerifiedAt;
  final dynamic referralId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String referralLink;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        balance: json["balance"] == null ? null : json["balance"],
        suburb: json["suburb"] == null ? null : json["suburb"],
        phone: json["phone"] == null ? null : json["phone"],
        profilePhoto:
            json["profile_photo"] == null ? null : json["profile_photo"],
        roleId: json["role_id"] == null ? null : json["role_id"],
        email: json["email"] == null ? null : json["email"],
        phoneVerifiedAt: json["phone_verified_at"] == null
            ? null
            : DateTime.parse(json["phone_verified_at"]),
        emailVerifiedAt: json["email_verified_at"],
        referralId: json["referral_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        referralLink:
            json["referral_link"] == null ? null : json["referral_link"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "balance": balance == null ? null : balance,
        "suburb": suburb == null ? null : suburb,
        "phone": phone == null ? null : phone,
        "profile_photo": profilePhoto == null ? null : profilePhoto,
        "role_id": roleId == null ? null : roleId,
        "email": email == null ? null : email,
        "phone_verified_at":
            phoneVerifiedAt == null ? null : phoneVerifiedAt.toIso8601String(),
        "email_verified_at": emailVerifiedAt,
        "referral_id": referralId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "referral_link": referralLink == null ? null : referralLink,
      };
}
