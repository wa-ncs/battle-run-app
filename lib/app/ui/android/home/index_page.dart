import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:how_much_spend_app/app/ui/android/home/home_page.dart';
import 'package:how_much_spend_app/app/ui/android/login/widget/profile.dart';
import 'package:how_much_spend_app/app/ui/android/record/record_page.dart';
import 'package:how_much_spend_app/app/ui/android/record/widget/google_map_page.dart';
import 'package:how_much_spend_app/app/ui/android/widgets/bottom_navigator_widget.dart';
import 'package:how_much_spend_app/app/ui/theme/constant.dart';

class IndexPage extends StatefulWidget {
  static const routeId = '/';

  final int selectIndex;
  const IndexPage({required this.selectIndex});
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 0;
  late List _screens;

  ListQueue<int> _navigationQueue = ListQueue();

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectIndex;
    _screens = [
      HomePage(),
      ProfilePage(),
      RecordPage(),
      GoogleMapPage(),
      RecordPage(),
      // TodayWordScreen(),
      // MyPageScreen(),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void onTapped(int index) {
    if (index != _selectedIndex) {
      _navigationQueue.removeWhere((element) => element == index);
      _navigationQueue.addLast(index);
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  Widget get bodyContent {
    return _screens[_selectedIndex];
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_navigationQueue.isEmpty) return true;
        setState(() {
          _navigationQueue.removeLast();
          int position = _navigationQueue.isEmpty ? 0 : _navigationQueue.last;
          _selectedIndex = position;
        });
        return false;
      },
      child: Scaffold(
        body: Container(child: bodyContent),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          width: 80,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: () {
                Get.to(() => RecordPage());
                },
              child: Text("Run",style: TextStyle(fontFamily: 'Aggro')),
            ),
          ),
        ),
      // bottomNavigationBar:bottomNavigationBar(_selectedIndex, onTapped))
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          color: Color(0xFFFFFFFF),
          child: Container(
            height: 65,
            child: bottomNavigationBar(_selectedIndex, onTapped)
          ),
        ),
       )// bottomNavigationBar: bottomNavigationBar
    );
  }
}
