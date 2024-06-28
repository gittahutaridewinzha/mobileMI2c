// To parse this JSON data, do
//
//     final modelRegisterEdu = modelRegisterEduFromJson(jsonString);

import 'dart:convert';

ModelRegisterEdu modelRegisterEduFromJson(String str) => ModelRegisterEdu.fromJson(json.decode(str));

String modelRegisterEduToJson(ModelRegisterEdu data) => json.encode(data.toJson());

class ModelRegisterEdu {
  int value;
  String message;

  ModelRegisterEdu({
    required this.value,
    required this.message,
  });

  factory ModelRegisterEdu.fromJson(Map<String, dynamic> json) => ModelRegisterEdu(
    value: json["value"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
  };
}
