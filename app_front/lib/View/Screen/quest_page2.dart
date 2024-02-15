import 'package:app_front/View/Components/todays_postcard.dart';
import 'package:app_front/View/Screen/RentalTap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/User.dart';
import '../Components/dropdown_checklist.dart';
import '../Components/misson_card.dart';
import '../Components/profile_card.dart';
// Assuming ProfileCard and MissionCard are defined elsewhere and imported.



class QuestPage2 extends StatefulWidget {
  const QuestPage2({Key? key}) : super(key: key);

  @override
  State<QuestPage2> createState() => _QuestPage2State();
}

class _QuestPage2State extends State<QuestPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView( // Allows the column to be scrollable if content exceeds screen height
          child: Column(
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 가로축 중앙 정렬
                children: [
                  ProfileCard(),
                ],// Your custom ProfileCard widget
              ),
              SizedBox(height: 10,),

              Material(
                  child: Column(
                  children: [
                     FDropdownChecklist(),
                    SizedBox(height: 20),
                     FDropdownChecklist(),
                      SizedBox(height: 20),
                      DropdownChecklist3(),
                    SizedBox(height: 20),
                    DropdownChecklist4(),
              ],
            ),
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


