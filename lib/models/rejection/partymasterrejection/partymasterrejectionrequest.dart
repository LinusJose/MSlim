// To parse this JSON data, do
//
//     final partymasterdetailsrejectrequest = partymasterdetailsrejectrequestFromJson(jsonString);

import 'dart:convert';

Partymasterdetailsrejectrequest partymasterdetailsrejectrequestFromJson(
        String str) =>
    Partymasterdetailsrejectrequest.fromJson(json.decode(str));

String partymasterdetailsrejectrequestToJson(
        Partymasterdetailsrejectrequest data) =>
    json.encode(data.toJson());

class Partymasterdetailsrejectrequest {
  Partymasterdetailsrejectrequest({
    required this.spId,
    required this.param,
  });

  String spId;
  Param param;

  factory Partymasterdetailsrejectrequest.fromJson(Map<String, dynamic> json) =>
      Partymasterdetailsrejectrequest(
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
