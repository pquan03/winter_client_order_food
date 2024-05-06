// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
    final String? id;
    final String? title;
    final String? time;
    final List<String>? foodTags;
    final String? category;
    final List<String?>? foodType;
    final String? code;
    final bool? isAvailable;
    final String? restaurant;
    final double? rating;
    final String? ratingCount;
    final String? description;
    final double? price;
    final List<Additive>? additives;
    final List<String>? imageUrl;

    FoodModel({
        this.id,
        this.title,
        this.time,
        this.foodTags,
        this.category,
        this.foodType,
        this.code,
        this.isAvailable,
        this.restaurant,
        this.rating,
        this.ratingCount,
        this.description,
        this.price,
        this.additives,
        this.imageUrl,
    });

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        foodTags: json["foodTags"] == null ? [] : List<String>.from(json["foodTags"]!.map((x) => x)),
        category: json["category"],
        foodType: json["foodType"] == null ? [] : List<String?>.from(json["foodType"]!.map((x) => x)),
        code: json["code"],
        isAvailable: json["isAvailable"],
        restaurant: json["restaurant"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        additives: json["additives"] == null ? [] : List<Additive>.from(json["additives"]!.map((x) => Additive.fromJson(x))),
        imageUrl: json["imageUrl"] == null ? [] : List<String>.from(json["imageUrl"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "foodTags": foodTags == null ? [] : List<dynamic>.from(foodTags!.map((x) => x)),
        "category": category,
        "foodType": foodType == null ? [] : List<dynamic>.from(foodType!.map((x) => x)),
        "code": code,
        "isAvailable": isAvailable,
        "restaurant": restaurant,
        "rating": rating,
        "ratingCount": ratingCount,
        "description": description,
        "price": price,
        "additives": additives == null ? [] : List<dynamic>.from(additives!.map((x) => x.toJson())),
        "imageUrl": imageUrl == null ? [] : List<dynamic>.from(imageUrl!.map((x) => x)),
    };
}

class Additive {
    final int? id;
    final String? title;
    final String? price;

    Additive({
        this.id,
        this.title,
        this.price,
    });

    factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        id: json["id"],
        title: json["title"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
    };
}
