import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:untitled/latihanUTS/page_listberita.dart';
import 'package:untitled/latihanproject/Page_pegawai.dart';
import 'package:untitled/latihanproject/Page_profile.dart';
import 'package:untitled/latihanproject/page_listberitaedukasi.dart';

class PageBottom extends StatefulWidget {
  final int initialIndex; // Tambahkan parameter initialIndex
  const PageBottom({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<PageBottom> createState() => _PageBottomNavigationState();
}

class _PageBottomNavigationState extends State<PageBottom> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: widget.initialIndex); // Atur initialIndex dari TabController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          PageListBeritaEdu(),
          PageProfileUser(),
          // PageKaryawan(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2.0,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(
              icon: Icon(Icons.book),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
            // Tab(
            //   icon: Icon(Icons.group),
            // ),
          ],
        ),
      ),
    );
  }
}
