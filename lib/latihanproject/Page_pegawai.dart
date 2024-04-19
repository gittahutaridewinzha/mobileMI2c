import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/model/model_pegawai.dart';
import 'dart:convert';



class PagePegawai extends StatefulWidget {
  const PagePegawai({Key? key});
  @override
  _PagePegawaiState createState() => _PagePegawaiState();
}

class _PagePegawaiState extends State<PagePegawai> {
  bool isCari = true;
  List<String> filterDevice = [];
  TextEditingController txtCari = TextEditingController();

  late Future<List<Datum>> _pegawaiFuture;

  @override
  void initState() {
    super.initState();
    _pegawaiFuture = getBerita();
  }

  Future<List<Datum>> getBerita() async {
    try {
      final response = await http.get(
          Uri.parse("http://10.126.142.213/edukasi_server/getPegawai.php"));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['isSuccess'] == true) {
          return List<Datum>.from(
              jsonResponse['data'].map((x) => Datum.fromJson(x)));
        } else {
          throw Exception(
              'Failed to load data: ${jsonResponse['message']}');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  List<Datum> filterPegawai(List<Datum> pegawaiList, String keyword) {
    if (keyword.isEmpty) {
      return pegawaiList;
    } else {
      return pegawaiList.where((pegawai) =>
          pegawai.nama.toLowerCase().contains(keyword.toLowerCase())).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Data Pegawai',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: txtCari,
                decoration: InputDecoration(
                  hintText: 'search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (_) {
                  setState(() {}); // Untuk memperbarui tampilan ketika teks berubah
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: _pegawaiFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Datum>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.data!.isEmpty) {
                    return Center(
                        child: Text('Tidak ada data yang ditemukan'));
                  } else {
                    return ListView(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  'Nama',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                tooltip: 'Nama',
                              ),
                              DataColumn(
                                label: Text(
                                  'No BP',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                tooltip: 'No BP',
                              ),
                              DataColumn(
                                label: Text(
                                  'Email',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                tooltip: 'Email',
                              ),
                              DataColumn(
                                label: Text(
                                  'No. HP',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                tooltip: 'No. HP',
                              ),
                              DataColumn(
                                label: Text(
                                  'Tanggal Daftar',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                tooltip: 'Tanggal Daftar',
                              ),
                              DataColumn(
                                label: Text(
                                  'Aksi',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                tooltip: 'Aksi',
                              ),
                            ],
                            rows: filterPegawai(snapshot.data!, txtCari.text)
                                .map((pegawai) {
                              return DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(pegawai.nama)),
                                  DataCell(Text(pegawai.nobp)),
                                  DataCell(Text(pegawai.email)),
                                  DataCell(Text(pegawai.nohp)),
                                  DataCell(
                                    Text(
                                      pegawai.tanggalInput != null
                                          ? pegawai.tanggalInput.toString()
                                          : '',
                                    ),
                                  ),
                                  DataCell(
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            // Tambahkan logika untuk menghapus data di sini
                                          },
                                          icon: Icon(Icons.delete),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            // Tambahkan logika untuk mengedit data di sini
                                          },
                                          icon: Icon(Icons.edit),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => PageTambahPegawai()),
            // );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
