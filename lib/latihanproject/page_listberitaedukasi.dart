import 'package:flutter/material.dart';
import 'package:untitled/latihanproject/page_detailberitaedukasi.dart';
import 'package:untitled/model/model_beritaedukasi.dart';
import 'package:http/http.dart' as http;

class PageListBeritaEdukasi extends StatefulWidget {
  const PageListBeritaEdukasi({Key? key});

  @override
  State<PageListBeritaEdukasi> createState() => _PageListBeritaEdukasiState();
}

class _PageListBeritaEdukasiState extends State<PageListBeritaEdukasi> {
  TextEditingController txtCari = TextEditingController();
  List<Datum>? berita;
  List<Datum>? filteredBerita;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      http.Response response = await http.get(
          Uri.parse('http://10.126.142.213/edukasi_server/getBerita.php'));
      setState(() {
        berita = modelBeritaEdukasiFromJson(response.body).data;
        filteredBerita = berita;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void searchBerita(String keyword) {
    setState(() {
      filteredBerita = berita
          ?.where((datum) =>
          datum.judul.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Berita Edukasi',
         style: TextStyle(
           fontWeight: FontWeight.bold,
         ),),
        centerTitle: true,
        // backgroundColor: Colors.green, // Ubah warna latar belakang appbar
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: txtCari,
              onChanged: (value) {
                searchBerita(value);
              },
              decoration: InputDecoration(
                hintText: "search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                prefixIcon: Icon(Icons.search), // Tambahkan ikon search
              ),
            ),
            SizedBox(height: 10), // Tambahkan jarak antara TextField dan ListView
            Expanded(
              child: ListView.builder(
                itemCount: filteredBerita?.length ?? 0,
                itemBuilder: (context, index) {
                  Datum? data = filteredBerita?[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailBeritaEdukasi(data),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4, // Tambahkan elevasi pada Card
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'http://10.126.142.213/edukasi_server/gambar_berita/${data?.gambar}',
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${data?.judul}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(height: 5), // Tambahkan jarak antar judul dan teks berita
                                Text(
                                  "${data?.berita}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
