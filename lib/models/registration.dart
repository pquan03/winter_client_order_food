// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) =>
    RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) =>
    json.encode(data.toJson());

class RegistrationModel {
  final String? email;
  final String? username;
  final String? password;

  RegistrationModel({
    this.email,
    this.username,
    this.password,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        email: json["email"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
      };
}
