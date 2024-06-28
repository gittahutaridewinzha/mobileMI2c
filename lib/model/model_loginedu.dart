// To parse this JSON data, do
//
//     final modelLoginEdu = modelLoginEduFromJson(jsonString);

import 'dart:convert';

ModelLoginEdu modelLoginEduFromJson(String str) => ModelLoginEdu.fromJson(json.decode(str));

String modelLoginEduToJson(ModelLoginEdu data) => json.encode(data.toJson());

class ModelLoginEdu {
  int value;
  String message;
  String username;
  String fullname;
  String id;
  String email;

  ModelLoginEdu({
    required this.value,
    required this.message,
    required this.username,
    required this.fullname,
    required this.id,
    required this.email,
  });

  factory ModelLoginEdu.fromJson(Map<String, dynamic> json) => ModelLoginEdu(
    value: json["value"],
    message: json["message"],
    username: json["username"],
    fullname: json["fullname"],
    id: json["id"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
    "username": username,
    "fullname": fullname,
    "id": id,
    "email": email,
  };
}
