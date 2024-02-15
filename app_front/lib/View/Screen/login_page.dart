import 'package:app_front/View/Components/app_bar.dart';
import 'package:flutter/material.dart';

import '../../Resources/images/image_assets.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.8; // 버튼 너비를 화면의 80%로 설정
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = screenHeight * 0.2; // 화면 높이의 20%를 상단 패딩으로 사용

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
            child: ElevatedButton(
              onPressed: () {
                // 소셜 로그인 버튼 클릭 시 동작
              },
              child: const Text('Social Login'),
            ),
          ),// 로고와 하단 버튼 사이의 공간을 최대화

          const SizedBox(height: 10), // 버튼 사이의 간격
          Container(
            width: buttonWidth, // 버튼 너비 설정
            child: ElevatedButton(
              onPressed: () {
                // 일반 로그인 버튼 클릭 시 동작
              },
              child: const Text('Login'),
            ),
          ),
          const SizedBox(height: 20), // 하단 여백
          const CustomAppBar(),

        ],
      ),
    );
  }
}