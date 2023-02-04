// To parse this JSON data, do
//
//     final partymasterdetailsrequest = partymasterdetailsrequestFromJson(jsonString);

import 'dart:convert';

Partymasterdetailsrequest partymasterdetailsrequestFromJson(String str) =>
    Partymasterdetailsrequest.fromJson(json.decode(str));

String partymasterdetailsrequestToJson(Partymasterdetailsrequest data) =>
    json.encode(data.toJson());

class Partymasterdetailsrequest {
  Partymasterdetailsrequest({
    required this.spId,
    required this.param,
  });

  String spId;
  Param param;

  factory Partymasterdetailsrequest.fromJson(Map<String, dynamic> json) =>
      Partymasterdetailsrequest(
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
