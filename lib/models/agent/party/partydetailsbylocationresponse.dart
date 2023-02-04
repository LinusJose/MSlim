// To parse this JSON data, do
//
//     final partymasterdetailsbylocationresponse = partymasterdetailsbylocationresponseFromJson(jsonString);

import 'dart:convert';

Partymasterdetailsbylocationresponse
    partymasterdetailsbylocationresponseFromJson(String str) =>
        Partymasterdetailsbylocationresponse.fromJson(json.decode(str));

String partymasterdetailsbylocationresponseToJson(
        Partymasterdetailsbylocationresponse data) =>
    json.encode(data.toJson());

class Partymasterdetailsbylocationresponse {
  Partymasterdetailsbylocationresponse({
    this.sessionId,
    required this.errorCode,
    required this.errorMessage,
    required this.data,
  });

  dynamic sessionId;
  int errorCode;
  String errorMessage;
  Data data;

  factory Partymasterdetailsbylocationresponse.fromJson(
          Map<String, dynamic> json) =>
      Partymasterdetailsbylocationresponse(
        sessionId: json["SessionId"]??"",
        errorCode: json["ErrorCode"],
        errorMessage: json["ErrorMessage"],
        data: Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "SessionId": sessionId,
        "ErrorCode": errorCode,
        "ErrorMessage": errorMessage,
        "Data": data.toJson(),
      };
}

class Data {
  Data({
    required this.table,
  });

  List<Table> table;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        table: List<Table>.from(json["Table"]!=null?json["Table"].map((x) => Table.fromJson(x)):[]),
      );

  Map<String, dynamic> toJson() => {
        "Table": List<dynamic>.from(table.map((x) => x.toJson())),
      };
}

class Table {
  Table({
     this.name="",
     this.address1="",
     this.address2="",
     this.city="",
     required this.country,
     this.contactPerson="",
    required this.executive,
    required this.agentRef,
     this.partyId=0,
  });

  String name;
  String address1;
  String address2;
  String city;
  Country country;
  String contactPerson;
  Executive executive;
  AgentRef agentRef;
  int partyId;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        name: json["Name"],
        address1: json["Address1"],
        address2: json["Address2"],
        city: json["City"],
        country: countryValues.map[json["Country"]]!,
        contactPerson: json["ContactPerson"],
        executive: executiveValues.map[json["Executive"]]!,
        agentRef: agentRefValues.map[json["AgentRef"]]!,
        partyId: json["PartyId"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Address1": address1,
        "Address2": address2,
        "City": city,
        "Country": countryValues.reverse[country],
        "ContactPerson": contactPerson,
        "Executive": executiveValues.reverse[executive],
        "AgentRef": agentRefValues.reverse[agentRef],
        "PartyId": partyId,
      };
}

enum AgentRef { INBOM01 }

final agentRefValues = EnumValues({"INBOM01": AgentRef.INBOM01});

enum Country { INDIA, MYANMAR, BANGLADESH, INDONESIA, SINGAPORE }

final countryValues = EnumValues({
  "BANGLADESH": Country.BANGLADESH,
  "INDIA": Country.INDIA,
  "INDONESIA": Country.INDONESIA,
  "MYANMAR": Country.MYANMAR,
  "SINGAPORE": Country.SINGAPORE
});

enum Executive { JAISHREE, SANDESH, CCDESKBOM, DOCSBOM, SHWETA, PADMA }

final executiveValues = EnumValues({
  "CCDESKBOM": Executive.CCDESKBOM,
  "DOCSBOM": Executive.DOCSBOM,
  "JAISHREE": Executive.JAISHREE,
  "PADMA": Executive.PADMA,
  "SANDESH": Executive.SANDESH,
  "SHWETA": Executive.SHWETA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
