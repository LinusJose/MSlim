import 'dart:convert';

Menuitemrequest? menuitemrequestFromJson(String str) =>
    Menuitemrequest.fromJson(json.decode(str));

String menuitemrequestToJson(Menuitemrequest? data) =>
    json.encode(data!.toJson());

class Menuitemrequest {
  Menuitemrequest({
    this.spId,
    this.param,
  });

  String? spId;
  Param? param;

  factory Menuitemrequest.fromJson(Map<String, dynamic> json) =>
      Menuitemrequest(
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
