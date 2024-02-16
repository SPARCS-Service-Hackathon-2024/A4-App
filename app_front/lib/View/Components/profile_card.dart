import 'package:app_front/Resources/images/image_assets.dart';
import 'package:app_front/View/Components/progress_bar.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 여기서 커스텀 카드의 너비와 높이를 설정합니다.

    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9; // 버튼 너비를 화면의 80%로 설정
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = screenHeight * 0.25; // 화면 높이의 20%를 상단 패딩으로 사용


    return Container(
        width: cardWidth, // 너비 설정
        height: cardHeight, // 높이 설정

        child: Card(
          margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0), // 내부 여백 설정
          color: const Color(0xFFFAFAFA),
          elevation: 5.0, // 카드의 배경색 설정 (#FAFAFA)
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
          // 카드의 모서리 둥글기(border-radius: 10)

      ),
      child: Container(
        color: const Color(0xFFFAFAFA),

        width: cardWidth,
        height: cardHeight,
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0), // 내부 여백 설정
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 자식들을 세로로 시작점에 정렬
          children: <Widget>[
            Row(
              children: [
                const Column(
                  children: [
                    Text(
                      '안녕하세요,', // 더미 텍스트
                      style: TextStyle(
                        fontSize: 16, // 텍스트 크기 설정
                        color: Colors.black, // 텍스트 색상 설정
                      ),
                    ),
                    Text(
                      '예비 자취 마스터 정재용님! ', // 더미 텍스트
                      style: TextStyle(
                        fontSize: 20, // 텍스트 크기 설정
                        color: Colors.black, // 텍스트 색상 설정
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Image.asset(ImageAssets.user, width: 50, height: 50,),

              ],
            ),

            const SizedBox(height: 20), // 텍스트와 프로그레스 바 사이의 간격 설정
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Expanded(
                child: ProgressBar(),
              ),
            ],
            ),

          ],
        ),
      ),
        ),

    );
  }
}
