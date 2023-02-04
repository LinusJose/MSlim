// To parse this JSON data, do
//
//     final agentRefResponse = agentRefResponseFromJson(jsonString);

import 'dart:convert';

AgentRefResponse agentRefResponseFromJson(String str) => AgentRefResponse.fromJson(json.decode(str));

String agentRefResponseToJson(AgentRefResponse data) => json.encode(data.toJson());

class AgentRefResponse {
    AgentRefResponse({
        this.sessionId,
        this.errorCode,
        this.errorMessage,
        this.data,
    });

    dynamic sessionId;
    int? errorCode;
    String? errorMessage;
    Data? data;

    factory AgentRefResponse.fromJson(Map<String, dynamic> json) => AgentRefResponse(
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
        this.quotationNo,
        this.quotationRef="",
        this.quoteDate="",
        this.validTill="",
        this.agreementParty="",
        this.executive="",
        this.licd="",
        this.pol="",
        this.pod="",
        this.dicd="",
    });

    String? agentRef;
    int? quotationNo;
    String? quotationRef;
    String? quoteDate;
    String? validTill;
    String? agreementParty;
    String? executive;
    String? licd;
    String? pol;
    String? pod;
    String? dicd;

    factory Table.fromJson(Map<String, dynamic> json) => Table(
        agentRef: json["AgentRef"],
        quotationNo: json["QuotationNo"],
        quotationRef: json["QuotationRef"],
        quoteDate: json["QuoteDate"],
        validTill: json["ValidTill"],
        agreementParty: json["AgreementParty"],
        executive: json["Executive"],
        licd: json["LICD"],
        pol: json["POL"],
        pod: json["POD"],
        dicd: json["DICD"],
    );

    Map<String, dynamic> toJson() => {
        "AgentRef": agentRef,
        "QuotationNo": quotationNo,
        "QuotationRef": quotationRef,
        "QuoteDate": quoteDate,
        "ValidTill": validTill,
        "AgreementParty": agreementParty,
        "Executive": executive,
        "LICD": licd,
        "POL": pol,
        "POD": pod,
        "DICD": dicd,
    };
}
