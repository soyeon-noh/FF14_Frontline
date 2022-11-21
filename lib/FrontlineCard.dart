import 'package:ff_frontline/onPressed/OnItemPressed.dart';
import 'package:flutter/material.dart';

class FrontlineCard extends StatelessWidget {
  const FrontlineCard({
    Key? key,
    required String this.date,
    required double this.opacity,
    required List<String> this.frontline,
    required Color? this.dateColor,
    required Color? this.frontlineColor,
    required int this.frontlineIndex,
  }) : super(key: key);

  final date;
  final opacity;
  final frontline;
  final dateColor;
  final frontlineColor;
  final frontlineIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      width: 400,
      height: 180,
      decoration: BoxDecoration(
          // color: Colors.white54,
          color: Color.fromRGBO(255, 255, 255, opacity),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.8),
                offset: Offset(0, 4),
                blurRadius: 12,
                spreadRadius: 0)
          ]),
      child:  Column(
          children: [
            GestureDetector(
              onTap: (){
                onItemPressed(context, index: frontlineIndex);
              },
              child:
              Column(
                children: [
                  Container(
                    child:
                        Text(date, style: TextStyle(fontSize: 20, color: dateColor, fontFamily: 'shilla')),
                    margin: EdgeInsets.fromLTRB(2.0, 30.0, 0.0, 0.0),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(frontline[0],
                            style: TextStyle(
                                fontSize: 28, color: frontlineColor, fontFamily: 'noto')
                        ),
                        Text(frontline[1],
                            style: TextStyle(
                                fontSize: 18, color: frontlineColor, fontFamily: 'noto')
                        ),
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(2.0, 16.0, 0.0, 0.0),
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}
