// To parse this JSON data, do
//
//     final quotationRequest = quotationRequestFromJson(jsonString);

import 'dart:convert';

QuotationRequest? quotationRequestFromJson(String str) => QuotationRequest.fromJson(json.decode(str));

String quotationRequestToJson(QuotationRequest? data) => json.encode(data!.toJson());

class QuotationRequest {
    QuotationRequest({
        this.spId,
        this.param,
    });

    final String? spId;
    final Param? param;

    factory QuotationRequest.fromJson(Map<String, dynamic> json) => QuotationRequest(
        spId: json["SP_ID"],
        param: json["param"],
    );

    Map<String, dynamic> toJson() => {
        "SP_ID": spId,
        "param": param,
    };
}

class Param {
    Param({
        this.userCode,
        this.status,
        this.agent,
        this.quotationNo,
    });

    final String? userCode;
    final String? status;
    final String? agent;
    final String? quotationNo;

    factory Param.fromJson(Map<String, dynamic> json) => Param(
        userCode: json["UserCode"],
        status: json["Status"],
        agent: json["Agent"],
        quotationNo: json["QuotationNo"],
    );

    Map<String, dynamic> toJson() => {
        "UserCode": userCode,
        "Status": status,
        "Agent": agent,
        "QuotationNo": quotationNo,
    };
}
