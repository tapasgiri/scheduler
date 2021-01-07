import 'dart:convert';

Meetings welcomeFromJson(String str) => Meetings.fromJson(json.decode(str));

String welcomeToJson(Meetings data) => json.encode(data.toJson());

class Meetings {
  Meetings({
    this.status,
    this.message,
    this.body,
  });

  int status;
  String message;
  Body body;

  factory Meetings.fromJson(Map<String, dynamic> json) => Meetings(
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

  List<Meeting> meetings;
  String email;
  String password;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        meetings: List<Meeting>.from(
            json["meetings"].map((x) => Meeting.fromJson(x))),
        email: json["email"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "meetings": List<dynamic>.from(meetings.map((x) => x.toJson())),
        "email": email,
        "password": password,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}

class Meeting {
  Meeting({
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

  List<dynamic> locations;
  List<dynamic> meetingnotes;
  String meetingName;
  DateTime meetingDate;
  String meetingtime;
  String meetingType;
  String meetingcompleted;
  String meetingContact;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
        locations: List<dynamic>.from(json["locations"].map((x) => x)),
        meetingnotes: List<dynamic>.from(json["meetingnotes"].map((x) => x)),
        meetingName: json["meetingName"],
        meetingDate: DateTime.parse(json["meetingDate"]),
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
        "meetingnotes": List<dynamic>.from(meetingnotes.map((x) => x)),
        "meetingName": meetingName,
        "meetingDate":
            "${meetingDate.year.toString().padLeft(4, '0')}-${meetingDate.month.toString().padLeft(2, '0')}-${meetingDate.day.toString().padLeft(2, '0')}",
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
