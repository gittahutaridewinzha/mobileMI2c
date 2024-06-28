import 'dart:convert';

ModelLogin modelLoginFromJson(String str) => ModelLogin.fromJson(json.decode(str));

String modelLoginToJson(ModelLogin data) => json.encode(data.toJson());

class ModelLogin {
  ModelLogin({
    required this.value,
    required this.id,
    required this.username,
    required this.message,
  });

  int value;
  String id;
  String username;
  String message;

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
    value: json["value"] ?? 0,
    id: json["id"] ?? "",
    username: json["username"] ?? "",
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "id": id,
    "username": username,
    "message": message,
  };
}
