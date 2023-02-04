// To parse this JSON data, do
//
//     final partymasterdetailsbylocation = partymasterdetailsbylocationFromJson(jsonString);

import 'dart:convert';

Partymasterdetailsbylocation partymasterdetailsbylocationFromJson(String str) =>
    Partymasterdetailsbylocation.fromJson(json.decode(str));

String partymasterdetailsbylocationToJson(Partymasterdetailsbylocation data) =>
    json.encode(data.toJson());

class Partymasterdetailsbylocation {
  Partymasterdetailsbylocation({
    required this.spId,
    required this.param,
  });

  String spId;
  Param param;

  factory Partymasterdetailsbylocation.fromJson(Map<String, dynamic> json) =>
      Partymasterdetailsbylocation(
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
