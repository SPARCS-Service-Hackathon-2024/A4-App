import 'package:flutter/material.dart';
import 'package:app_front/View/Screen/lv_test2.dart';
import 'package:app_front/View/Screen/quest_page.dart';

class LvTestPage extends StatefulWidget {
  @override
  _LvTestPageState createState() => _LvTestPageState();
}

class _LvTestPageState extends State<LvTestPage> {
  double progressValue = 0.1; // 초기 진행도

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나의 자취 레벨 알아보기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            LinearProgressIndicator(
              value: progressValue,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              '가취에 오신 것을 환영해요!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '현재 자취중인가요?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // '네 이미 자취중이에요' 선택 시 quest_page.dart로 이동
                Navigator.push(context, MaterialPageRoute(builder: (context) => QuestPage()));
              },
              child: Text('네 이미 자취중이에요'),
            ),
            ElevatedButton(
              onPressed: () {
                // '아직 자취를 준비하고 있어요' 선택 시 lv_test2.dart로 이동
                Navigator.push(context, MaterialPageRoute(builder: (context) => LvTestPage2()));
              },
              child: Text('아직 자취를 준비하고 있어요'),
            ),
          ],
        ),
      ),
    );
  }
}
