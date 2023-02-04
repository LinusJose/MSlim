// To parse this JSON data, do
//
//     final quotationApprovalRequest = quotationApprovalRequestFromJson(jsonString);

import 'dart:convert';

QuotationApprovalRequest quotationApprovalRequestFromJson(String str) => QuotationApprovalRequest.fromJson(json.decode(str));

String quotationApprovalRequestToJson(QuotationApprovalRequest data) => json.encode(data.toJson());

class QuotationApprovalRequest {
    QuotationApprovalRequest({
        this.spId,
        this.param,
    });

    String? spId;
    Param? param;

    factory QuotationApprovalRequest.fromJson(Map<String, dynamic> json) => QuotationApprovalRequest(
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
        this.quotationNo,
        this.status,
        this.remarks,
    });

    String? userCode;
    String? quotationNo;
    String? status;
    String? remarks;

    factory Param.fromJson(Map<String, dynamic> json) => Param(
        userCode: json["UserCode"],
        quotationNo: json["QuotationNo"],
        status: json["Status"],
        remarks: json["Remarks"],
    );

    Map<String, dynamic> toJson() => {
        "UserCode": userCode,
        "QuotationNo": quotationNo,
        "Status": status,
        "Remarks": remarks,
    };
}
