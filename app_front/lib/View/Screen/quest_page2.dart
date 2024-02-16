import 'package:app_front/Resources/images/image_assets.dart';
import 'package:app_front/View/Components/custom_bottomnavbar.dart';
import 'package:app_front/View/Components/todays_postcard.dart';
import 'package:app_front/View/Screen/RentalTap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/User.dart';
import '../../Resources/Style/app_color.dart';
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
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: Padding( // leading에 Padding 위젯을 사용하여 마진 적용
          padding: const EdgeInsets.only(left: 10.0), // 왼쪽에만 마진 적용
          child: Image.asset(ImageAssets.bluelogo), // 로고 이미지
        ),
        actions: <Widget>[ // actions 리스트에 아이콘 버튼 추가
          Padding( // IconButton에 Padding 위젯을 사용하여 마진 적용
            padding: const EdgeInsets.only(right: 8.0), // 오른쪽에만 마진 적용
            child: IconButton(
              icon: Icon(Icons.notifications), // notification 아이콘
              onPressed: () {
                // 알림 버튼 클릭 시 수행할 작업
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView( // Allows the column to be scrollable if content exceeds screen height
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 가로축 중앙 정렬
                children: [
                  ProfileCard(),
                ],// Your custom ProfileCard widget
              ),
              SizedBox(height: 10,),

              Material(
                  color: AppColors.backgroundColor,
                  child: Column(

                  children: [
                    const Text(
                      '내가 완료한 퀘스트',
                      style: TextStyle(
                      fontWeight: FontWeight.bold, // 타이틀 볼드체
                        fontSize: 20,
                    ),
                  ),
                    SizedBox(height: 10,),
                     FDropdownChecklist(),
                    SizedBox(height: 20),
                     FDropdownChecklist2(),
                      SizedBox(height: 20),
                    const Text(
                      '진행중인 퀘스트',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // 타이틀 볼드체
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10,),
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
              bottomNavigationBar: CustomBottomNavBar(),


    );

  }
}


