import 'package:flutter/material.dart';

class MissionCard extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate the width and height based on the screen size
    double cardWidth = screenWidth * 0.8;
    double cardHeight = screenHeight * 0.2;
    return Card(
      color: Color(0xFFCBD7F7), // 카드의 배경색 설정
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // 카드의 모서리 둥글기
      ),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        padding: const EdgeInsets.all(16.0), // 내부 여백 설정
        child: Column(
          mainAxisSize: MainAxisSize.min, // 내용에 맞게 카드 크기 조정
          children: <Widget>[
            const Text(
              '방 계약시 체크리스트 작성하기', // 더미 텍스트
              style: TextStyle(
                fontSize: 16, // 텍스트 크기 설정
                fontWeight: FontWeight.bold, // 글씨 굵기 설정
                color: Colors.black, // 텍스트 색상 설정
              ),
            ),
            const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                alignment: Alignment.centerRight, // 텍스트를 왼쪽으로 정렬합니다.
                // 텍스트와 버튼 사이의 간격 설정
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10), // 텍스트와 프로그레스 바 사이의 간격 설정
                    ElevatedButton(
                    onPressed: () {
                    // 버튼 클릭 시 실행될 동작
                    },
                     child: Text('확인하러 가기'),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Color(0xFF2E39F6), // 버튼의 텍스트 색상 설정 (배경색이 어두울 때 보통 흰색을 사용)
                    shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20), // 모서리의 반경을 20으로 설정
                  ),
                    ),
                    ),
                    ],

                ),
              ),
              ),
        ],
            ),
          ),

    );

  }
}
