import 'package:ff_frontline/layout/FrontlineLayout.dart';
import 'package:flutter/material.dart';
import 'package:ff_frontline/frontline/FrontlinePageContent.dart';

//stl
class TheBorderlandRuins extends StatelessWidget {
  const TheBorderlandRuins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrontlineLayout(
      title: '외곽 유적지대',
      frontlineInfo: Column(
        children: [
          FrontlinePageContent(
            title: "승리 조건",
            infoList: [
              ["점령 점수 + 킬 점수 + 마물 점수", "1600점"],
            ],
          ),
          FrontlinePageContent(
            title: "점령 점수",
            infoList: [
              ["1개", "(1점/3초)"],
              ["2개", "(2점/3초)"],
              ["3개", "(4점/3초)"],
              ["4개", "(8점/3초)"],
              ["5개", "(16점/3초)"],
              ["6개", "(32점/3초)"],
              ["깃발 내리기", "10점"],
              ["깃발 올리기", "10점"],
            ],
          ),
          FrontlinePageContent(
            title: "킬 점수",
            infoList: [
              ["적 총사", "-5점"]
            ],
          ),
          FrontlinePageContent(
            title: "마물 점수",
            infoList: [
              ["요격 시스템", "248~249점"],
              ["요격기", "25점"],
            ],
          ),
          FrontlinePageContent(title: "마물 팝업 시간", infoList: [
            [],
            ["요격 시스템", "10:00"],
            [],
            [],
            ["요격기", "19:00   14:00~   10:00~   6:00~   2:00~"],
            [],
            [
              "( 19:00 이후 쓰러트리고 4분 뒤 팝업이므로",
              "대략적인 시간임 )",
            ],
          ])
        ],
      ),
    );
  }
}
