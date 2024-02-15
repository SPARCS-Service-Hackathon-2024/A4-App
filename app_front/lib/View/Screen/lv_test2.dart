import 'package:flutter/material.dart';
import 'package:app_front/View/Screen/quest_page2.dart';

class LvTestPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('나의 자취 레벨 알아보기'),
        backgroundColor: Color(0xFF2E39F6),
        elevation: 0, // AppBar 음영 제거
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '어떤 단계이신가요?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 30), // 제목과 버튼 사이의 공간 추가
            LevelButton(level: 'LV1', label: '방금 이사 고민을 시작했어요!'),
            LevelButton(level: 'LV2', label: '이제 집을 찾아봐야 해요!'),
            LevelButton(level: 'LV3', label: '부동산 계약을 앞두고 있어요!'),
            LevelButton(level: 'LV4', label: '새로운 지역으로 정착을 해야해요!'),
          ],
        ),
      ),
    );
  }
}

class LevelButton extends StatelessWidget {
  final String level;
  final String label;
  final bool enabled; // 버튼 활성화 여부를 결정하는 변수
  final BuildContext? context; // 네비게이션을 위해 BuildContext 추가

  const LevelButton({Key? key, required this.level, required this.label, this.enabled = true, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: enabled ? Colors.blue : Colors.grey, // 활성화 상태에 따른 색상 변경
        ),
        onPressed: enabled ? () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuestPage2()), // LV3 버튼 클릭 시 QuestPage2로 이동
          );
        } : null, // 비활성화된 버튼은 클릭 동작 없음
        child: Text('$label $level'),
      ),
    );
  }
}