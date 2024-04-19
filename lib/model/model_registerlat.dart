// To parse this JSON data, do
//
//     final modelRegisterEdukasi = modelRegisterEdukasiFromJson(jsonString);

import 'dart:convert';

ModelRegisterEdukasi modelRegisterEdukasiFromJson(String str) => ModelRegisterEdukasi.fromJson(json.decode(str));

String modelRegisterEdukasiToJson(ModelRegisterEdukasi data) => json.encode(data.toJson());

class ModelRegisterEdukasi {
  int value;
  String message;

  ModelRegisterEdukasi({
    required this.value,
    required this.message,
  });

  factory ModelRegisterEdukasi.fromJson(Map<String, dynamic> json) => ModelRegisterEdukasi(
    value: json["value"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
  };
}
