import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class MatchingPage extends StatefulWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  State<MatchingPage> createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  DateTime getDate(int num) {
    // 기본 언어 초기화
    initializeDateFormatting();
    var now = new DateTime.now();

    var newDate = new DateTime(now.year, now.month, now.day + num);
    return newDate;
  }

  List<String> getFrontline(int num) {
    var list = [
      ['영광의 평원', '쇄빙전', 'TheFieldsOfGlory'],
      ['온살 하카이르', '계절끝 합전', 'OnsalHakair'],
      ['외곽 유적지대', '제압전', 'TheBorderlandRuins'],
      ['봉인된 바위섬', '쟁탈전', 'SealRock'],
    ];

    var baseDate = new DateTime(2022, 7, 20, 0, 0, 0, 0);
    var date = getDate(num);

    Duration diff = baseDate.difference(date);

    var diffDay = diff.inDays.abs();

    var frontlineIndex = diffDay % 4;

    return list[frontlineIndex];
  }

  bool matchingOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              // 전장 이미지
              Image.asset(
                'assets/img/${getFrontline(0).elementAt(2)}.png',
                width: 200,
              ),
              SizedBox(height: 40),
              // 전장 이름
              Text(
                getFrontline(0).elementAt(0),
                style: TextStyle(fontSize: 25),
              ),
              // 전장 약칭
              Text(
                getFrontline(0).elementAt(1),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20),
              // 전장 매칭 현황
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '현재',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(width: 15),
                  Text(
                    '3 / 72 명',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(width: 15),
                  Text(
                    '매칭중',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 60,
          ),
          // 전장 매칭 버튼
          // 매칭 버튼 눌렀을 때
          matchingOn
              ? OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 20.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  onPressed: () {
                    print('매칭을 취소하시겠습니까');
                    setState(() {
                      matchingOn = false;
                    });
                    print(matchingOn);
                  },
                  child: Text('매칭중'),
                )
              // 매칭버튼 안 눌렀을 때
              : OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 20.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xffDE3C3C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  onPressed: () {
                    print('매칭');
                    setState(() {
                      matchingOn = true;
                    });

                    print(matchingOn);
                  },
                  child: Text('매칭'),
                )
        ],
      ),
    );
  }
}
