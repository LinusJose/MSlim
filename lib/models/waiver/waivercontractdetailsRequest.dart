// To parse this JSON data, do
//
//     final waiverContractDetailsRequest = waiverContractDetailsRequestFromJson(jsonString);

import 'dart:convert';

WaiverContractDetailsRequest waiverContractDetailsRequestFromJson(String str) => WaiverContractDetailsRequest.fromJson(json.decode(str));

String waiverContractDetailsRequestToJson(WaiverContractDetailsRequest data) => json.encode(data.toJson());

class WaiverContractDetailsRequest {
    WaiverContractDetailsRequest({
        this.spId,
        this.param,
    });

    String? spId;
    Param? param;

    factory WaiverContractDetailsRequest.fromJson(Map<String, dynamic> json) => WaiverContractDetailsRequest(
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
        this.agent,
        this.status,
        this.requestId,
    });

    String? userCode;
    String? agent;
    String? status;
    String? requestId;

    factory Param.fromJson(Map<String, dynamic> json) => Param(
        userCode: json["UserCode"],
        agent: json["Agent"],
        status: json["Status"],
        requestId: json["RequestId"],
    );

    Map<String, dynamic> toJson() => {
        "UserCode": userCode,
        "Agent": agent,
        "Status": status,
        "RequestId": requestId,
    };
}
