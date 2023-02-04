// To parse this JSON data, do
//
//     final waiverContractlocationResponse = waiverContractlocationResponseFromJson(jsonString);

import 'dart:convert';

WaiverContractlocationResponse waiverContractlocationResponseFromJson(String str) => WaiverContractlocationResponse.fromJson(json.decode(str));

String waiverContractlocationResponseToJson(WaiverContractlocationResponse data) => json.encode(data.toJson());

class WaiverContractlocationResponse {
    WaiverContractlocationResponse({
        this.sessionId,
        this.errorCode,
        this.errorMessage,
        this.data,
    });

    dynamic sessionId;
    int? errorCode;
    String? errorMessage;
    Data? data;

    factory WaiverContractlocationResponse.fromJson(Map<String, dynamic> json) => WaiverContractlocationResponse(
        sessionId: json["SessionId"],
        errorCode: json["ErrorCode"],
        errorMessage: json["ErrorMessage"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
    );

    Map<String, dynamic> toJson() => {
        "SessionId": sessionId,
        "ErrorCode": errorCode,
        "ErrorMessage": errorMessage,
        "Data": data?.toJson(),
    };
}

class Data {
    Data({
        this.table,
    });

    List<Table>? table;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        table: json["Table"] == null ? [] : List<Table>.from(json["Table"]!.map((x) => Table.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Table": table == null ? [] : List<dynamic>.from(table!.map((x) => x.toJson())),
    };
}

class Table {
    Table({
        this.requestId,
        this.agent,
        this.jobNo,
        this.ImportOrExport,
        this.waiverType,
        this.frtElement,
        this.defaultWaiver,
        this.waiverValue,
    });

    int? requestId;
    String? agent;
    int? jobNo;
    String? ImportOrExport;
    String? waiverType;
    String? frtElement;
    String? defaultWaiver;
    String? waiverValue;

    factory Table.fromJson(Map<String, dynamic> json) => Table(
        requestId: json["RequestId"],
        agent: json["Agent"],
        jobNo: json["JobNo"],
        ImportOrExport: json["ImportOrExport"],
        waiverType: json["WaiverType"],
        frtElement: json["FrtElement"],
        defaultWaiver: json["DefaultWaiver"],
        waiverValue: json["WaiverValue"],
    );

    Map<String, dynamic> toJson() => {
        "RequestId": requestId,
        "Agent": agent,
        "JobNo": jobNo,
        "ImportOrExport": ImportOrExport,
        "WaiverType": waiverType,
        "FrtElement": frtElement,
        "DefaultWaiver": defaultWaiver,
        "WaiverValue": waiverValue,
    };
}
