// To parse this JSON data, do
//
//     final sampleHttpResponse = sampleHttpResponseFromJson(jsonString);

import 'dart:convert';

SampleHttpResponse sampleHttpResponseFromJson(String str) =>
    SampleHttpResponse.fromJson(json.decode(str));

String sampleHttpResponseToJson(SampleHttpResponse? data) =>
    json.encode(data!.toJson());

class SampleHttpResponse {
  SampleHttpResponse({
    this.sessionId,
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  final dynamic sessionId;
  final int? errorCode;
  final String? errorMessage;
  final Data? data;

  factory SampleHttpResponse.fromJson(Map<String, dynamic> json) =>
      SampleHttpResponse(
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
    this.table1,
    this.table2,
  });

  final List<Table?>? table;
  final List<Table1?>? table1;
  final List<Table2?>? table2;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        table: json["Table"] == null
            ? []
            : json["Table"] == null
                ? []
                : List<Table?>.from(
                    json["Table"]!.map((x) => Table.fromJson(x))),
        table1: json["Table1"] == null
            ? []
            : json["Table1"] == null
                ? []
                : List<Table1?>.from(
                    json["Table1"]!.map((x) => Table1.fromJson(x))),
        table2: json["Table2"] == null
            ? []
            : json["Table2"] == null
                ? []
                : List<Table2?>.from(
                    json["Table2"]!.map((x) => Table2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Table": table == null
            ? []
            : table == null
                ? []
                : List<dynamic>.from(table!.map((x) => x!.toJson())),
        "Table1": table1 == null
            ? []
            : table1 == null
                ? []
                : List<dynamic>.from(table1!.map((x) => x!.toJson())),
        "Table2": table2 == null
            ? []
            : table2 == null
                ? []
                : List<dynamic>.from(table2!.map((x) => x!.toJson())),
      };
}

class Table {
  Table({
    this.containerNo,
    this.currentPort,
    this.currentStatus,
    this.date,
  });

  final String? containerNo;
  final String? currentPort;
  final String? currentStatus;
  final String? date;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        containerNo: json["CONTAINER NO"],
        currentPort: json["CURRENT PORT"],
        currentStatus: json["CURRENT STATUS"],
        date: json["DATE"],
      );

  Map<String, dynamic> toJson() => {
        "CONTAINER NO": containerNo,
        "CURRENT PORT": currentPort,
        "CURRENT STATUS": currentStatus,
        "DATE": date,
      };
}

class Table1 {
  Table1({
    this.por,
    this.pol,
    this.pod,
    this.fpd,
    this.currentLocation,
    this.currentBl,
    this.vessel,
    this.voyage,
    this.sailDate,
    this.etaAtDestination,
  });

  final String? por;
  final String? pol;
  final String? pod;
  final String? fpd;
  final String? currentLocation;
  final String? currentBl;
  final String? vessel;
  final String? voyage;
  final String? sailDate;
  final String? etaAtDestination;

  factory Table1.fromJson(Map<String, dynamic> json) => Table1(
        por: json["POR"],
        pol: json["POL"],
        pod: json["POD"],
        fpd: json["FPD"],
        currentLocation: json["CURRENT LOCATION"],
        currentBl: json["CURRENT BL"],
        vessel: json["VESSEL"],
        voyage: json["VOYAGE"],
        sailDate: json["SAIL DATE"],
        etaAtDestination: json["ETA AT DESTINATION"],
      );

  Map<String, dynamic> toJson() => {
        "POR": por,
        "POL": pol,
        "POD": pod,
        "FPD": fpd,
        "CURRENT LOCATION": currentLocation,
        "CURRENT BL": currentBl,
        "VESSEL": vessel,
        "VOYAGE": voyage,
        "SAIL DATE": sailDate,
        "ETA AT DESTINATION": etaAtDestination,
      };
}

class Table2 {
  Table2({
    this.containerNo = "",
    this.location = "",
    this.portName = "",
    this.emscode = "",
    this.emscodeDescription = "",
    this.movedate = "",
    this.vesselName = "",
    this.voyage = "",
  });

  final String containerNo;
  final String location;
  final String portName;
  final String emscode;
  final String emscodeDescription;
  final String movedate;
  final String vesselName;
  final String voyage;

  factory Table2.fromJson(Map<String, dynamic> json) => Table2(
        containerNo: json["CONTAINER NO"],
        location: json["LOCATION"],
        portName: json["PORT NAME"],
        emscode: json["EMSCODE"],
        emscodeDescription: json["EMSCODE DESCRIPTION"],
        movedate: json["MOVEDATE"],
        vesselName: json["VESSEL NAME"],
        voyage: json["VOYAGE"],
      );

  Map<String, dynamic> toJson() => {
        "CONTAINER NO": containerNo,
        "LOCATION": location,
        "PORT NAME": portName,
        "EMSCODE": emscode,
        "EMSCODE DESCRIPTION": emscodeDescription,
        "MOVEDATE": movedate,
        "VESSEL NAME": vesselName,
        "VOYAGE": voyage,
      };
}
