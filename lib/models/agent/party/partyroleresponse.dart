// To parse this JSON data, do
//
//     final pendingPartyMasterListingResponse = pendingPartyMasterListingResponseFromJson(jsonString);

import 'dart:convert';

PendingPartyMasterListingResponse pendingPartyMasterListingResponseFromJson(
        String str) =>
    PendingPartyMasterListingResponse.fromJson(json.decode(str));

String pendingPartyMasterListingResponseToJson(
        PendingPartyMasterListingResponse data) =>
    json.encode(data.toJson());

class PendingPartyMasterListingResponse {
  PendingPartyMasterListingResponse({
    this.sessionId,
    required this.errorCode,
    required this.errorMessage,
    required this.data,
  });

  dynamic sessionId;
  int errorCode;
  String errorMessage;
  Data data;

  factory PendingPartyMasterListingResponse.fromJson(
          Map<String, dynamic> json) =>
      PendingPartyMasterListingResponse(
        sessionId: json["SessionId"],
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
        table: List<Table>.from(json["Table"].map((x) => Table.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Table": List<dynamic>.from(table.map((x) => x.toJson())),
      };
}

class Table {
  Table({
    required this.name,
    required this.address,
    required this.city,
    this.country,
    required this.contactPerson,
    required this.executive,
    required this.agentRef,
    required this.partyId,
  });

  String name;
  String address;
  String city;
  Country? country;
  String contactPerson;
  String executive;
  String agentRef;
  int partyId;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        name: json["Name"],
        address: json["Address"],
        city: json["City"],
        country: countryValues.map[json["Country"]],
        contactPerson: json["ContactPerson"],
        executive: json["Executive"],
        agentRef: json["AgentRef"],
        partyId: json["PartyId"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Address": address,
        "City": city,
        "Country": countryValues.reverse[country],
        "ContactPerson": contactPerson,
        "Executive": executive,
        "AgentRef": agentRef,
        "PartyId": partyId,
      };
}

enum Country {
  BANGLADESH,
  INDIA,
  SINGAPORE,
  UNITED_ARAB_EMIRATES,
  MALAYSIA,
  MYANMAR,
  PAKISTAN,
  JORDAN,
  THAILAND,
  SRI_LANKA,
  CHINA,
  OMAN,
  INDONESIA,
  QATAR,
  NEPAL
}

final countryValues = EnumValues({
  "BANGLADESH": Country.BANGLADESH,
  "CHINA": Country.CHINA,
  "INDIA": Country.INDIA,
  "INDONESIA": Country.INDONESIA,
  "JORDAN": Country.JORDAN,
  "MALAYSIA": Country.MALAYSIA,
  "MYANMAR": Country.MYANMAR,
  "NEPAL": Country.NEPAL,
  "OMAN": Country.OMAN,
  "PAKISTAN": Country.PAKISTAN,
  "QATAR": Country.QATAR,
  "SINGAPORE": Country.SINGAPORE,
  "SRI LANKA": Country.SRI_LANKA,
  "THAILAND": Country.THAILAND,
  "UNITED ARAB EMIRATES": Country.UNITED_ARAB_EMIRATES
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
