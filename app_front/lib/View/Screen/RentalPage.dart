import 'package:flutter/material.dart';
import '../../Resources/images/image_assets.dart'; // 이미지 경로가 맞는지 확인하세요.
import 'package:app_front/View/Screen/RentalPage.dart';
import 'package:app_front/View/Screen/BulletinBoardPage.dart';

class RentalPage extends StatelessWidget {
  final List<Item> items = [
    Item(name: '공구 세트', description: '드라이버, 펜치, 스패너 등을 포함한 공구 세트 ', imagePath: ImageAssets.item1),
    Item(name: '전동 드릴', description: '다용도 드릴(타공용, 가구 조립용)', imagePath: ImageAssets.item2),
    Item(name: '접이식 핸드카트', description: '이사 및 짐 옮기기 용 접이식 핸드카트', imagePath: ImageAssets.item3),
    Item(name: '돗자리', description: '나들이용 돗자리(건조 후 반납해주세요)', imagePath: ImageAssets.item4),
    Item(name: '빔프로젝터', description: '**대여, 반납 시 기기 상태 확인합니다.', imagePath: ImageAssets.item5),
    Item(name: '아이스박스', description: '11L, 20L 아이스박스 (아이스팩 포함)', imagePath: ImageAssets.item6),
    // 이하 생략, 더 많은 물품을 추가할 수 있습니다.
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('우리 동네 대여 창고'),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => _showWarehouseLocation(context),
            child: Text('대여 창고 위치 확인하기'),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onDoubleTap: () => _showRentDialog(context, items[index]),
                  child: ListTile(
                    leading: Image.asset(items[index].imagePath), // 물품 이미지
                    title: Text(items[index].name), // 물품 이름
                    subtitle: Text(items[index].description), // 물품 설명
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // '없는 품목 요청하기' 기능 구현
            },
            child: Text('없는 품목 요청하기'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // '내 물건 등록하기' 기능 구현
            },
            child: Text('내 물건 등록하기'),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  void _showWarehouseLocation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('대여 창고 위치 확인하기'),
          content: Image.asset(ImageAssets.mapImage),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('닫기'),
            ),
          ],
        );
      },
    );
  }

  void _showRentDialog(BuildContext context, Item item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('대여 신청하기'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.asset(item.imagePath), // 물품 이미지
                Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)), // 물품 이름
                Text(item.description), // 물품 설명
                SizedBox(height: 10),
                Text('대여 가능 일수: ${item.availableDays}일'), // 대여 가능 일수
                Text('보유량: ${item.quantity}개'), // 보유량
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('취소'),
            ),
            ElevatedButton(
              onPressed: () {
                // 대여 신청 로직 구현
                Navigator.of(context).pop();
              },
              child: Text('대여 신청'),
            ),
          ],
        );
      },
    );
  }
}

class Item {
  final String name;
  final String description;
  final String imagePath;
  final int availableDays;
  final int quantity;

  Item({
    required this.name,
    required this.description,
    required this.imagePath,
    this.availableDays = 7, // 기본값으로 7일 설정
    this.quantity = 2, // 기본값으로 2개 설정
  });
}


