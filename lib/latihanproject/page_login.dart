import 'package:flutter/material.dart';
import 'package:untitled/latihanproject/page_bottom.dart';
import 'package:untitled/latihanproject/page_listberitaedukasi.dart';
import 'package:untitled/latihanproject/page_register.dart';
import 'package:untitled/model/model_loginlat.dart';
import 'package:untitled/screen_page/page_list_berita.dart';
import 'package:untitled/screen_page/page_register_api.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/utils/session_managerlat.dart';


class PageLoginEdukasi extends StatefulWidget {
  const PageLoginEdukasi({super.key});

  @override
  State<PageLoginEdukasi> createState() => _PageLoginApiState();
}

class _PageLoginApiState extends State<PageLoginEdukasi> {
  //untuk mendapatkan value dari text field
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  //TASK : silahkan hubungan yg page login dengan api
  //kalau berhasil login pindah ke page list berita
  bool isLoading = false;
  Future<ModelLoginEdukasi?> loginAccount() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.post(
          Uri.parse('http://10.126.142.213/edukasi_server/login.php'),
          body: {
            "username": txtUsername.text,
            "password": txtPassword.text,

          });

      ModelLoginEdukasi data = modelLoginEdukasiFromJson(res.body);
      //cek kondisi respon
      if (data.value == 1) {
        setState(() {
          isLoading = false;
          //untuk simpan sesi
          session.saveSession(
            data.value ?? 0,
            data.id ?? "",
            data.username ?? "",
            data.nama ?? "",
            data.email ?? "",
            data.nohp ?? "",
          );

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
          //kondisi berhasil dan pindah ke page login
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => PageBottomNavigation()),
                  (route) => false);
        });
        //kondisi email sudah ada
      } else if (data.value == 2) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
        //kondisi gagal daftar
      } else {
        isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${data.message}')));
      }
    } catch (e) {
      isLoading = false;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }



  //validasi form
  GlobalKey<FormState> keyForm= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Form  Login'),
      ),

      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
    child: Center(
    child: Card(
    elevation: 4, // Menambahkan elevasi untuk efek shadow
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
    padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'gambar/login3.png',
                  fit: BoxFit.contain,
                  height: 250,
                  width: 250,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  //validasi kosong
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtUsername,
                  decoration: InputDecoration(
                      labelText: 'Input Username',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),

                ),
                SizedBox(height: 8,),


                SizedBox(height: 8,),
                TextFormField(
                  validator: (val){
                    return val!.isEmpty ? "tidak boleh kosong " : null;
                  },
                  controller: txtPassword,
                  obscureText: true,//biar password nya gak keliatan
                  decoration: InputDecoration(
                      labelText: 'Input Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),

                ),

                SizedBox(height: 15,),
                Center(
                  child: isLoading
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : MaterialButton(
                    minWidth: 150,
                    height: 45,
                    onPressed: () {
                      if (keyForm.currentState?.validate() == true) {
                        loginAccount();
                      }
                    },
                    child: Text('Login'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 15,),
                Center(
                  child: isLoading
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : MaterialButton(
                    minWidth: 150,
                    height: 45,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      => PageRegister()
                      ));
                    },
                    child: Text('Sign in'),
                    color: Colors.blue,
                    textColor: Colors.white,

                  ),

                ),

              ],
            ),
          ),
        ),
      ),
    )
      )));
  }
}