// To parse this JSON data, do
//
//     final waiverContractDetailsResponse = waiverContractDetailsResponseFromJson(jsonString);

import 'dart:convert';

WaiverContractDetailsResponse waiverContractDetailsResponseFromJson(String str) => WaiverContractDetailsResponse.fromJson(json.decode(str));

String waiverContractDetailsResponseToJson(WaiverContractDetailsResponse data) => json.encode(data.toJson());

class WaiverContractDetailsResponse {
    WaiverContractDetailsResponse({
        this.sessionId,
        this.errorCode,
        this.errorMessage,
        this.data,
    });

    dynamic sessionId;
    int? errorCode;
    String? errorMessage;
    Data? data;

    factory WaiverContractDetailsResponse.fromJson(Map<String, dynamic> json) => WaiverContractDetailsResponse(
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
      required  this.table,
    });

    Table table;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
       table: Table.fromJson(json["Table"] ?? []),
    );

    Map<String, dynamic> toJson() => {
       "Table": List<dynamic>.from({}),
    };
}

// class Table {
//     Table({
//         this.requestId,
//         this.agent,
//         this.jobNo,
//         this.ImportOrExport,
//         this.subJobNo,
//         this.agreementParty,
//         this.refNo,
//         this.pol,
//         this.pod,
//         this.fromDate,
//         this.toDate,
//         this.frtElement,
//         this.defaultWaiver,
//         this.waiverType,
//         this.waiverValue,
//         this.remarks,
//         this.requestedBy,
//     });

//     int? requestId;
//     String? agent;
//     int? jobNo;
//     String? ImportOrExport;
//     String? subJobNo;
//     String? agreementParty;
//     String? refNo;
//     String? pol;
//     String? pod;
//     DateTime? fromDate;
//     DateTime? toDate;
//     String? frtElement;
//     String? defaultWaiver;
//     String? waiverType;
//     String? waiverValue;
//     String? remarks;
//     String? requestedBy;

//     factory Table.fromJson(Map<String, dynamic> json) => Table(
//         requestId: json["RequestId"],
//         agent: json["Agent"],
//         jobNo: json["JobNo"],
//         ImportOrExport: json["ImportOrExport"],
//         subJobNo: json["SubJobNo"],
//         agreementParty: json["AgreementParty"],
//         refNo: json["RefNo"],
//         pol: json["POL"],
//         pod: json["POD"],
//         fromDate: json["FromDate"] == null ? null : DateTime.parse(json["FromDate"]),
//         toDate: json["ToDate"] == null ? null : DateTime.parse(json["ToDate"]),
//         frtElement: json["FrtElement"],
//         defaultWaiver: json["DefaultWaiver"],
//         waiverType: json["WaiverType"],
//         waiverValue: json["WaiverValue"],
//         remarks: json["Remarks"],
//         requestedBy: json["RequestedBy"],
//     );

//     Map<String, dynamic> toJson() => {
//         "RequestId": requestId,
//         "Agent": agent,
//         "JobNo": jobNo,
//         "ImportOrExport": ImportOrExport,
//         "SubJobNo": subJobNo,
//         "AgreementParty": agreementParty,
//         "RefNo": refNo,
//         "POL": pol,
//         "POD": pod,
//         "FromDate": fromDate?.toIso8601String(),
//         "ToDate": toDate?.toIso8601String(),
//         "FrtElement": frtElement,
//         "DefaultWaiver": defaultWaiver,
//         "WaiverType": waiverType,
//         "WaiverValue": waiverValue,
//         "Remarks": remarks,
//         "RequestedBy": requestedBy,
//     };
// }


class Element {
  Element({
    required this.title,
    required this.value,
  });
  String title;
  String value;
}

class Table {
  Table({
    required this.element,
  });
  List<Element> element;
  factory Table.fromJson(List<dynamic> json) {
    Map map = json[0];
    List keyList = map.keys.toList();
    List valueList = map.values.toList();
    return Table(
        element: List<Element>.generate(keyList.length, (index) {
      return Element(
          title: keyList[index].toString(), value: valueList[index].toString());
    }));
  }
}