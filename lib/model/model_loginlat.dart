// To parse this JSON data, do
//
//     final modelLoginEdukasi = modelLoginEdukasiFromJson(jsonString);

import 'dart:convert';

ModelLoginEdukasi modelLoginEdukasiFromJson(String str) => ModelLoginEdukasi.fromJson(json.decode(str));

String modelLoginEdukasiToJson(ModelLoginEdukasi data) => json.encode(data.toJson());

class ModelLoginEdukasi {
  int value;
  String message;
  String username;
  String nama;
  String id;
  String email;
  String nohp;

  ModelLoginEdukasi({
    required this.value,
    required this.message,
    required this.username,
    required this.nama,
    required this.id,
    required this.email,
    required this.nohp,
  });

  factory ModelLoginEdukasi.fromJson(Map<String, dynamic> json) => ModelLoginEdukasi(
    value: json["value"],
    message: json["message"],
    username: json["username"],
    nama: json["nama"],
    id: json["id"],
      email: json["email"],
      nohp: json["nohp"]
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
    "username": username,
    "nama": nama,
    "id": id,
    "email": email,
    "nohp": nohp
  };
}
