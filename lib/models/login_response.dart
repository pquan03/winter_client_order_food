// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    final String? id;
    final bool? phoneVerification;
    final String? email;
    final String? fcm;
    final String? username;
    final String? password;
    final String? userType;
    final bool? verification;
    final String? otp;
    final String? profilePic;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final String? userToken;

    LoginResponse({
        this.id,
        this.phoneVerification,
        this.email,
        this.fcm,
        this.username,
        this.password,
        this.userType,
        this.verification,
        this.otp,
        this.profilePic,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.userToken,
    });

    factory LoginResponse.empty() => LoginResponse(
        id: '',
        phoneVerification: false,
        email: '',
        fcm: '',
        username: '',
        password: '',
        userType: '',
        verification: false,
        otp: '',
        profilePic: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        v: 0,
        userToken: '',
    );

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["_id"],
        phoneVerification: json["phone_verification"],
        email: json["email"],
        fcm: json["fcm"],
        username: json["username"],
        password: json["password"],
        userType: json["user_type"],
        verification: json["verification"],
        otp: json["otp"],
        profilePic: json["profile_pic"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        userToken: json["userToken"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "phone_verification": phoneVerification,
        "email": email,
        "fcm": fcm,
        "username": username,
        "password": password,
        "user_type": userType,
        "verification": verification,
        "otp": otp,
        "profile_pic": profilePic,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "userToken": userToken,
    };
}
