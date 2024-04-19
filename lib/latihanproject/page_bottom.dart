import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:untitled/latihanproject/Page_pegawai.dart';
import 'package:untitled/latihanproject/Page_profile.dart';
import 'package:untitled/latihanproject/page_listberitaedukasi.dart';

class PageBottomNavigation extends StatefulWidget {
  final int initialIndex; // Tambahkan parameter initialIndex
  const PageBottomNavigation({Key? key, required this.initialIndex}) : super(key: key);

  @override
  State<PageBottomNavigation> createState() => _PageBottomNavigationState();
}

class _PageBottomNavigationState extends State<PageBottomNavigation> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: widget.initialIndex); // Atur initialIndex dari TabController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          PageListBeritaEdukasi(),
          PageProfileUser(),
          PageKaryawan(),
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
            Tab(
              icon: Icon(Icons.group),
            ),
          ],
        ),
      ),
    );
  }
}
