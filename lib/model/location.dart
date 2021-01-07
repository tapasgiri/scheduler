// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LocationModel welcomeFromJson(String str) => LocationModel.fromJson(json.decode(str));

String welcomeToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  LocationModel({
    this.status,
    this.message,
    this.body,
  });

  int status;
  String message;
  List<Body> body;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
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
    this.states,
    this.countryName,
    this.countryCode,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  List<State> states;
  String countryName;
  String countryCode;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    states: List<State>.from(json["states"].map((x) => State.fromJson(x))),
    countryName: json["countryName"] == null ? null : json["countryName"],
    countryCode: json["countryCode"] == null ? null : json["countryCode"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "states": List<dynamic>.from(states.map((x) => x.toJson())),
    "countryName": countryName == null ? null : countryName,
    "countryCode": countryCode == null ? null : countryCode,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": id,
  };
}

class State {
  State({
    this.districts,
    this.stateName,
    this.stateCode,
    this.countryId,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  List<District> districts;
  String stateName;
  String stateCode;
  String countryId;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory State.fromJson(Map<String, dynamic> json) => State(
    districts: List<District>.from(json["districts"].map((x) => District.fromJson(x))),
    stateName: json["stateName"],
    stateCode: json["stateCode"],
    countryId: json["countryId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "districts": List<dynamic>.from(districts.map((x) => x.toJson())),
    "stateName": stateName,
    "stateCode": stateCode,
    "countryId": countryId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": id,
  };
}

class District {
  District({
    this.villages,
    this.districtName,
    this.districtCode,
    this.stateId,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  List<Village> villages;
  String districtName;
  String districtCode;
  StateId stateId;
  DateTime createdAt;
  DateTime updatedAt;
  Id id;

  factory District.fromJson(Map<String, dynamic> json) => District(
    villages: List<Village>.from(json["villages"].map((x) => Village.fromJson(x))),
    districtName: json["districtName"],
    districtCode: json["districtCode"],
    stateId: stateIdValues.map[json["stateId"]],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: idValues.map[json["id"]],
  );

  Map<String, dynamic> toJson() => {
    "villages": List<dynamic>.from(villages.map((x) => x.toJson())),
    "districtName": districtName,
    "districtCode": districtCode,
    "stateId": stateIdValues.reverse[stateId],
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": idValues.reverse[id],
  };
}

enum Id { THE_5_FB36_FB48_DD9_D92450_BC8_DE2 }

final idValues = EnumValues({
  "5fb36fb48dd9d92450bc8de2": Id.THE_5_FB36_FB48_DD9_D92450_BC8_DE2
});

enum StateId { THE_5_FB36_D305_C77_E241741859_F3 }

final stateIdValues = EnumValues({
  "5fb36d305c77e241741859f3": StateId.THE_5_FB36_D305_C77_E241741859_F3
});

class Village {
  Village({
    this.representatives,
    this.villageName,
    this.villagearea,
    this.areaUnit,
    this.villagePincode,
    this.blockCode,
    this.villageBlock,
    this.villageCountry,
    this.imagevillage,
    this.districtId,
    this.countryId,
    this.stateId,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  List<dynamic> representatives;
  String villageName;
  dynamic villagearea;
  String areaUnit;
  int villagePincode;
  String blockCode;
  VillageBlock villageBlock;
  VillageCountry villageCountry;
  String imagevillage;
  Id districtId;
  CountryId countryId;
  StateId stateId;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  factory Village.fromJson(Map<String, dynamic> json) => Village(
    representatives: List<dynamic>.from(json["representatives"].map((x) => x)),
    villageName: json["villageName"],
    villagearea: json["villagearea"],
    areaUnit: json["areaUnit"],
    villagePincode: json["villagePincode"],
    blockCode: json["blockCode"],
    villageBlock: villageBlockValues.map[json["villageBlock"]],
    villageCountry: villageCountryValues.map[json["villageCountry"]],
    imagevillage: json["imagevillage"],
    districtId: idValues.map[json["districtId"]],
    countryId: countryIdValues.map[json["countryId"]],
    stateId: stateIdValues.map[json["stateId"]],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "representatives": List<dynamic>.from(representatives.map((x) => x)),
    "villageName": villageName,
    "villagearea": villagearea,
    "areaUnit": areaUnit,
    "villagePincode": villagePincode,
    "blockCode": blockCode,
    "villageBlock": villageBlockValues.reverse[villageBlock],
    "villageCountry": villageCountryValues.reverse[villageCountry],
    "imagevillage": imagevillage,
    "districtId": idValues.reverse[districtId],
    "countryId": countryIdValues.reverse[countryId],
    "stateId": stateIdValues.reverse[stateId],
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": id,
  };
}

enum CountryId { THE_5_FB366_C349550340_B0_E2411_D }

final countryIdValues = EnumValues({
  "5fb366c349550340b0e2411d": CountryId.THE_5_FB366_C349550340_B0_E2411_D
});

enum VillageBlock { SHAHGANJ, BADLAPUR, MACHHLISHAHR, JAUNPUR, MARIAHU, KERAKAT }

final villageBlockValues = EnumValues({
  "Badlapur": VillageBlock.BADLAPUR,
  "Jaunpur ": VillageBlock.JAUNPUR,
  "Kerakat": VillageBlock.KERAKAT,
  "Machhlishahr": VillageBlock.MACHHLISHAHR,
  "Mariahu ": VillageBlock.MARIAHU,
  "Shahganj": VillageBlock.SHAHGANJ
});

enum VillageCountry { INDIA }

final villageCountryValues = EnumValues({
  "India": VillageCountry.INDIA
});

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
