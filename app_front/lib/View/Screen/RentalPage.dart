import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Resources/images/image_assets.dart'; // 이미지 경로가 맞는지 확인하세요.

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
    bool isChecked = false; // 체크박스의 상태를 관리하는 변수


    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.9; // 버튼 너비를 화면의 80%로 설정
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
          '우리 동네 대여 창고',
          style: TextStyle(
            fontWeight: FontWeight.bold, // 타이틀 볼드체
          ),
        ),
        centerTitle: true, // 타이틀을 중앙에 배치
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,5.0,10.0,0), // 원하는 패딩 값 설정

              child: Row(
                children: [
                  Container(
                    width: 150, // 버튼 너비 설정
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                            () => _showWarehouseLocation(context);
                      },
                      child: Text(
                        '대여 창고 위치 확인하기',
                        style: TextStyle(
                          fontSize: 10, // 텍스트 크기 설정
                          color: Colors.black, // 텍스트 색상 직접 설정하는 경우 (옵션)
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Color(0xFFFAFAFA), // 버튼의 텍스트 색상 설정 (배경색이 어두울 때 보통 흰색을 사용)
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // 버튼의 모서리를 둥글게 설정
                        ),
                      ),

                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(
                    child: CheckboxListTile(
                      value: isChecked,
                      onChanged: (bool? value) {
                        isChecked = value!;
                      },
                      title: const Text('대여가능 건만 보기',
                        style: TextStyle(
                          fontSize: 11, // 텍스트 크기 설정
                          color: Colors.black, // 텍스트 색상 직접 설정하는 경우 (옵션)
                        ),), // 체크박스 옆에 표시될 텍스트
                      controlAffinity: ListTileControlAffinity.leading, // 체크박스를 텍스트 앞에 배치
                    ),
                  ),
                ],
              ),
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
            Container(
              width: buttonWidth, // 버튼 너비 설정
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                },
                child: const Text('없는 품목 요청하기'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFFCBD7F7), // 버튼의 텍스트 색상 설정 (배경색이 어두울 때 보통 흰색을 사용)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 버튼의 모서리를 둥글게 설정
                  ),
                ),

              ),
            ),// 로고와 하단 버
            SizedBox(height: 16.0),
            Container(
              width: buttonWidth, // 버튼 너비 설정
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // 소셜 로그인 버튼 클릭 시 동작
                },
                child: const Text('내 물건 등록하기'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFF80A0DE), // 버튼의 텍스트 색상 설정 (배경색이 어두울 때 보통 흰색을 사용)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 버튼의 모서리를 둥글게 설정
                  ),
                ),

              ),
            ),// 로고와 하단 버
            SizedBox(height: 16.0),
          ],
        ),
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