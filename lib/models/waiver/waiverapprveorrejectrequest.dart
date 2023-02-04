// To parse this JSON data, do
//
//     final waiverApproveorRejectRequest = waiverApproveorRejectRequestFromJson(jsonString);

import 'dart:convert';

WaiverApproveorRejectRequest waiverApproveorRejectRequestFromJson(String str) => WaiverApproveorRejectRequest.fromJson(json.decode(str));

String waiverApproveorRejectRequestToJson(WaiverApproveorRejectRequest data) => json.encode(data.toJson());

class WaiverApproveorRejectRequest {
    WaiverApproveorRejectRequest({
        this.spId,
        this.param,
    });

    String? spId;
    Param? param;

    factory WaiverApproveorRejectRequest.fromJson(Map<String, dynamic> json) => WaiverApproveorRejectRequest(
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
        this.requestId,
        this.status,
        this.remarks,
    });

    String? userCode;
    String? requestId;
    String? status;
    String? remarks;

    factory Param.fromJson(Map<String, dynamic> json) => Param(
        userCode: json["UserCode"],
        requestId: json["RequestId"],
        status: json["Status"],
        remarks: json["Remarks"],
    );

    Map<String, dynamic> toJson() => {
        "UserCode": userCode,
        "RequestId": requestId,
        "Status": status,
        "Remarks": remarks,
    };
}
