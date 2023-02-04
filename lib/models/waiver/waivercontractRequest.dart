// To parse this JSON data, do
//
//     final waiverContractRequest = waiverContractRequestFromJson(jsonString);

import 'dart:convert';

WaiverContractRequest waiverContractRequestFromJson(String str) => WaiverContractRequest.fromJson(json.decode(str));

String waiverContractRequestToJson(WaiverContractRequest data) => json.encode(data.toJson());

class WaiverContractRequest {
    WaiverContractRequest({
        this.spId,
        this.param,
    });

    String? spId;
    Param? param;

    factory WaiverContractRequest.fromJson(Map<String, dynamic> json) => WaiverContractRequest(
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
