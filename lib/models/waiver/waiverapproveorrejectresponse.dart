// To parse this JSON data, do
//
//     final quotationApprovalResponse = quotationApprovalResponseFromJson(jsonString);

import 'dart:convert';

waiverApproveorRejectResponse waiverApproveorRejectResponseFromJson(String str) => waiverApproveorRejectResponse.fromJson(json.decode(str));

String waiverApproveorRejectResponseToJson(waiverApproveorRejectResponse data) => json.encode(data.toJson());

class waiverApproveorRejectResponse {
    waiverApproveorRejectResponse({
        this.sessionId,
        this.errorCode,
        this.errorMessage,
        this.data,
    });

    dynamic sessionId;
    int? errorCode;
    String? errorMessage;
    Data? data;

    factory waiverApproveorRejectResponse.fromJson(Map<String, dynamic> json) => waiverApproveorRejectResponse(
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
        this.status,
    });

    String? status;

    factory Table.fromJson(Map<String, dynamic> json) => Table(
        status: json["Status"],
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
    };
}
