import 'package:flutter/material.dart';

import 'FrontlinePageContent.dart';

class OnsalHakair extends StatelessWidget {
  const OnsalHakair({Key? key}) : super(key: key);

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
                  Column(
                    children: [
                      Text(
                        "온살 하카이르",
                        style: TextStyle(color: Color.fromRGBO(215, 18, 18, 1.0),fontSize: 50, fontFamily: 'Shilla'),
                      ),
                    ],
                  )
            ),

            Column(
              children: [
                FrontlinePageContent(
                  title: "승리 조건",
                  infoList: [
                    ["점령 점 + 킬 점수", "1600점"],
                  ],
                ),
                FrontlinePageContent(
                  title:"점령 점수",
                  infoList: [
                    ["B","50점","(5점/3초)"],
                    ["A","100점","(10점/3초)"],
                    ["S","200점","(20점/3초)"]
                  ],
                ),
                FrontlinePageContent(
                  title:"킬 점수",
                  infoList: [
                    ["우리 총사", "+8점"],
                    ["적 총사", "-8점"]
                  ],
                ),
              ],
            ),
          ],
        )
    );
  }
}
