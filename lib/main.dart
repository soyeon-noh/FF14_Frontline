import 'package:ff_frontline/frontline/OnsalHakair.dart';
import 'package:ff_frontline/frontline/SealRock.dart';
import 'package:ff_frontline/frontline/TheBorderlandRuins.dart';
import 'package:ff_frontline/frontline/TheFieldsOfGlory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ff_frontline/screen/HomeScreen.dart';

// 파이어 베이스
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// 국제화
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 조매 26

  // 파이어 베이스
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 국제화
  await initializeDateFormatting().then(
    (value) => HomeScreen(),
  );

  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/onsal': (context) => OnsalHakair(),
        '/rock': (context) => SealRock(),
        '/ruins': (context) => TheBorderlandRuins(),
        '/fields': (context) => TheFieldsOfGlory(),
      },
      // home: HomeScreen(),
      theme: ThemeData(
        // fontFamily: 'EF_Diary',
        fontFamily: 'Shilla',
        textTheme: TextTheme(
          bodyText1: TextStyle(
              color: Color.fromRGBO(215, 18, 18, 1.0), fontSize: 28.0),
          bodyText2: TextStyle(
              color: Colors.white, fontSize: 18.0, fontFamily: 'Noto'),
        ),
      ),
    ),
  );

}
