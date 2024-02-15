import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0), // 좌우 여백 추가
      height: 60.0, // 앱 바의 높이
      color: Colors.white, // 앱 바의 배경색
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 아이콘들을 양 끝으로 정렬
        children: [
          // 홈 아이콘
          IconButton(
            icon: Icon(Icons.home, color: Colors.black),
            onPressed: () {
              // 홈 아이콘 클릭 시 동작
            },
          ),
          // 알림 아이콘
          IconButton(
            icon: Icon(Icons.holiday_village, color: Colors.black),
            onPressed: () {
              // 알림 아이콘 클릭 시 동작
            },
          ),
          // 문서 아이콘
          IconButton(
            icon: Icon(Icons.description, color: Colors.black),
            onPressed: () {
              // 문서 아이콘 클릭 시 동작
            },
          ),
          // 계정 아이콘
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              // 계정 아이콘 클릭 시 동작
            },
          ),
        ],
      ),
      ),
    );
  }
}
