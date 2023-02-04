// To parse this JSON data, do
//
//     final partymasterdetailsapprovalrequest = partymasterdetailsapprovalrequestFromJson(jsonString);

import 'dart:convert';

Partymasterdetailsapprovalrequest partymasterdetailsapprovalrequestFromJson(
        String str) =>
    Partymasterdetailsapprovalrequest.fromJson(json.decode(str));

String partymasterdetailsapprovalrequestToJson(
        Partymasterdetailsapprovalrequest data) =>
    json.encode(data.toJson());

class Partymasterdetailsapprovalrequest {
  Partymasterdetailsapprovalrequest({
    required this.spId,
    required this.param,
  });

  String spId;
  Param param;

  factory Partymasterdetailsapprovalrequest.fromJson(
          Map<String, dynamic> json) =>
      Partymasterdetailsapprovalrequest(
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
    required this.partyId,
    required this.status,
    required this.remarks,
  });

  String userCode;
  String partyId;
  String status;
  String remarks;

  factory Param.fromJson(Map<String, dynamic> json) => Param(
        userCode: json["UserCode"],
        partyId: json["PartyId"],
        status: json["Status"],
        remarks: json["Remarks"],
      );

  Map<String, dynamic> toJson() => {
        "UserCode": userCode,
        "PartyId": partyId,
        "Status": status,
        "Remarks": remarks,
      };
}
