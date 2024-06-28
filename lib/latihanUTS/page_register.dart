import 'package:flutter/material.dart';
import 'package:untitled/latihanUTS/page_login.dart';
import 'package:untitled/latihanproject/page_login.dart';
import 'package:untitled/model/model_registeredu.dart';
import 'package:untitled/latihanproject/page_login.dart';
import 'package:untitled/loginApi/page_login_api.dart';
import 'package:http/http.dart' as http;

class PageRegisterEdu extends StatefulWidget {
  const PageRegisterEdu({super.key});

  @override
  State<PageRegisterEdu> createState() => _PageRegisterApiState();
}

class _PageRegisterApiState extends State<PageRegisterEdu> {

  //untuk mendapatkan value dari text field
  TextEditingController txtfullname = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtEmail = TextEditingController();



  //validasi form
  GlobalKey<FormState> keyForm= GlobalKey<FormState>();

  //proses untuk hit api
  bool isLoading = false;
  Future<ModelRegisterEdu?> registerAccount() async{
    //handle error
    try{
      setState(() {
        isLoading = true;
      });

      http.Response response = await http.post(Uri.parse('http://192.168.100.133/edukasi_server/register.php'),
          body: {
            "fullname": txtfullname.text,
            "username": txtUsername.text,
            "password": txtPassword.text,
            "email": txtEmail.text,

          }
      );
      ModelRegisterEdu data = modelRegisterEduFromJson(response.body);
      //cek kondisi
      if(data.value == 1){
        //kondisi ketika berhasil register
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${data.message}'))
          );

          //pindah ke page login
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)
          => PageLoginEdu()
          ), (route) => false);

        });
      }else if(data.value == 2){
        //kondisi akun sudah ada
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${data.message}'))
          );
        });
      }else{
        //gagal
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${data.message}'))
          );
        });
      }

    }catch (e){
      setState(() {
        //munculkan error
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()))
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Register Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Card(
            elevation: 4, // Menambahkan elevasi untuk efek shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: keyForm,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? "Field can't be empty" : null;
                        },
                        controller: txtfullname,
                        decoration: InputDecoration(
                          labelText: 'Nama',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? "Field can't be empty" : null;
                        },
                        controller: txtUsername,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(Icons.account_box),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? "Field can't be empty" : null;
                        },
                        controller: txtPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.password),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? "Field can't be empty" : null;
                        },
                        controller: txtEmail,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 12),
                      // TextFormField(
                      //   validator: (val) {
                      //     return val!.isEmpty ? "Field can't be empty" : null;
                      //   },
                      //   controller: txtNohp,
                      //   decoration: InputDecoration(
                      //     labelText: 'No HP',
                      //     prefixIcon: Icon(Icons.phone_android),
                      //   ),
                      // ),
                      SizedBox(height: 20),
                      Center(
                        child: isLoading
                            ? CircularProgressIndicator()
                            : MaterialButton(
                          onPressed: () {
                            if (keyForm.currentState!.validate()) {
                              registerAccount();
                            }
                          },
                          child: Text('Sign up'),
                          color: Colors.blue,
                          textColor: Colors.white,
                          height: 45,
                          minWidth: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}