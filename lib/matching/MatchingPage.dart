import 'package:flutter/material.dart';

class MatchingPage extends StatefulWidget {
  const MatchingPage({Key? key}) : super(key: key);

  @override
  State<MatchingPage> createState() => _MatchingPageState();
}

class _MatchingPageState extends State<MatchingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Image.asset(
                'assets/img/SealRock.png',
                width: 200,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '봉인된 바위섬',
                style: TextStyle(fontSize: 25),
              ),
              Text('현재 3명 매칭중'),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          OutlinedButton(

            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10),
              textStyle: TextStyle(fontSize: 24.0),
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            ),
            onPressed: () {
              print('매칭');
            },
            child: Text('매칭'),
          )
        ],
      ),
    );
  }
}
