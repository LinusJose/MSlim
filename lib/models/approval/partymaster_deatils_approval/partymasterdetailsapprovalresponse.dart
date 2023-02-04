// To parse this JSON data, do
//
//     final partymasterdetailsapprovalresponse = partymasterdetailsapprovalresponseFromJson(jsonString);

import 'dart:convert';

Partymasterdetailsapprovalresponse partymasterdetailsapprovalresponseFromJson(
        String str) =>
    Partymasterdetailsapprovalresponse.fromJson(json.decode(str));

String partymasterdetailsapprovalresponseToJson(
        Partymasterdetailsapprovalresponse data) =>
    json.encode(data.toJson());

class Partymasterdetailsapprovalresponse {
  Partymasterdetailsapprovalresponse({
    this.sessionId,
    required this.errorCode,
    required this.errorMessage,
    required this.data,
  });

  dynamic sessionId;
  int errorCode;
  String errorMessage;
  Data data;

  factory Partymasterdetailsapprovalresponse.fromJson(
          Map<String, dynamic> json) =>
      Partymasterdetailsapprovalresponse(
        sessionId: json["SessionId"] ?? "",
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
        table: List<Table>.from(json["Table"] != null
            ? json["Table"].map((x) => Table.fromJson(x))
            : []),
      );

  Map<String, dynamic> toJson() => {
        "Table": List<dynamic>.from(table.map((x) => x.toJson())),
      };
}

class Table {
  Table({
    required this.status,
  });

  String status;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
      };
}
