import 'package:flutter/material.dart';

class TodaysPostCard extends StatelessWidget {
  TodaysPostCard({Key? key}) : super(key: key);

  // 더미 데이터 리스트 생성
  final List<Map<String, String>> posts = List.generate(
    5,
        (index) => {
      'title': '성심당 꼭가세요..👍 $index',
      'content': '오늘 대전 처음 와서 말로만 듣던 성심당 방문해봤습니다.$index',
      'imagePath': 'https://via.placeholder.com/150',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361, // 고정된 너비 설정
      height: 242, // 고정된 높이 설정
      child: ListView.builder(
        itemCount: posts.length,
        physics: BouncingScrollPhysics(), // iOS 스타일의 스크롤 효과
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xFFFAFAFA), // 카드의 배경색 설정 (#FAFAFA)
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // 카드의 모서리 둥글기(border-radius: 10)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Image.network(
                    posts[index]['imagePath']!,
                    width: 100, // 이미지의 너비 설정
                    height: 100, // 이미지의 높이 설정
                    fit: BoxFit.cover, // 이미지의 채우기 방식 설정
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posts[index]['title']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16, // 큰 글씨 크기 설정
                          ),
                        ),
                        Text(
                          posts[index]['content']!,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14, // 작은 글씨 크기 설정
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
