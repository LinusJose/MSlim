// To parse this JSON data, do
//
//     final menuitemresponse = menuitemresponseFromJson(jsonString);

import 'dart:convert';

Menuitemresponse? menuitemresponseFromJson(String str) =>
    Menuitemresponse.fromJson(json.decode(str));

String menuitemresponseToJson(Menuitemresponse? data) =>
    json.encode(data!.toJson());

class Menuitemresponse {
  Menuitemresponse({
    this.sessionId,
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  dynamic sessionId;
  int? errorCode;
  String? errorMessage;
  Data? data;

  factory Menuitemresponse.fromJson(Map<String, dynamic> json) =>
      Menuitemresponse(
        sessionId: json["SessionId"],
        errorCode: json["ErrorCode"],
        errorMessage: json["ErrorMessage"],
        data: Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "SessionId": sessionId,
        "ErrorCode": errorCode,
        "ErrorMessage": errorMessage,
        "Data": data!.toJson(),
      };
}

class Data {
  Data({
    this.table,
  });

  List<Table?>? table;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        table: json["Table"] == null
            ? []
            : List<Table?>.from(json["Table"]!.map((x) => Table.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Table": table == null
            ? []
            : List<dynamic>.from(table!.map((x) => x!.toJson())),
      };
}

class Table {
  Table({
    this.requestId,
    this.requestType,
    this.requestCount,
  });

  int? requestId;
  String? requestType;
  int? requestCount;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        requestId: json["RequestId"],
        requestType: json["RequestType"],
        requestCount: json["RequestCount"],
      );

  Map<String, dynamic> toJson() => {
        "RequestId": requestId,
        "RequestType": requestType,
        "RequestCount": requestCount,
      };
}
