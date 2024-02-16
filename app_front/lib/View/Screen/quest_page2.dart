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
              bottomNavigationBar: CustomBottomNavBar(),


    );

  }
}


