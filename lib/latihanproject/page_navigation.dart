import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:untitled/latihanproject/page_listberitaedukasi.dart';
import 'package:untitled/latihanproject/page_login.dart';
import 'package:untitled/screen_page/page_column.dart';
import 'package:untitled/screen_page/page_passing_data.dart';

class PageNavigation extends StatelessWidget {
  const PageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Page Navigation Bar'),
      ),

      //drawer untuk menu disamping atau sidebar
      drawer: SizedBox(
        width: 250,
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Gitta Hutari Dewinzha"),
                accountEmail: Text("Gitta@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 55,
                  child: Icon(
                    Icons.person,
                    color: Colors.lightBlue,
                    size: 65,
                  ),
                ),
              ),

              ListTile(
                //untuk bisa diclik
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)
                  => PageRow()
                  ));
                },
                title: Text('Pegawai'),
              ),
              Divider(), //untuk mengasih jarak pemisah
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageListBeritaEdukasi()));
                },
                title: Text('Berita Edukasi'),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageLoginEdukasi()));
                },
                title: Text('LogOut'),
              ),
            ],
          ),
        ),
      ),

      body: Center(
        child: MaterialButton(
          onPressed: (){
            //kembali ke page utama
            Navigator.pop(context);
          },
          child: Text('Back'),
        ),
      ),
    );
  }
}

class PageRow extends StatelessWidget {
  const PageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Page Row'),
      ),
      body: Center(
        child: Row(
          //https://api.flutter.dev/flutter/widgets/Row-class.html
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.add_business_sharp,
              color: Colors.orange,
            ),
            Icon(
              Icons.person,
              color: Colors.orange,
            ),
            Icon(
              Icons.add_call,
              color: Colors.orange,
            ),

          ],
        ),
      ),
    );
  }
}