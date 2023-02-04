// To parse this JSON data, do
//
//     final agentRefRequest = agentRefRequestFromJson(jsonString);

import 'dart:convert';

AgentRefRequest agentRefRequestFromJson(String str) =>
    AgentRefRequest.fromJson(json.decode(str));

String agentRefRequestToJson(AgentRefRequest data) =>
    json.encode(data.toJson());

class AgentRefRequest {
  AgentRefRequest({
    this.spId,
    this.param,
  });

  String? spId;
  Param? param;

  factory AgentRefRequest.fromJson(Map<String, dynamic> json) =>
      AgentRefRequest(
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
    this.status,
    this.agent,
    this.quotationNo,
  });

  String? userCode;
  String? status;
  String? agent;
  String? quotationNo;

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
