// To parse this JSON data, do
//
//     final waiverContractlocationRequest = waiverContractlocationRequestFromJson(jsonString);

import 'dart:convert';

WaiverContractlocationRequest waiverContractlocationRequestFromJson(String str) => WaiverContractlocationRequest.fromJson(json.decode(str));

String waiverContractlocationRequestToJson(WaiverContractlocationRequest data) => json.encode(data.toJson());

class WaiverContractlocationRequest {
    WaiverContractlocationRequest({
        this.spId,
        this.param,
    });

    String? spId;
    Param? param;

    factory WaiverContractlocationRequest.fromJson(Map<String, dynamic> json) => WaiverContractlocationRequest(
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
