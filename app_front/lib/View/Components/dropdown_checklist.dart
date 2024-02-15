import 'package:flutter/material.dart';


class DropdownChecklist3 extends StatefulWidget {
  @override
  _DropdownChecklist3State createState() => _DropdownChecklist3State();
}

class _DropdownChecklist3State extends State<DropdownChecklist3> {
  bool isExpanded = false;
  List<bool> isChecked; // 체크 상태를 저장할 리스트
  List<String> missions = [
    "등기부 등본",
    "임대차 계약서",
    "중계대상물 확인서",
    "세부 관리비 항목 확인",
  ];



  _DropdownChecklist3State() : isChecked = List<bool>.filled(4, false);

  @override
  Widget build(BuildContext context) {
    // 선택된 항목 수를 계산
    int selectedCount = isChecked.where((item) => item).length;


    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 361,
            height: isExpanded ? (64 + missions.length * 48.0) : 64,
            decoration: BoxDecoration(
              color: isExpanded ? Color(0xFF80A0DE) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Lv3 방 계약시 체크리스트 작성하기", // 선택된 항목 수에 따라 텍스트 변경
                        style: TextStyle(
                            color: isExpanded ? Colors.white : Colors.black
                        ),

                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: isExpanded ? Colors.white : Colors.black),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: isExpanded ? missions.length : 0,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckboxListTile(
                        title: Text(missions[index], style: TextStyle(color: Colors.black)),
                        value: isChecked[index],
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked[index] = value!;
                          });
                        },
                        activeColor: Color(0xFF80A0DE),
                        checkColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.leading,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class DropdownChecklist4 extends StatefulWidget {
  @override
  _DropdownChecklist4State createState() => _DropdownChecklist4State();
}

class _DropdownChecklist4State extends State<DropdownChecklist4> {
  bool isExpanded = false;
  List<bool> isChecked; // 체크 상태를 저장할 리스트
  List<String> missions = [
    "이삿짐 싸기",
    "짐 옮기기",
  ];



  _DropdownChecklist4State() : isChecked = List<bool>.filled(4, false);

  @override
  Widget build(BuildContext context) {
    // 선택된 항목 수를 계산
    int selectedCount = isChecked.where((item) => item).length;


    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 361,
            height: isExpanded ? (64 + missions.length * 48.0) : 64,
            decoration: BoxDecoration(
              color: isExpanded ? Color(0xFF80A0DE) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Lv4 자취방 계약하기", // 선택된 항목 수에 따라 텍스트 변경
                        style: TextStyle(
                            color: isExpanded ? Colors.white : Colors.black
                        ),

                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: isExpanded ? Colors.white : Colors.black),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: isExpanded ? missions.length : 0,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckboxListTile(
                        title: Text(missions[index], style: TextStyle(color: Colors.black)),
                        value: isChecked[index],
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked[index] = value!;
                          });
                        },
                        activeColor: Color(0xFF80A0DE),
                        checkColor: Colors.white,
                        controlAffinity: ListTileControlAffinity.leading,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class FDropdownChecklist extends StatefulWidget {
  @override
  _FDropdownChecklistState createState() => _FDropdownChecklistState();
}

class _FDropdownChecklistState extends State<FDropdownChecklist> {
  bool isExpanded = false;
  List<bool> isChecked; // 체크 상태를 저장할 리스트
  List<String> missions = [
    "집에 가기",
    "집에 가기",

  ];





  _FDropdownChecklistState() : isChecked = List<bool>.filled(4, true);


  @override
  Widget build(BuildContext context) {
    // 선택된 항목 수를 계산
    int selectedCount = isChecked.where((item) => item).length;


    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 361,
            height: isExpanded ? (64 + missions.length * 48.0) : 64,
            decoration: BoxDecoration(
              color: isExpanded ? Color(0xFF80A0DE) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Lv1 달성 완료!",
                        style: TextStyle(
                            color: isExpanded ? Colors.white : Colors.black
                        ),

                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: isExpanded ? Colors.white : Colors.black),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: isExpanded ? missions.length : 0,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckboxListTile(
                        title: Text(missions[index], style: TextStyle(color: Colors.black)),
                        value: isChecked[index],
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked[index] = value!;
                          });
                        },
                        activeColor: Color(0xFFCBD7F7),
                        checkColor: Color(0xFF2E39F6),
                        controlAffinity: ListTileControlAffinity.leading,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}




class FDropdownChecklist2 extends StatefulWidget {
  @override
  _FDropdownChecklist2State createState() => _FDropdownChecklist2State();
}

class _FDropdownChecklist2State extends State<FDropdownChecklist2> {
  bool isExpanded = false;
  List<bool> isChecked; // 체크 상태를 저장할 리스트
  List<String> missions = [
    "밥먹기",
    "치킨먹기",

  ];





  _FDropdownChecklist2State() : isChecked = List<bool>.filled(4, true);


  @override
  Widget build(BuildContext context) {
    // 선택된 항목 수를 계산
    int selectedCount = isChecked.where((item) => item).length;


    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 361,
            height: isExpanded ? (64 + missions.length * 48.0) : 64,
            decoration: BoxDecoration(
              color: isExpanded ? Color(0xFF80A0DE) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Lv2 달성 완료 !",
                        style: TextStyle(
                            color: isExpanded ? Colors.white : Colors.black
                        ),

                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: isExpanded ? Colors.white : Colors.black),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: isExpanded ? missions.length : 0,
                    itemBuilder: (BuildContext context, int index) {
                      return CheckboxListTile(
                        title: Text(missions[index], style: TextStyle(color: Colors.black)),
                        value: isChecked[index],
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked[index] = value!;
                          });
                        },
                        activeColor: Color(0xFFCBD7F7),
                        checkColor: Color(0xFF2E39F6),
                        controlAffinity: ListTileControlAffinity.leading,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

