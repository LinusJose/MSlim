// To parse this JSON data, do
//
//     final waiverContractResponse = waiverContractResponseFromJson(jsonString);

import 'dart:convert';

WaiverContractResponse waiverContractResponseFromJson(String str) => WaiverContractResponse.fromJson(json.decode(str));

String waiverContractResponseToJson(WaiverContractResponse data) => json.encode(data.toJson());

class WaiverContractResponse {
    WaiverContractResponse({
        this.sessionId,
        this.errorCode,
        this.errorMessage,
        this.data,
    });

    dynamic sessionId;
    int? errorCode;
    String? errorMessage;
    Data? data;

    factory WaiverContractResponse.fromJson(Map<String, dynamic> json) => WaiverContractResponse(
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
    WaiverType? waiverType;
    FrtElement? frtElement;
    String? defaultWaiver;
    String? waiverValue;

    factory Table.fromJson(Map<String, dynamic> json) => Table(
        requestId: json["RequestId"],
        agent: json["Agent"],
        jobNo: json["JobNo"],
        ImportOrExport: json["ImportOrExport"],
        waiverType: waiverTypeValues.map[json["WaiverType"]]!,
        frtElement: frtElementValues.map[json["FrtElement"]]!,
        defaultWaiver: json["DefaultWaiver"],
        waiverValue: json["WaiverValue"],
    );

    Map<String, dynamic> toJson() => {
        "RequestId": requestId,
        "Agent": agent,
        "JobNo": jobNo,
        "ImportOrExport": ImportOrExportValues.reverse[ImportOrExport],
        "WaiverType": waiverTypeValues.reverse[waiverType],
        "FrtElement": frtElementValues.reverse[frtElement],
        "DefaultWaiver": defaultWaiver,
        "WaiverValue": waiverValue,
    };
}

enum FrtElement { POS, DET, ADV, DETD }

final frtElementValues = EnumValues({
    "ADV": FrtElement.ADV,
    "DET": FrtElement.DET,
    "DETD": FrtElement.DETD,
    "POS": FrtElement.POS
});

enum ImportOrExport { E, I }

final ImportOrExportValues = EnumValues({
    "E": ImportOrExport.E,
    "I": ImportOrExport.I
});

enum WaiverType { FREE_DAYS, LUMP_SUM, PERCENTAGE }

final waiverTypeValues = EnumValues({
    "FREE DAYS": WaiverType.FREE_DAYS,
    "LUMP SUM": WaiverType.LUMP_SUM,
    "PERCENTAGE": WaiverType.PERCENTAGE
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
