// To parse this JSON data, do
//
//     final quotationListRequest = quotationListRequestFromJson(jsonString);

import 'dart:convert';

QuotationListRequest quotationListRequestFromJson(String str) => QuotationListRequest.fromJson(json.decode(str));

String quotationListRequestToJson(QuotationListRequest data) => json.encode(data.toJson());

class QuotationListRequest {
    QuotationListRequest({
        this.spId,
        this.param,
    });

    String? spId;
    Param? param;

    factory QuotationListRequest.fromJson(Map<String, dynamic> json) => QuotationListRequest(
        spId: json["SP_ID"],
        param: json["param"] == null ? null : Param.fromJson(json["param"]),
    );

    Map<String, dynamic> toJson() => {
        "SP_ID": spId,
        "param": param?.toJson(),
    };
}

class Param {
    Param({
        this.userCode,
        this.companyId,
    });

    String? userCode;
    String? companyId;

    factory Param.fromJson(Map<String, dynamic> json) => Param(
        userCode: json["UserCode"],
        companyId: json["CompanyId"],
    );

    Map<String, dynamic> toJson() => {
        "UserCode": userCode,
        "CompanyId": companyId,
    };
}
