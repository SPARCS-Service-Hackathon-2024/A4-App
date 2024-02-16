import 'package:flutter/material.dart';
import 'package:app_front/View/Screen/quest_page2.dart';

import '../../Resources/Style/app_color.dart';
import '../../Resources/images/image_assets.dart';

class LvTestPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.8; // 버튼 너비를 화면의 80%로 설정
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = screenHeight * 0.3; // 화면 높이의 20%를 상단 패딩으로 사용

    double progressValue = 0.75; // 초기 진행도
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          leading: IconButton(
          icon: const Icon(Icons.arrow_back), // 뒤로 가기 아이콘
          onPressed: () {
            Navigator.pop(context); // 현재 화면에서 뒤로 가기
          },
          ),
          title: const Text(
          '나의 자취 레벨 알아보기',
            style: TextStyle(
            fontWeight: FontWeight.bold, // 타이틀 볼드체
       ),
     ),
          centerTitle: true, // 타이틀을 중앙에 배치
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                   ),
                      SizedBox(height: 10),
                      Row(
                      children: [
                          Image.asset(ImageAssets.welcome2, height: 100, width: 200),
                          Spacer(),
                        ],
                      ),
              const Row(
                children: [
                  Text(
                    '자취,\n 얼마나 준비하셨나요?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // 볼드체
                      fontSize: 32, // 텍스트 크기 32
                    ),
                  ),
                  Spacer(),
                ],
              ),

            SizedBox(height: 30), // 제목과 버튼 사이의 공간 추가
              InkWell(
                onTap: () {
                  // '네 이미 자취중이에요' 선택 시 quest_page.dart로 이동
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuestPage2()));
                },
                child: Container(
                  width: 335, // 적절한 크기 설정
                  height: 80, // 적절한 크기 설정
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/lev1_btn.png'),
                      fit: BoxFit.scaleDown, // 이미지가 컨테이너를 꽉 채우도록 설정
                    ),
                    borderRadius: BorderRadius.circular(10), // 모서리 둥글게 설정
                  ),
                ),
              ),
              const SizedBox(height: 10), // 버튼 사이의 간격
              InkWell(
                onTap: () {
                  // '네 이미 자취중이에요' 선택 시 quest_page.dart로 이동
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuestPage2()));
                },
                child: Container(
                  width: 400, // 적절한 크기 설정
                  height: 80, // 적절한 크기 설정
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/lev2_btn.png'),
                      fit: BoxFit.scaleDown, // 이미지가 컨테이너를 꽉 채우도록 설정
                    ),
                    borderRadius: BorderRadius.circular(10), // 모서리 둥글게 설정
                  ),
                ),
              ),
              const SizedBox(height: 10), // 버튼 사이의 간격
              InkWell(
                onTap: () {
                  // '네 이미 자취중이에요' 선택 시 quest_page.dart로 이동
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuestPage2()));
                },
                child: Container(
                  width: 400, // 적절한 크기 설정
                  height: 80, // 적절한 크기 설정
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/lev3_btn.png'),
                      fit: BoxFit.scaleDown, // 이미지가 컨테이너를 꽉 채우도록 설정
                    ),
                    borderRadius: BorderRadius.circular(10), // 모서리 둥글게 설정
                  ),
                ),
              ),

              const SizedBox(height: 10), // 버튼 사이의 간격
              InkWell(
                onTap: () {
                  // '네 이미 자취중이에요' 선택 시 quest_page.dart로 이동
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuestPage2()));
                },
                child: Container(
                  width: 400, // 적절한 크기 설정
                  height: 80, // 적절한 크기 설정
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/lev4_btn.png'),
                      fit: BoxFit.scaleDown, // 이미지가 컨테이너를 꽉 채우도록 설정
                    ),
                    borderRadius: BorderRadius.circular(10), // 모서리 둥글게 설정
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}

class LevelButton extends StatelessWidget {
  final String level;
  final String label;
  final bool enabled; // 버튼 활성화 여부를 결정하는 변수
  final BuildContext? context; // 네비게이션을 위해 BuildContext 추가

  const LevelButton({Key? key, required this.level, required this.label, this.enabled = true, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: enabled ? Colors.blue : Colors.grey, // 활성화 상태에 따른 색상 변경
        ),
        onPressed: enabled ? () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuestPage2()), // LV3 버튼 클릭 시 QuestPage2로 이동
          );
        } : null, // 비활성화된 버튼은 클릭 동작 없음
        child: Text('$label $level'),
      ),
    );
  }
}