import 'package:flutter/material.dart';

class PageTk extends StatelessWidget {
  const PageTk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('TEKNIK KOMPUTER'),
        centerTitle: true, //untuk meletakkan title ditengah
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Deskripsi dan profil',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Text('Program Studi D3 Teknik Komputer didirikan pada tahun 2005, dan terakreditasi dengan peringkat B berdasarkan Surat Keputusan Badan Akreditasi nasional Perguruan Tinggi (BAN-PT) Departemen Pendidikan dan kebudayaan republik Indonesia Surat Keputusan Nomor :'
                '1196/SK/BAN- PT/Akred/Dpl-III/XII/2015 dengan nilai akreditaasi',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20), // Spasi antara teks dan tombol
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),

            ),
          ],

        ),

      ),
    );
  }
}
