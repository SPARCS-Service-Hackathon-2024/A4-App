import 'package:flutter/material.dart';
import 'package:app_front/View/Screen/lv_test2.dart';
import 'package:app_front/View/Screen/quest_page.dart';

import '../../Resources/images/image_assets.dart';

class LvTestPage extends StatefulWidget {
  @override
  _LvTestPageState createState() => _LvTestPageState();
}

class _LvTestPageState extends State<LvTestPage> {
  double progressValue = 0.35; // 초기 진행도

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.8; // 버튼 너비를 화면의 80%로 설정
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = screenHeight * 0.3; // 화면 높이의 20%를 상단 패딩으로 사용

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // 뒤로 가기 아이콘
          onPressed: () {
            Navigator.pop(context); // 현재 화면에서 뒤로 가기
          },
        ),
        title: Text(
          '나의 자취 레벨 알아보기',
          style: TextStyle(
            fontWeight: FontWeight.bold, // 타이틀 볼드체
          ),
        ),
        centerTitle: true, // 타이틀을 중앙에 배치
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
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset(ImageAssets.welcome, height: 100, width: 200),
                Spacer(),
              ],
            ),
            const Row(
              children: [
                Text(
                  '현재 자취중이신가요?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // 볼드체
                    fontSize: 32, // 텍스트 크기 32
                  ),
                ),
                Spacer(),
              ],
            ),



            Spacer(),

            Container(
              width: buttonWidth, // 버튼 너비 설정
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // '네 이미 자취중이에요' 선택 시 quest_page.dart로 이동
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LvTestPage2()));

                },
                child: const Text('네 이미 자취중이에요'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFF2E39F6), // 버튼의 텍스트 색상 설정 (배경색이 어두울 때 보통 흰색을 사용)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 버튼의 모서리를 둥글게 설정
                  ),
                ),

              ),
            ),
            const SizedBox(height: 10), // 버튼 사이의 간격
            Container(
              width: buttonWidth, // 버튼 너비 설정
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LvTestPage2()));
                },
                child: const Text('아직 자취를 준비하고 있어요'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFF2E39F6), // 버튼의 텍스트 색상 설정 (배경색이 어두울 때 보통 흰색을 사용)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 버튼의 모서리를 둥글게 설정
                  ),
                ),

              ),
            ),// 로고와 하단 버튼 사이
            SizedBox(height: 10),

        ],



        ),
      ),
    );
  }
}
