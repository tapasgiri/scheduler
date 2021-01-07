// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SignUpResponse welcomeFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String welcomeToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  SignUpResponse({
    this.status,
    this.message,
    this.body,
  });

  int status;
  String message;
  Body body;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    status: json["status"],
    message: json["message"],
    body: Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "body": body.toJson(),
  };
}

class Body {
  Body({
    this.meetings,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  List<dynamic> meetings;
  String email;
  String password;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    meetings: List<dynamic>.from(json["meetings"].map((x) => x)),
    email: json["email"],
    password: json["password"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "meetings": List<dynamic>.from(meetings.map((x) => x)),
    "email": email,
    "password": password,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": id,
  };
}
