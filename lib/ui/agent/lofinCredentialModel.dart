// To parse this JSON data, do
//
//     final loginCredentials = loginCredentialsFromJson(jsonString);

import 'dart:convert';

LoginCredentials loginCredentialsFromJson(String str) => LoginCredentials.fromJson(json.decode(str));

String loginCredentialsToJson(LoginCredentials data) => json.encode(data.toJson());

class LoginCredentials {
    LoginCredentials({
        this.userId,
        this.userName,
        this.password,
        this.locationId,
        this.groupId,
    });

    String? userId;
    String? userName;
    String? password;
    String? locationId;
    String? groupId;

    factory LoginCredentials.fromJson(Map<String, dynamic> json) => LoginCredentials(
        userId: json["UserId"],
        userName: json["UserName"],
        password: json["Password"],
        locationId: json["LocationId"],
        groupId: json["GroupId"],
    );

    Map<String, dynamic> toJson() => {
        "UserId": userId,
        "UserName": userName,
        "Password": password,
        "LocationId": locationId,
        "GroupId": groupId,
    };
}
