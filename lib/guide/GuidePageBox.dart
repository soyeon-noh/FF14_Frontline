import 'package:flutter/material.dart';

class GuidePageBox extends StatelessWidget {
  String title;
  String subTitle;
  String frontline;
  String route;

  GuidePageBox({
    required this.title,
    required this.subTitle,
    required this.frontline,
    required this.route,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          border: Border.all(
            color: Colors.white54,
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 30,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          // horizontal: 10
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              'assets/img/${frontline}.png',
              width: 100,
              // fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}
