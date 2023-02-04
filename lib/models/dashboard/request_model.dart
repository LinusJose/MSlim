// To parse this JSON data, do
//
//     final dashBoardRequest = dashBoardRequestFromJson(jsonString);

import 'dart:convert';

DashBoardRequest? dashBoardRequestFromJson(String str) =>
    DashBoardRequest.fromJson(json.decode(str));

String dashBoardRequestToJson(DashBoardRequest? data) =>
    json.encode(data!.toJson());

class DashBoardRequest {
  DashBoardRequest({
    this.spId,
    this.param,
  });

  String? spId;
  Param? param;

  factory DashBoardRequest.fromJson(Map<String, dynamic> json) =>
      DashBoardRequest(
        spId: json["SP_ID"],
        param: Param.fromJson(json["param"]),
      );

  Map<String, dynamic> toJson() => {
        "SP_ID": spId,
        "param": param!.toJson(),
      };
}

class Param {
  Param({
    this.userCode,
    this.companyId,
  });

  String? userCode;
  String? companyId;

  factory Param.fromJson(Map<String, dynamic> json) => Param(
        userCode: json["UserCode"],
        companyId: json["CompanyId"],
      );

  Map<String, dynamic> toJson() => {
        "UserCode": userCode,
        "CompanyId": companyId,
      };
}
