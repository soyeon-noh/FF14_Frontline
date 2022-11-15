import 'package:ff_frontline/guide/GuidePageBox.dart';
import 'package:flutter/material.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // 이거 왜 적용이 안됨?
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GuidePageBox(
          title: '외곽 유적지대',
          subTitle: '제압전',
          frontline: 'TheBorderlandRuins',
        ),
        GuidePageBox(
          title: '봉인된 바위섬',
          subTitle: '쟁탈전',
          frontline: 'SealRock',
        ),
        GuidePageBox(
          title: '영광의 평원',
          subTitle: '쇄빙전',
          frontline: 'TheFieldsOfGlory',
        ),
        GuidePageBox(
          title: '온살 하카이르',
          subTitle: '계절끝 합전',
          frontline: 'OnsalHakair',
        ),
      ],
    );
  }
}
