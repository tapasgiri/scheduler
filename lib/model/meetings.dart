// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UMeetings welcomeFromJson(String str) => UMeetings.fromJson(json.decode(str));

String welcomeToJson(UMeetings data) => json.encode(data.toJson());

class UMeetings {
  UMeetings({
    this.status,
    this.message,
    this.body,
  });

  int status;
  String message;
  List<Body> body;

  factory UMeetings.fromJson(Map<String, dynamic> json) => UMeetings(
        status: json["status"],
        message: json["message"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class Body {
  Body({
    this.locations,
    this.meetingnotes,
    this.meetingName,
    this.meetingDate,
    this.meetingtime,
    this.meetingType,
    this.meetingcompleted,
    this.meetingContact,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  List<String> locations;
  List<Meetingnote> meetingnotes;
  String meetingName;
  String meetingDate;
  String meetingtime;
  String meetingType;
  String meetingcompleted;
  String meetingContact;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        locations: List<String>.from(json["locations"].map((x) => x)),
        meetingnotes: List<Meetingnote>.from(
            json["meetingnotes"].map((x) => Meetingnote.fromJson(x))),
        meetingName: json["meetingName"],
        meetingDate: json["meetingDate"],
        meetingtime: json["meetingtime"],
        meetingType: json["meetingType"],
        meetingcompleted: json["meetingcompleted"],
        meetingContact: json["meetingContact"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "locations": List<dynamic>.from(locations.map((x) => x)),
        "meetingnotes": List<dynamic>.from(meetingnotes.map((x) => x.toJson())),
        "meetingName": meetingName,
        "meetingDate": meetingDate,
        "meetingtime": meetingtime,
        "meetingType": meetingType,
        "meetingcompleted": meetingcompleted,
        "meetingContact": meetingContact,
        "user_id": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}

class Meetingnote {
  Meetingnote({
    this.files,
    this.bsontype,
    this.id,
  });

  List<dynamic> files;
  String bsontype;
  Id id;

  factory Meetingnote.fromJson(Map<String, dynamic> json) => Meetingnote(
        files: List<dynamic>.from(json["Files"].map((x) => x)),
        bsontype: json["_bsontype"],
        id: Id.fromJson(json["id"]),
      );

  Map<String, dynamic> toJson() => {
        "Files": List<dynamic>.from(files.map((x) => x)),
        "_bsontype": bsontype,
        "id": id.toJson(),
      };
}

class Id {
  Id({
    this.type,
    this.data,
  });

  String type;
  List<int> data;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        type: json["type"],
        data: List<int>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
