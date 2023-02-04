//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel? loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel? data) => json.encode(data!.toJson());

class LoginModel {
  LoginModel({
    this.spId,
    this.param,
  });

  String? spId;
  Param? param;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    this.password,
  });

  String? userCode;
  String? companyId;
  String? password;

  factory Param.fromJson(Map<String, dynamic> json) => Param(
        userCode: json["UserCode"],
        companyId: json["CompanyId"],
        password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "UserCode": userCode,
        "CompanyId": companyId,
        "Password": password,
      };
}
