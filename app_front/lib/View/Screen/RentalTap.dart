import 'package:app_front/Resources/images/image_assets.dart';
import 'package:app_front/View/Screen/BulletinBoardPage.dart';
import 'package:app_front/View/Screen/RentalPage.dart';
import 'package:flutter/material.dart';

import '../../Resources/Style/app_color.dart';

class RentalTapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // 뒤로 가기 아이콘
            onPressed: () {
              Navigator.pop(context); // 현재 화면에서 뒤로 가기
            },
          ),
          title: const Text(
            '가취',
            style: TextStyle(
              fontWeight: FontWeight.bold, // 타이틀 볼드체
            ),
          ),
          centerTitle: true, // 타이틀을 중앙에 배치
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                // 알림 페이지로 이동
              },
            ),
          ],
        ),

    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title:
              '우리 동네 게시판',
              onTapMore: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BulletinBoardPage()));
              },
            ),
            // 예시 게시글
            BoardItemExample(),
            SectionTitle(
              title: '우리 동네 대여 추천',
              onTapMore: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RentalPage()));
              },
            ),
            // 예시 물품
            RentalItemExample(),
          ],
        ),
      ),
    ),
      bottomNavigationBar: Container(
        color: Color(0xFFCBD7F7),
        child: Column(
          mainAxisSize: MainAxisSize.min, // 필요한 만큼의 크기만 차지하도록 설정
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 아이콘들을 공간 동등하게 배치
              children: <Widget>[
                IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
                IconButton(
                  icon: Icon(Icons.holiday_village),
                  onPressed: () {
                    // search 아이콘 클릭 시 RentalTap 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RentalTapPage()),
                    );
                  },
                ),
                // 다른 아이콘 버튼 추가 가능
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTapMore;

  SectionTitle({required this.title, this.onTapMore});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: onTapMore,
            child: Text('더보기 >', style: TextStyle(color: Color(0xFF5D5D5D))),
          ),
        ],
      ),
    );
  }
}


class BoardItemExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 정적 데이터를 사용하여 게시글 아이템 예시 구성
    return Card(
      child: Padding( // Card 내부에 패딩 추가
        padding: const EdgeInsets.fromLTRB(8.0, 22.0, 0.0, 0.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(ImageAssets.post1, width: 100, height: 100,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 시작점에서 정렬
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "성심당 꼭 가세요..♥",
                        style: TextStyle(fontWeight: FontWeight.bold), // 게시글 제목
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "오늘 오랜만에 성심당 방문해봤습니다",
                        style: TextStyle(
                            fontWeight: FontWeight.normal), // 게시글 제목
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(ImageAssets.post2, width: 100, height: 100,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 시작점에서 정렬
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "트레이더스에서 쇼핑하실 분!",
                        style: TextStyle(fontWeight: FontWeight.bold), // 게시글 제목
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "트레이더스는 너무 양이 많아서요ㅜ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal), // 게시글 제목
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RentalItemExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 정적 데이터를 사용하여 대여창고 아이템 예시 구성
    return Card(
      child: Padding( // Card 내부에 패딩 추가
        padding: const EdgeInsets.fromLTRB(8.0, 22.0, 0.0, 0.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(ImageAssets.item2, width: 100, height: 100,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 시작점에서 정렬
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "전동드릴",
                        style: TextStyle(fontWeight: FontWeight.bold), // 게시글 제목
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "다용도 드릴 (타공 및 나사 조임용",
                        style: TextStyle(
                            fontWeight: FontWeight.normal), // 게시글 제목
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(ImageAssets.item3, width: 100, height: 100,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 시작점에서 정렬
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "접이식 핸드카트",
                        style: TextStyle(fontWeight: FontWeight.bold), // 게시글 제목
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "이사 및 짐 옮기기 용 접이식 핸드카트",
                        style: TextStyle(
                            fontWeight: FontWeight.normal), // 게시글 제목
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}


class RentalRecommendationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 여기서 대여 추천 아이템을 동적으로 생성하거나 정적으로 리스트를 반환할 수 있습니다.
    return Container(); // 예시를 위해 비워둠
  }
}
