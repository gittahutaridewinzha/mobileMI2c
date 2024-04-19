// To parse this JSON data, do
//
//     final modelBeritaEdukasi = modelBeritaEdukasiFromJson(jsonString);

import 'dart:convert';

ModelBeritaEdukasi modelBeritaEdukasiFromJson(String str) => ModelBeritaEdukasi.fromJson(json.decode(str));

String modelBeritaEdukasiToJson(ModelBeritaEdukasi data) => json.encode(data.toJson());

class ModelBeritaEdukasi {
  bool isSuccess;
  String message;
  List<Datum> data;

  ModelBeritaEdukasi({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelBeritaEdukasi.fromJson(Map<String, dynamic> json) => ModelBeritaEdukasi(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String judul;
  String berita;
  String gambar;

  Datum({
    required this.id,
    required this.judul,
    required this.berita,
    required this.gambar,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    judul: json["judul"],
    berita: json["berita"],
    gambar: json["gambar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "judul": judul,
    "berita": berita,
    "gambar": gambar,
  };
}
