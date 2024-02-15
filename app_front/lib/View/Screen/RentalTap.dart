import 'package:app_front/Resources/images/image_assets.dart';
import 'package:app_front/View/Screen/BulletinBoardPage.dart';
import 'package:app_front/View/Screen/RentalPage.dart';
import 'package:flutter/material.dart';

class RentalTapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('가취'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // 알림 페이지로 이동
            },
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: '우리 동네 게시판',
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '우리 동네'),
        ],
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
            child: Text('더보기 >', style: TextStyle(color: Colors.blue)),
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
    return Column(
      children: [
        ListTile(
          leading:Image.asset(ImageAssets.post1),
          title: Text("성심당 꼭 가세요..♥"),
          subtitle: Text("오늘 오랜만에 성심당 방문해봤습니다."),
        ),
        ListTile(
          leading: Image.asset(ImageAssets.post2),
          title: Text("트레이더스에서 쇼핑하실 분!"),
          subtitle: Text("트레이더스는 너무 양이 많아서요ㅜ"),
        ),
      ],
    );
  }
}

class RentalItemExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 정적 데이터를 사용하여 대여창고 아이템 예시 구성
    return Column(
      children: [
        ListTile(
          leading: Image.asset(ImageAssets.item2),
          title: Text("전동드릴"),
          subtitle: Text("다용도 드릴 (타공 및 나사 조임용)"),
        ),
        ListTile(
          leading: Image.asset(ImageAssets.item3),
          title: Text("접이식 핸드카트"),
          subtitle: Text("이사 및 짐 옮기기 용 접이식 핸드카트"),
        ),
      ],
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
