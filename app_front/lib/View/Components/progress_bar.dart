import 'package:flutter/material.dart';
// percent_indicator 패키지를 사용합니다. 이를 위해 pubspec.yaml에 해당 패키지를 추가해야 합니다.
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key); // 수정된 부분

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).size를 사용하여 현재 화면의 크기를 가져옵니다.
    var size = MediaQuery.of(context).size; // 수정된 부분
    return LinearPercentIndicator(
      width: size.width * 0.55, // 화면 너비의 90%를 사용
      animation: true,
      animationDuration: 2000, // 애니메이션 지속 시간을 1000ms(1초)로 설정
      lineHeight: 20.0,
      leading: const Text("Lev 3"),
      trailing: const Text("Lev 4"),
      percent: 0.4, // 20%를 나타냄
      center: Text("40.0%"),
      progressColor: Color(0xFF2E39F6),
      linearStrokeCap: LinearStrokeCap.roundAll, // 끝을 둥글게 처리
      barRadius: const Radius.circular(10), // 진행 막대의 모서리를 둥글게 처리
    );
  }
}

