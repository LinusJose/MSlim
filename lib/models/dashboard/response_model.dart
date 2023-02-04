// To parse this JSON data, do
//
//     final dashBoardResponse = dashBoardResponseFromJson(jsonString);

import 'dart:convert';

DashBoardResponse dashBoardResponseFromJson(String str) =>
    DashBoardResponse.fromJson(json.decode(str));

String dashBoardResponseToJson(DashBoardResponse data) =>
    json.encode(data.toJson());

class DashBoardResponse {
  DashBoardResponse({
    this.sessionId,
    required this.errorCode,
    required this.errorMessage,
    required this.data,
  });

  dynamic sessionId;
  int errorCode;
  String errorMessage;
  Data data;

  factory DashBoardResponse.fromJson(Map<String, dynamic> json) =>
      DashBoardResponse(
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

  List<ResponceTable> table;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        table: List<ResponceTable>.from(
            json["Table"].map((x) => ResponceTable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Table": List<dynamic>.from(table.map((x) => x.toJson())),
      };
}

class ResponceTable {
  ResponceTable({
    required this.requestId,
    required this.requestType,
    required this.requestCount,
    required this.icon,
  });

  int requestId;
  String requestType;
  int requestCount;
  String icon;

  factory ResponceTable.fromJson(Map<String, dynamic> json) => ResponceTable(
        requestId: json["RequestId"],
        requestType: json["RequestType"],
        requestCount: json["RequestCount"],
        icon: json["Icon"],
      );

  Map<String, dynamic> toJson() => {
        "RequestId": requestId,
        "RequestType": requestType,
        "RequestCount": requestCount,
        "Icon": icon,
      };
}











// // To parse this JSON data, do
// //
// //     final dashBoardResponse = dashBoardResponseFromJson(jsonString);

// import 'dart:convert';

// DashBoardResponse dashBoardResponseFromJson(String str) =>
//     DashBoardResponse.fromJson(json.decode(str));

// String dashBoardResponseToJson(DashBoardResponse data) =>
//     json.encode(data.toJson());

// class DashBoardResponse {
//   DashBoardResponse({
//     this.sessionId = 0,
//     this.errorCode = 0,
//     this.errorMessage = '',
//     required this.data,
//   });

//   dynamic sessionId;
//   int errorCode;
//   String errorMessage;
//   Data data;

//   factory DashBoardResponse.fromJson(Map<String, dynamic> json) =>
//       DashBoardResponse(
//         sessionId: json["SessionId"],
//         errorCode: json["ErrorCode"],
//         errorMessage: json["ErrorMessage"],
//         data: Data.fromJson(json["Data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "SessionId": sessionId,
//         "ErrorCode": errorCode,
//         "ErrorMessage": errorMessage,
//         "Data": data.toJson(),
//       };
// }

// class Data {
//   Data({required this.table});

//   List<ResponceTable> table;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         table: json["Table"] == null
//             ? []
//             : List<ResponceTable>.from(
//                 json["Table"]!.map((x) => ResponceTable.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "Table": table == null
//             ? []
//             : List<dynamic>.from(table.map((x) => x.toJson())),
//       };
// }

// class ResponceTable {
//   ResponceTable({
//     this.requestId = 0,
//     this.requestType = '',
//     this.requestCount = 0,
//   });

//   int requestId;
//   String requestType;
//   int requestCount;

//   factory ResponceTable.fromJson(Map<String, dynamic> json) => ResponceTable(
//         requestId: json["RequestId"],
//         requestType: json["RequestType"],
//         requestCount: json["RequestCount"],
//       );

//   Map<String, dynamic> toJson() => {
//         "RequestId": requestId,
//         "RequestType": requestType,
//         "RequestCount": requestCount,
//       };
// }
