// To parse this JSON data, do
//
//     final restaurantModel = restaurantModelFromJson(jsonString);

import 'dart:convert';

import 'package:winter_food/models/food.dart';

List<RestaurantModel> restaurantModelFromJson(String str) => List<RestaurantModel>.from(json.decode(str).map((x) => RestaurantModel.fromJson(x)));

String restaurantModelToJson(List<RestaurantModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantModel {
    final String id;
    final String title;
    final String time;
    final String imageUrl;
    final List<FoodModel> foods;
    final bool pickup;
    final bool delivery;
    final bool isAvailable;
    final String owner;
    final String code;
    final String logoUrl;
    final double rating;
    final String ratingCount;
    final String verification;
    final String verificationMessage;
    final Coords coords;
    final double? earnings;

    RestaurantModel({
        required this.id,
        required this.title,
        required this.time,
        required this.imageUrl,
        required this.foods,
        required this.pickup,
        required this.delivery,
        required this.isAvailable,
        required this.owner,
        required this.code,
        required this.logoUrl,
        required this.rating,
        required this.ratingCount,
        required this.verification,
        required this.verificationMessage,
        required this.coords,
        this.earnings,
    });

    factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        foods: List<FoodModel>.from(json["foods"].map((x) => FoodModel.fromJson(x))),
        pickup: json["pickup"],
        delivery: json["delivery"],
        isAvailable: json["isAvailable"],
        owner: json["owner"],
        code: json["code"],
        logoUrl: json["logoUrl"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        verification: json["verification"],
        verificationMessage: json["verificationMessage"],
        coords: Coords.fromJson(json["coords"]),
        earnings: json["earnings"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "imageUrl": imageUrl,
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "pickup": pickup,
        "delivery": delivery,
        "isAvailable": isAvailable,
        "owner": owner,
        "code": code,
        "logoUrl": logoUrl,
        "rating": rating,
        "ratingCount": ratingCount,
        "verification": verification,
        "verificationMessage": verificationMessage,
        "coords": coords.toJson(),
        "earnings": earnings,
    };
}

class Coords {
    final String id;
    final double latitude;
    final double longitude;
    final double latitudeDelta;
    final double longitudeDelta;
    final String address;
    final String title;

    Coords({
        required this.id,
        required this.latitude,
        required this.longitude,
        required this.latitudeDelta,
        required this.longitudeDelta,
        required this.address,
        required this.title,
    });

    factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        id: json["id"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        latitudeDelta: json["latitudeDelta"]?.toDouble(),
        longitudeDelta: json["longitudeDelta"]?.toDouble(),
        address: json["address"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "latitudeDelta": latitudeDelta,
        "longitudeDelta": longitudeDelta,
        "address": address,
        "title": title,
    };
}
