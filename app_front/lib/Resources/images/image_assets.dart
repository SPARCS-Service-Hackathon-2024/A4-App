// 이미지 파일 경로를 가져와서 상수로 이름을 붙여주기 위한 클래스

class ImageAssets
{
  // 이미지를 바로 assets에서 링크로 가져오는 건 위험한 코드(하드코딩)
  // => 따라서 이미지를 static const 상수로 저장해둬서 이미지 사용시 해당 상수 호출하면 됨

  // 아래 로고는 예시를 위해 삽입해둠.
  // 현재 로고는 더미 이미지 사용함 -> 나중에 나오면 해당 로고 파일로 이미지만 변경하면 됨.
  static const logo = 'assets/images/intro_logo.png';
  static const bluelogo = 'assets/images/logo_blue.png';
  static const welcome = 'assets/images/welcome_commment.png';
  static const welcome2 = 'assets/images/welcome2.png';
  static const lev1_btn = 'assets/images/lev1_btn.png';
  static const lev2_btn = 'assets/images/lev2_btn.png';
  static const lev3_btn = 'assets/images/lev3_btn.png';
  static const lev4_btn = 'assets/images/lev4_btn.png';
  static const mapImage = 'assets/images/mapImage.jpg';
  static const item1 = 'assets/images/item1.png';
  static const item2 = 'assets/images/item2.png';
  static const item3 = 'assets/images/item3.png';
  static const item4 = 'assets/images/item4.png';
  static const item5 = 'assets/images/item5.png';
  static const item6 = 'assets/images/item6.png';
  static const post1 = 'assets/images/post1.png';
  static const post2 = 'assets/images/post2.png';
  static const post3 = 'assets/images/post3.png';
  static const post4 = 'assets/images/post4.png';
  static const post5 = 'assets/images/post5.png';

}