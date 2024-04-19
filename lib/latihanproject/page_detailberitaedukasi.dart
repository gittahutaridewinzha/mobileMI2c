import 'package:flutter/material.dart';
import '../model/model_beritaedukasi.dart';

class DetailBeritaEdukasi extends StatelessWidget {
  final Datum? data;

  const DetailBeritaEdukasi(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Berita"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "http://192.168.100.133/edukasi_server/gambar_berita/${data?.gambar}",
                width: 200, // Ubah lebar gambar
                height: 200, // Ubah tinggi gambar
                fit: BoxFit.cover, // Sesuaikan gambar dengan lebar dan tinggi yang telah ditetapkan
              ),
            ),
          ),
          ListTile(
            title: Text(
              data?.judul ?? "",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            trailing: Icon(
              Icons.favorite, // Ubah ikon favorit
              color: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data?.berita ?? "",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
