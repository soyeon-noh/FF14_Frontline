import 'package:flutter/material.dart';

import '../MainBody.dart';
import '../guide/GuidePage.dart';
import '../matching/MatchingPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required Widget? this.bodyWidget,
  }) : super(key: key);

  final bodyWidget;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  // 선택된 페이지의 인덱스 넘버 초기화
  final List<Widget> _widgetOptions = <Widget>[
    MatchingPage(),
    MainBody(),
    GuidePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      resizeToAvoidBottomInset: false, // BOTTOM OVERFLOW 허용
      // appBar: AppBar(
      //   title: Text(
      //     "전장 가자",
      //     style: TextStyle(fontSize: 24),
      //   ),
      //   // leading: IconButton(
      //   //     icon: Icon(Icons.menu),
      //   //     onPressed: ()=> print("menu")),
      //   // backgroundColor: Colors.transparent,
      //   backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
      //   elevation: 0, // 그림자 농도
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      // drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind_outlined),
            label: '매칭 현황',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag_outlined),
            label: '오늘 전장',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: '전장 가이드',
          ),
        ],
        selectedItemColor: Colors.redAccent,
        backgroundColor: Colors.black54,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
