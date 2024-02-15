import 'package:app_front/View/Components/app_bar.dart';
import 'package:app_front/View/Screen/lv_test1.dart';
import 'package:app_front/View/Screen/quest_page.dart';
import 'package:flutter/material.dart';

import '../../Resources/images/image_assets.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.8; // 버튼 너비를 화면의 80%로 설정
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = screenHeight * 0.3; // 화면 높이의 20%를 상단 패딩으로 사용

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 자식들을 세로 방향으로 중앙 정렬
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: topPadding), // 동적으로 계산된 상단 패딩 적용
            child: Center(
              child: Image.asset(ImageAssets.logo, height: 100, width: 100),
            ),
          ),
          Spacer(),
          Container(
            width: buttonWidth, // 버튼 너비 설정
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // 소셜 로그인 버튼 클릭 시 동작
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LvTestPage(),
                  ),
                );
              },
              child: const Text('Social Login'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color(0xFF2E39F6), // 버튼의 텍스트 색상 설정 (배경색이 어두울 때 보통 흰색을 사용)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // 버튼의 모서리를 둥글게 설정
                ),
              ),

            ),
          ),// 로고와 하단 버튼 사이의 공간을 최대화
          // 소셜 로그인 버튼

          const SizedBox(height: 10), // 버튼 사이의 간격
          Container(
            width: buttonWidth, // 버튼 너비 설정
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // 일반 로그인 버튼 클릭 시 동작
                // 소셜 로그인 버튼 클릭 시 동작
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LvTestPage(),
                  ),
                );
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color(0xFF2E39F6), // 버튼의 텍스트 색상 설정 (배경색이 어두울 때 보통 흰색을 사용)
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // 버튼의 모서리를 둥글게 설정
                ),
              ),
            ),
          ),
          const SizedBox(height: 20), // 하단 여백

        ],
      ),
      bottomNavigationBar: Container(
          color: Color(0xFFCBD7F7), // BottomAppBar 배경색 설정
        child: Column(
          mainAxisSize: MainAxisSize.min, // 필요한 만큼의 크기만 차지하도록 설정
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 아이콘들을 공간 동등하게 배치
              children: <Widget>[
                IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
                // 다른 아이콘 버튼 추가 가능
              ],
            ),
          ],
        ),
      ),
    );
  }
}