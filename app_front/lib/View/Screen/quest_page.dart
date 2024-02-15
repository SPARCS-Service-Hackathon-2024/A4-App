import 'package:app_front/View/Components/todays_postcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/User.dart';
import '../Components/misson_card.dart';
import '../Components/profile_card.dart';
// Assuming ProfileCard and MissionCard are defined elsewhere and imported.



class QuestPage extends StatefulWidget {
  const QuestPage({Key? key}) : super(key: key);

  @override
  State<QuestPage> createState() => _QuestPageState();
}

class _QuestPageState extends State<QuestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView( // Allows the column to be scrollable if content exceeds screen height
          child: Column(
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.center, // 가로축 중앙 정렬
            children: [
              ProfileCard(),
              ],// Your custom ProfileCard widget
            ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft, // 텍스트를 왼쪽으로 정렬합니다.
                  child: Text(
                    '내 다음 미션',
                    style: GoogleFonts.workSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold, // 볼드체로 설정합니다.
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 가로축 중앙 정렬
                children: [
                  MissionCard(),
                ],// Your custom ProfileCard widget
              ),
              // Your custom MissionCard widget
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft, // 텍스트를 왼쪽으로 정렬합니다.
                  child: Text(
                    '오늘 주목할 글',
                    style: GoogleFonts.workSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold, // 볼드체로 설정합니다.
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 가로축 중앙 정렬
                children: [
                  TodaysPostCard(),
                ],// Your custom ProfileCard widget
              ),

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
                IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
                // 다른 아이콘 버튼 추가 가능
              ],
            ),
          ],
        ),
      ),
      );

  }
}


