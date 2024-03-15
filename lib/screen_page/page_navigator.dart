import 'package:flutter/material.dart';

class PageNavigationBar extends StatelessWidget {
  const PageNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Page navigator'),
    centerTitle: true, //untuk meletakkan title ditengah
    ),
      drawer: SizedBox(
        width: 250,
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text('gitta hutari dewinzha'),
                  accountEmail: Text('gittahutari81@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  radius: 55,
                  child: Icon(
                    Icons.person,
                    color: Colors.green,
                    size: 65,
                  ),
                ),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PageRow()
                  ));
                },
              title: Text(
                "Row widget"
              )
              ),
              Divider(),
              ListTile(
                  title: Text(
                      "column widget"
                  )
              ),
              Divider(),
              ListTile(
                  title: Text(
                      "list horizontal"
                  )
              ),
              Divider(),
              ListTile(
                  title: Text(
                      "passing data"
                  )
              ),
              Divider(),
            ],
          ),
        ),
    ),

      body: Center(
        child: MaterialButton(
          onPressed: (){
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
        backgroundColor: Colors.deepOrange,
        title: Text('page Row'),
      ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.add_business_sharp
            ),
            Icon(
                Icons.person
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

