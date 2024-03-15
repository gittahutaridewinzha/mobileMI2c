import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class PageColumn extends StatelessWidget {
  const PageColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Column"),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'gambar/thenun.jpg',
                        fit: BoxFit.contain,
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        width: 200,
                        child: Card(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'The Nun',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Rp. 45.000',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'gambar/infinity.jpg',
                        fit: BoxFit.contain,
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        width: 200,
                        child: Card(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Avenger Infinity Game',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Rp. 75.000',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'gambar/tmz.jpg',
                        fit: BoxFit.contain,
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        width: 200,
                        child: Card(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'The Maze Runner',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Rp. 50.000',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'gambar/endgame.jpg',
                        fit: BoxFit.contain,
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        width: 200,
                        child: Card(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Avenger End Game',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Rp. 95.000',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'gambar/6under.jpg',
                        fit: BoxFit.contain,
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        width: 200,
                        child: Card(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '6 Underground',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Rp. 45.000',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'gambar/annabelle.jpg',
                        fit: BoxFit.contain,
                        height: 150,
                        width: 150,
                      ),
                      SizedBox(
                        width: 200,
                        child: Card(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Annabelle',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Rp. 45.000',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageColumnRow extends StatelessWidget {
  const PageColumnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Page Column dan Row"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 65, color: Colors.green,),
                Text("Menu Home")
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.list, size: 65, color: Colors.green,),
                Text("Menu Berita")
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.person_off, size: 65, color: Colors.green,),
                Text("Menu Profil")
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PageListHorizontal extends StatelessWidget {
  const PageListHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("List Horizontal"),
      ),
      body: SizedBox(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(50, (index){
            return Card(
              child: Center(child: Text('Horizontal ke : ${index}')),
            );
          }),
        ),
      ),
    );
  }
}