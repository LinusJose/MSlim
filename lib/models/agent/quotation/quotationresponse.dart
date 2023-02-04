// To parse this JSON data, do
//
//     final quotationListResponse = quotationListResponseFromJson(jsonString);

import 'dart:convert';

QuotationListResponse quotationListResponseFromJson(String str) => QuotationListResponse.fromJson(json.decode(str));

String quotationListResponseToJson(QuotationListResponse data) => json.encode(data.toJson());

class QuotationListResponse {
    QuotationListResponse({
        this.sessionId,
        this.errorCode,
        this.errorMessage,
        this.data,
    });

    dynamic sessionId;
    int? errorCode;
    String? errorMessage;
    Data? data;

    factory QuotationListResponse.fromJson(Map<String, dynamic> json) => QuotationListResponse(
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
        this.agentRef="",
        this.agentName="",
        this.address1="",
        this.address2="",
        this.city="",
        this.state="",
        this.countryName="",
        this.contactPerson1="",
        this.contactEmail1="",
    });

    String? agentRef;
    String? agentName;
    String? address1;
    String? address2;
    String? city;
    String? state;
    String? countryName;
    String? contactPerson1;
    String? contactEmail1;

    factory Table.fromJson(Map<String, dynamic> json) => Table(
        agentRef: json["AgentRef"],
        agentName: json["AgentName"],
        address1: json["Address1"],
        address2: json["Address2"],
        city: json["City"],
        state: json["State"],
        countryName: json["CountryName"],
        contactPerson1: json["ContactPerson1"],
        contactEmail1: json["ContactEmail1"],
    );

    Map<String, dynamic> toJson() => {
        "AgentRef": agentRef,
        "AgentName": agentName,
        "Address1": address1,
        "Address2": address2,
        "City": city,
        "State": state,
        "CountryName": countryName,
        "ContactPerson1": contactPerson1,
        "ContactEmail1": contactEmail1,
    };
}
