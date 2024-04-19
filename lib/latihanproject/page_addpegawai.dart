// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:untitled/latihanproject/Page_pegawai.dart';
// import 'package:untitled/latihanproject/page_bottom.dart';
// import 'package:untitled/model/model_addpegawai.dart';
//
// class PageTambahKaryawan extends StatefulWidget {
//   const PageTambahKaryawan({Key? key}) : super(key: key);
//
//   @override
//   State<PageTambahKaryawan> createState() => _PageTambahKaryawanState();
// }
//
// class _PageTambahKaryawanState extends State<PageTambahKaryawan> {
//   TextEditingController txtNama = TextEditingController();
//   TextEditingController txtNobp = TextEditingController();
//   TextEditingController txtNohp = TextEditingController();
//   TextEditingController txtEmail = TextEditingController();
//   TextEditingController tanggalInput = TextEditingController();
//
//   GlobalKey<FormState> keyForm = GlobalKey<FormState>();
//
//   bool isLoading = false;
//
//   Future<void> registerPegawai() async {
//     try {
//       setState(() {
//         isLoading = true;
//       });
//
//       http.Response response = await http.post(
//         Uri.parse('http://192.168.100.133/edukasi_server/addPegawai.php'),
//         body: {
//           "nama": txtNama.text,
//           "nobp": txtNobp.text,
//           "nohp": txtNohp.text,
//           "email": txtEmail.text,
//           "tanggal_input": tanggalInput.text,
//         },
//       );
//
//       ModelAddPegawai data = modelAddPegawaiFromJson(response.body);
//
//       setState(() {
//         isLoading = false;
//       });
//
//       if (data.value == 1) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('${data.message}')),
//         );
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => PagePegawai()),
//               (route) => false,
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('${data.message}')),
//         );
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Terjadi kesalahan: ${e.toString()}')),
//         );
//       });
//     }
//   }
//
//   Future<void> selectDate() async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1950),
//       lastDate: DateTime(2100),
//     );
//
//     if (pickedDate != null) {
//       setState(() {
//         tanggalInput.text = DateFormat('yyyy-MM-dd').format(pickedDate);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           'Tambah Karyawan',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Form(
//         key: keyForm,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 SizedBox(height: 20),
//                 TextFormField(
//                   validator: (val) {
//                     return val!.isEmpty ? "Tidak boleh kosong" : null;
//                   },
//                   controller: txtNama,
//                   decoration: InputDecoration(
//                     hintText: 'Nama Lengkap',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   validator: (val) {
//                     return val!.isEmpty ? "Tidak boleh kosong" : null;
//                   },
//                   controller: txtNobp,
//                   decoration: InputDecoration(
//                     hintText: 'No BP',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   validator: (val) {
//                     return val!.isEmpty ? "Tidak boleh kosong" : null;
//                   },
//                   controller: txtEmail,
//                   decoration: InputDecoration(
//                     hintText: 'Email',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   validator: (val) {
//                     return val!.isEmpty ? "Tidak boleh kosong" : null;
//                   },
//                   controller: txtNohp,
//                   decoration: InputDecoration(
//                     hintText: 'No HP',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   onTap: () {
//                     selectDate();
//                   },
//                   validator: (val) {
//                     return val!.isEmpty ? "Tidak boleh kosong" : null;
//                   },
//                   controller: tanggalInput,
//                   decoration: InputDecoration(
//                     hintText: 'Tanggal Input',
//                     prefixIcon: Icon(Icons.calendar_today),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     filled: true,
//                     fillColor: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     // Panggil fungsi registerPegawai untuk menambahkan pegawai
//                     await registerPegawai();
//                     // Setelah menambahkan pegawai, pindah ke PageBottomNavigation tanpa menghapus halaman sebelumnya dari tumpukan
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => PageBottomNavigation(initialIndex: 2)),
//                     );
//                   },
//                   child: Text('SIMPAN'),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }