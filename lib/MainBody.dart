import 'package:flutter/material.dart';
import 'FrontlineCard.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  DateTime getDate(int num){
    // 기본 언어 초기화
    initializeDateFormatting();
    var now = new DateTime.now();

    var newDate = new DateTime(now.year, now.month, now.day + num);
    return newDate;
  }

  String getDateFormat(int num) {
    var date = getDate(num);

    String formatDate = DateFormat('MM/dd (E)', 'ko').format(date);
    return formatDate;
  }

  static var list = [
    ['영광의 평원','(쇄빙전)'],
    ['온살 하카이르','(계절끝 합전)'],
    ['외곽 유적지대','(제압전)'],
    ['봉인된 바위섬','(쟁탈전)'],
  ];

  int getFrontline(int num) {

    var baseDate = new DateTime(2022, 7, 20, 0, 0, 0, 0);
    var date = getDate(num);

    Duration diff = baseDate.difference(date);

    var diffDay = diff.inDays.abs();

    var frontlineIndex = diffDay % 4;

    return frontlineIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FrontlineCard(
            date: getDateFormat(-1),
            opacity: 0.3,
            frontline: list[getFrontline(-1)],
            dateColor: Colors.white,
            frontlineColor: Colors.white,
              frontlineIndex: getFrontline(-1)
          ),
          FrontlineCard(
              date: getDateFormat(0),
              opacity: 1,
              frontline: list[getFrontline(0)],
              dateColor: Colors.black,
              frontlineColor: Colors.black,
              frontlineIndex: getFrontline(0)
          ),
          FrontlineCard(
            date: getDateFormat(1),
            opacity: 0.3,
            frontline: list[getFrontline(1)],
            dateColor: Colors.white,
            frontlineColor : Colors.white,
              frontlineIndex: getFrontline(1)
          ),
          FrontlineCard(
            date: getDateFormat(2),
            opacity: 0.3,
            frontline: list[getFrontline(2)],
            dateColor: Colors.white,
            frontlineColor : Colors.white,
              frontlineIndex: getFrontline(2)
          ),
          FrontlineCard(
            date: getDateFormat(3),
            opacity: 0.3,
            frontline: list[getFrontline(3)],
            dateColor: Colors.white,
            frontlineColor : Colors.white,
              frontlineIndex: getFrontline(3)
          ),
          FrontlineCard(
            date: getDateFormat(4),
            opacity: 0.3,
            frontline: list[getFrontline(4)],
            dateColor: Colors.white,
            frontlineColor : Colors.white,
              frontlineIndex: getFrontline(4)
          ),
          FrontlineCard(
            date: getDateFormat(5),
            opacity: 0.3,
            frontline: list[getFrontline(5)],
            dateColor: Colors.white,
            frontlineColor : Colors.white,
            frontlineIndex: getFrontline(5)
          )
        ],
      ),
    );
  }
}
