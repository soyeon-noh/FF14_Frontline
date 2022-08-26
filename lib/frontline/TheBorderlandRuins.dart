import 'package:flutter/material.dart';
import 'package:ff_frontline/frontline/FrontlinePageContent.dart';

//stl
class TheBorderlandRuins extends StatelessWidget {
  const TheBorderlandRuins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,

        child: Column(
          children: [
            // title
            Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child:
                Text(
                  "외곽 유적지대",
                  style: TextStyle(color: Color.fromRGBO(215, 18, 18, 1.0),fontSize: 50, fontFamily: 'Shilla'),
                )
            ),

            Column(
              children: [
                FrontlinePageContent(
                  title: "승리 조건",
                  infoList: [
                    ["점령 점수 + 킬 점수 + 마물 점수", "1600점"],
                  ],
                ),
                FrontlinePageContent(
                  title:"점령 점수",
                  infoList: [
                    ["1개","(1점/3초)"],
                    ["2개","(2점/3초)"],
                    ["3개","(4점/3초)"],
                    ["4개","(8점/3초)"],
                    ["5개","(16점/3초)"],
                    ["6개","(32점/3초)"],
                    ["깃발 내리기","10점"],
                    ["깃발 올리기","10점"],
                  ],
                ),
                FrontlinePageContent(
                  title:"킬 점수",
                  infoList: [
                    ["적 총사", "-5점"]
                  ],
                ),
                FrontlinePageContent(
                  title:"마물 점수",
                  infoList: [
                    ["요격 시스템","248~249점"],
                    ["요격기","25점"],
                  ],
                ),
                FrontlinePageContent(
                  title:"마물 팝업 시간",
                  infoList: [
                    [],
                    ["요격 시스템", "10:00"],
                    [],
                    ["요격기", "19:00    14:45    10:30     6:15     1:50"],
                  ]
                )
              ],
            ),
          ],
        )
    );
  }
}
