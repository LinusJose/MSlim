// To parse this JSON data, do
//
//     final loginModelResponse = loginModelResponseFromJson(jsonString);

import 'dart:convert';

LoginModelResponse loginModelResponseFromJson(String str) =>
    LoginModelResponse.fromJson(json.decode(str));

String loginModelResponseToJson(LoginModelResponse? data) =>
    json.encode(data!.toJson());

class LoginModelResponse {
  LoginModelResponse({
    this.sessionId,
    this.errorCode,
    this.errorMessage,
    required this.data,
  });

  dynamic sessionId;
  int? errorCode;
  String? errorMessage;
  Data data;

  factory LoginModelResponse.fromJson(Map<String, dynamic> json) =>
      LoginModelResponse(
        sessionId: json["SessionId"],
        errorCode: json["ErrorCode"],
        errorMessage: json["ErrorMessage"],
        data: Data.fromJson(json["Data"] ?? {}),
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
    this.table = const [],
    this.table1 = const [],
  });

  List<Table> table;
  List<Table1> table1;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        table: json["Table"] == null
            ? []
            : List<Table>.from(json["Table"]!.map((x) => Table.fromJson(x))),
        table1: json["Table1"] == null
            ? []
            : List<Table1>.from(json["Table1"]!.map((x) => Table1.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Table": table == null
            ? []
            : List<dynamic>.from(table.map((x) => x.toJson())),
        "Table1": table1 == null
            ? []
            : List<dynamic>.from(table1.map((x) => x.toJson())),
      };
}

class Table {
  Table({
    this.loginStatus = "",
    this.loginMsg = "",
  });

  String loginStatus;
  String loginMsg;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        loginStatus: json["LoginStatus"],
        loginMsg: json["LoginMsg"],
      );

  Map<String, dynamic> toJson() => {
        "LoginStatus": loginStatus,
        "LoginMsg": loginMsg,
      };
}

class Table1 {
  Table1({
    this.userId,
    this.userName,
    this.password,
    this.locationId,
    this.groupId,
  });

  int? userId;
  String? userName;
  String? password;
  int? locationId;
  int? groupId;

  factory Table1.fromJson(Map<String, dynamic> json) => Table1(
        userId: json["UserId"],
        userName: json["UserName"],
        password: json["Password"],
        locationId: json["LocationId"],
        groupId: json["GroupId"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "UserName": userName,
        "Password": password,
        "LocationId": locationId,
        "GroupId": groupId,
      };
}
