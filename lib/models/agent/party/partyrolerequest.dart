// To parse this JSON data, do
//
//     final pendingRoleListingRequest = pendingRoleListingRequestFromJson(jsonString);

import 'dart:convert';

PendingRoleListingRequest pendingRoleListingRequestFromJson(String str) =>
    PendingRoleListingRequest.fromJson(json.decode(str));

String pendingRoleListingRequestToJson(PendingRoleListingRequest data) =>
    json.encode(data.toJson());

class PendingRoleListingRequest {
  PendingRoleListingRequest({
    required this.spId,
    required this.param,
  });

  String spId;
  Param param;

  factory PendingRoleListingRequest.fromJson(Map<String, dynamic> json) =>
      PendingRoleListingRequest(
        spId: json["SP_ID"],
        param: Param.fromJson(json["param"]),
      );

  Map<String, dynamic> toJson() => {
        "SP_ID": spId,
        "param": param.toJson(),
      };
}

class Param {
  Param({
    required this.userCode,
    required this.agent,
    required this.status,
    required this.partyId,
  });

  String userCode;
  String agent;
  String status;
  String partyId;

  factory Param.fromJson(Map<String, dynamic> json) => Param(
        userCode: json["UserCode"],
        agent: json["Agent"],
        status: json["Status"],
        partyId: json["PartyId"],
      );

  Map<String, dynamic> toJson() => {
        "UserCode": userCode,
        "Agent": agent,
        "Status": status,
        "PartyId": partyId,
      };
}
