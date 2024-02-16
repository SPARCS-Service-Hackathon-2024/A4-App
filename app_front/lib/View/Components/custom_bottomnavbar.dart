import 'package:app_front/View/Screen/quest_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screen/BulletinBoardPage.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex = 0; // 현재 선택된 페이지 인덱스
  late final Function(int) onTap; // 아이콘 탭 콜백 함수


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10), // 상하 패딩
      decoration: const BoxDecoration(
        color: Color(0xFFFAFAFA), // 배경색
        boxShadow: [ // 그림자 효과
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.only( // 위쪽 모서리 둥글게
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 아이콘 버튼들을 균등하게 배치
        children: [
          // 첫 번째 아이콘과 라벨
          GestureDetector(
            onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const QuestPage2()));
    },
            child: Column(
              mainAxisSize: MainAxisSize.min, // 컬럼 크기를 자식 크기에 맞게 조절
              children: [
                if (selectedIndex == 0) // 선택된 아이콘 위에 파란색 점 표시
                  Container(
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                Icon(
                  Icons.account_circle,
                  color: selectedIndex == 0 ? Colors.black : const Color(0xFFC6C6C6),
                ),
                Text(
                  '마이',
                  style: TextStyle(
                    color: selectedIndex == 0 ? Colors.black : const Color(0xFFC6C6C6),
                  ),
                ),
              ],
            ),
          ),
          // 두 번째 아이콘과 라벨
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BulletinBoardPage()));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min, // 컬럼 크기를 자식 크기에 맞게 조절
              children: [
                if (selectedIndex == 1) // 선택된 아이콘 위에 파란색 점 표시
                  Container(
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                Icon(
                  Icons.holiday_village,
                  color: selectedIndex == 1 ? Colors.black : const Color(0xFFC6C6C6),
                ),
                Text(
                  '우리동네',
                  style: TextStyle(
                    color: selectedIndex == 1 ? Colors.black : const Color(0xFFC6C6C6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

