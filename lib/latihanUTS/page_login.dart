import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/latihanUTS/page_bottomLAt.dart';
import 'package:untitled/latihanUTS/page_listberita.dart';
import 'package:untitled/latihanUTS/page_register.dart';
import 'package:untitled/latihanproject/page_bottom.dart';
import 'package:untitled/latihanproject/page_register.dart';
import 'package:untitled/model/model_loginedu.dart';
import 'package:untitled/utils/session_managerlat.dart';

class PageLoginEdu extends StatefulWidget {
  const PageLoginEdu({Key? key}) : super(key: key);

  @override
  State<PageLoginEdu> createState() => _PageLoginApiState();
}

class _PageLoginApiState extends State<PageLoginEdu> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isLoading = false;

  late SessionLatihanManager session;

  @override
  void initState() {
    super.initState();
    session = SessionLatihanManager();
  }

  Future<ModelLoginEdu?> loginAccount() async {
    try {
      setState(() {
        isLoading = true;
      });

      http.Response res = await http.post(
        Uri.parse('http://192.168.100.133/edukasi_server/login.php'),
        body: {
          "username": txtUsername.text,
          "password": txtPassword.text,
        },
      );

      ModelLoginEdu data = modelLoginEduFromJson(res.body);

      if (data.value == 1) {
        setState(() {
          isLoading = false;
          session.saveSession(
            data.value ?? 0,
            data.id ?? "",
            data.username ?? "",
            data.fullname ?? "",
            data.email ?? "",
            data.message??""
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${data.message}')),
          );

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => PageListBeritaEdu()),
                (route) => false, // Parameter kedua adalah fungsi yang mengembalikan nilai boolean. Ketika bernilai false, semua halaman dihapus dari tumpukan navigasi.
          );

        });
      } else if (data.value == 2) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${data.message}')),
          );
        });
      } else {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${data.message}')),
        );
      }
    } catch (e) {
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Form Login'),
      ),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Card(
              elevation: 4,
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
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? "tidak boleh kosong " : null;
                        },
                        controller: txtUsername,
                        decoration: InputDecoration(
                          labelText: 'Input Username',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? "tidak boleh kosong " : null;
                        },
                        controller: txtPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Input Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: isLoading
                            ? Center(child: CircularProgressIndicator())
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
                      SizedBox(height: 15),
                      Center(
                        child: isLoading
                            ? Center(child: CircularProgressIndicator())
                            : MaterialButton(
                          minWidth: 150,
                          height: 45,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageRegisterEdu(),
                              ),
                            );
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
          ),
        ),
      ),
    );
  }
}
