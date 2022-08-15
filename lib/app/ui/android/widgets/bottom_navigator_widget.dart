import 'package:flutter/material.dart';

Widget bottomNavigationBar(_selectedIndex, _onTapped) {
  return BottomNavigationBar(
    landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    elevation: 0,
    backgroundColor: Colors.transparent,
    fixedColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedLabelStyle: TextStyle(
        color: Color(0xFF333333),
        fontSize: 10.0,
        fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(
      color: Color(0xFF828282),
      fontSize: 10.0,
    ),
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(
              Icons.home
          ),
          // activeIcon: Image(
          //     image: AssetImage('assets/icons/ico_main_select.png')),
          label: '홈'),
      BottomNavigationBarItem(
          icon: Icon(
              Icons.book
          ),
          // activeIcon: Image(
          //     image: AssetImage('assets/icons/ico_drip_select.png')),
          label: '내 기록'),

      BottomNavigationBarItem(
        icon: Icon(
            Icons.favorite
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(
            Icons.star
        ),
        label: '경쟁',
      ),
      BottomNavigationBarItem(
          icon: Icon(
              Icons.favorite
          ),
          label: '수락요청'),
    ],
    currentIndex: _selectedIndex,
    onTap: _onTapped,
  );
}
