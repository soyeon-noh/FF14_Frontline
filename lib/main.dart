import 'package:ff_frontline/guide/GuidePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'MainBody.dart';

// 국제화
import 'package:intl/date_symbol_data_local.dart';

import 'matching/MatchingPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 조매 26

  // 국제화
  initializeDateFormatting()
      .then((value) => runApp(MyApp(bodyWidget: MainBody())));

  runApp(
    MyApp(
      bodyWidget: MainBody(),
    ),
  );
}

// stless
class MyApp extends StatefulWidget {
  MyApp({
    Key? key,
    required Widget? this.bodyWidget,
  }) : super(key: key);

  final bodyWidget;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
        theme: ThemeData(
            // fontFamily: 'EF_Diary',
            fontFamily: 'Shilla',
            textTheme: TextTheme(
              bodyText1: TextStyle(
                  color: Color.fromRGBO(215, 18, 18, 1.0), fontSize: 28.0),
              bodyText2: TextStyle(
                  color: Colors.white, fontSize: 18.0, fontFamily: 'Noto'),
            )),
        // home: MainScaffold(),
        home: SafeArea(
          child: Scaffold(
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
            body: SingleChildScrollView(
              child: _widgetOptions.elementAt(_selectedIndex),
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
          ),
        ));
  }
}
