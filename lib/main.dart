import 'package:flutter/material.dart';

import 'MainBody.dart';
import 'drawer/MainDrawer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 조매 26

  runApp(const MyApp(bodyWidget: MainBody(),));
}

// stless
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required Widget this.bodyWidget,
  }) : super(key: key);

  final bodyWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            // fontFamily: 'EF_Diary',
            fontFamily: 'Shilla',
            textTheme: TextTheme(
              bodyText1: TextStyle(
                  color: Color.fromRGBO(222, 60, 60, 1.0), fontSize: 28.0),
                  // color: Color.fromRGBO(215, 18, 18, 1.0), fontSize: 28.0),
              bodyText2: TextStyle(
                  color: Colors.white, fontSize: 18.0, fontFamily: 'Noto'),
            )),
        // home: MainScaffold(),
        home: Scaffold(
          backgroundColor: Colors.black87,
          resizeToAvoidBottomInset: false, // BOTTOM OVERFLOW 허용
          appBar: AppBar(
            title: Text(
              "전장 가자",
              style: TextStyle(fontSize: 24),
            ),
            // leading: IconButton(
            //     icon: Icon(Icons.menu),
            //     onPressed: ()=> print("menu")),
            // backgroundColor: Colors.transparent,
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
            elevation: 0, // 그림자 농도
            centerTitle: true,
          ),
          // extendBodyBehindAppBar: true,
          // body: MainBody(),
          body: SingleChildScrollView(
            child: bodyWidget,
          ),
          drawer: MainDrawer(),
        ));
  }
}
