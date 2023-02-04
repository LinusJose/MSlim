// To parse this JSON data, do
//
//     final sampleHttpRequest = sampleHttpRequestFromJson(jsonString);

import 'dart:convert';

SampleHttpRequest? sampleHttpRequestFromJson(String str) =>
    SampleHttpRequest.fromJson(json.decode(str));

String sampleHttpRequestToJson(SampleHttpRequest? data) =>
    json.encode(data!.toJson());

class SampleHttpRequest {
  SampleHttpRequest({
    this.spId,
    this.param,
  });

  final String? spId;
  final Param? param;

  factory SampleHttpRequest.fromJson(Map<String, dynamic> json) =>
      SampleHttpRequest(
        spId: json["SP_ID"],
        param: json["param"],
      );

  Map<String, dynamic> toJson() => {
        "SP_ID": spId,
        "param": param,
      };
}

class Param {
  Param({
    this.type,
    this.value,
  });

  final String? type;
  final String? value;

  factory Param.fromJson(Map<String, dynamic> json) => Param(
        type: json["Type"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "Value": value,
      };
}
