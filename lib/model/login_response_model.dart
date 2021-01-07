// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginResponse welcomeFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String welcomeToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.status,
    this.message,
    this.body,
  });

  int status;
  String message;
  Body body;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
    this.token,
    this.id,
  });

  String token;
  String id;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    token: json["token"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "id": id,
  };
}
