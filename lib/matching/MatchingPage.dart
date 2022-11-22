import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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

  int count = 0;

  // document
  final matchingDocumentReference = FirebaseFirestore.instance
      .collection("matching")
      .doc("QsOgjI6qxHPPTJAwiJpf");

  Stream matchingDocumentStream = FirebaseFirestore.instance
      .collection("matching")
      .doc("QsOgjI6qxHPPTJAwiJpf")
      .snapshots();

  // collection
  final matchingCollectionReference =
      FirebaseFirestore.instance.collection("matching");

  Stream matchingCollectionStream =
      FirebaseFirestore.instance.collection("matching").snapshots();

  Future<int> readCountData() async {
    // one shot

    // Map<String, dynamic>? result =
    //     await matchingDocumentReference.get().then((value) => value.data());
    //
    // setState(() {
    //   count = result!['count'];
    // });

    // stream document
    var snapshot = FirebaseFirestore.instance
        .collection('matching')
        .doc('QsOgjI6qxHPPTJAwiJpf')
        .get();
    // print('뭔데이거 $snapshot');//Future<DocumentSnapshot<Map<String, dynamic>>>
    var result2 = await snapshot.then((value) => value.data());

    print('result2 $result2');
    print('count는 뭐야 ${result2!['count']}');

    // stream collection
    // var snapshot = FirebaseFirestore.instance.collection('matching').get().then((value) => value.docs.forEach((doc){
    //   print(doc["count"]);
    // }));
    //
    // print('뭔데이거 $snapshot');
    // var result2 = await snapshot.then((value)=> print(value));
    //
    // print('result2 $result2');
    // print('count는 뭐야 ${result2!['count']}');


    // setState(() {
    //   count = result2!['count'];
    // });

    return result2!['count'];
  }



  void addCountData() async {
    // 기존 날짜 가져오기
    Map<String, dynamic>? data = await matchingDocumentReference.get().then((value) => value.data());
    // print(data!['date'].toDate());
    DateTime preDate = data!['date'].toDate();

    // 오늘날짜
    DateTime now = new DateTime.now();
    print('now $now');

    // 날짜가 바뀌면
    if(preDate.day != now.day){
      // 카운트 1부터 다시세기
      count = 1;
    }
    // 날짜가 그대로면
    else{
      // 기존 카운트 가져오기
      int readCount = await readCountData();
      setState(() {
        count = readCount + 1;
      });
    }

    matchingDocumentReference.update({'count': count, 'date': now});
  }

  void subtractionCountData() async {
    // 기존 날짜 가져오기
    Map<String, dynamic>? data = await matchingDocumentReference.get().then((value) => value.data());
    // print(data!['date'].toDate());
    DateTime preDate = data!['date'].toDate();

    // 오늘날짜
    DateTime now = new DateTime.now();
    print('now $now');

    print('이전날짜 ${preDate.day } 오늘날짜 ${now.day}');
    // 날짜가 바뀌면
    if(preDate.day != now.day){
      // 카운트 0으로 되돌리기
      count = 0;
    }
    // 날짜가 그대로면
    else{
      int readCount = await readCountData();
      if(count > 0){
        setState(() {
          count = readCount - 1;
        });
      }
    }

    matchingDocumentReference.update({'count': count, 'date': now});
  }


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
                children: [
                  Text(
                    '현재',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(width: 15),
                  StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection("matching")
                          .doc('QsOgjI6qxHPPTJAwiJpf')
                          .snapshots(),
                      builder: (context, snapshot) {
                        // Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;

                        // snapshot의 데이터는 처음에 null일 가능성이 매우 높으니 data!와 같이 작성하면
                        // 오버플로우 오류가 발생한다. 주의하자.
                        print(snapshot.data?.data()!['count']);
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return CircularProgressIndicator();
                        }
                        return Text(
                          '${snapshot.data?.data()!['count']} / 72 명',
                          style: TextStyle(fontSize: 25),
                          overflow: TextOverflow.visible,
                        );

                      }),

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
                  onPressed: () async {
                    print('매칭을 취소하시겠습니까');
                    setState(() {
                      matchingOn = false;
                    });

                    // count 빼기
                    subtractionCountData();
                    print('$count count');
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

                    // count 더하기
                    addCountData();
                    print('$count count');
                  },
                  child: Text('매칭'),
                )
        ],
      ),
    );
  }
}
