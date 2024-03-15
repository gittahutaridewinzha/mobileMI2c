import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:untitled/latihanSatu/page_mi.dart';
import 'package:untitled/latihanSatu/page_tk.dart';

class PageLatihan extends StatelessWidget {
  const PageLatihan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('LATIHAN'),
        centerTitle: true, //untuk meletakkan title ditengah
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('gambar/poli6.png',
                fit: BoxFit.contain,
                height: 200,
                width: 280,
              ),
              SizedBox(height: 8,),
              Text('Selamat Datang di POLITEKNIK NEGERI PADANG',
              style: TextStyle(
                color: Colors.orange,
                  fontWeight: FontWeight.bold
              ),),
              Text('limau manis, padang, sumbar',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10,),
              MaterialButton(onPressed: (){
                showToast(
                  'D-3 Manajemen informatika',
                  context: context,
                  axis: Axis.horizontal,
                  alignment: Alignment.center,
                  position: StyledToastPosition.bottom,
                  borderRadius: BorderRadius.zero,
                  toastHorizontalMargin: 0,
                  fullWidth: true,
                );
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageMi()
                ));
              },
                child: Text('manajemen informatika',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
                color: Colors.orange,
                textColor: Colors.white,
              ),
              SizedBox(height: 8,),
              MaterialButton(onPressed: (){
                showToast(
                  'D-3 Manajemen informatika',
                  context: context,
                  axis: Axis.horizontal,
                  alignment: Alignment.center,
                  position: StyledToastPosition.bottom,
                  borderRadius: BorderRadius.zero,
                  toastHorizontalMargin: 0,
                  fullWidth: true,
                );
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PageTk()
                ));
              },
                child: Text('teknik komputer',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
                color: Colors.orange,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
