import 'package:ff_frontline/layout/FrontlineLayout.dart';
import 'package:flutter/material.dart';

import 'FrontlinePageContent.dart';

class SealRock extends StatelessWidget {
  const SealRock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrontlineLayout(
      title: "봉인된 바위섬",
      frontlineInfo: Column(
        children: [
          FrontlinePageContent(
            title: "승리 조건",
            infoList: [
              ["점령 점수 + 킬 점수", "800점"],
            ],
          ),
          FrontlinePageContent(
            title: "점령 점수",
            infoList: [
              ["B", "80점", "(2점/3초)"],
              ["A", "120점", "(3점/3초)"],
              ["S", "160점", "(4점/3초)"]
            ],
          ),
          FrontlinePageContent(
            title: "킬 점수",
            infoList: [
              ["우리 총사", "+5점"],
              ["적 총사", "-5점"]
            ],
          ),
        ],
      ),
    );
  }
}
