import 'package:flutter/material.dart';

class FrontlineLayout extends StatelessWidget {
  String title;
  Widget frontlineInfo;

  FrontlineLayout({
    required this.title,
    required this.frontlineInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Column(
          children: [
            // title
            Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Color.fromRGBO(215, 18, 18, 1.0),
                          fontSize: 50,
                          fontFamily: 'Shilla'),
                    ),
                  ],
                )),
            frontlineInfo,
          ],
        ));
  }
}
