// 이미지 파일 경로를 가져와서 상수로 이름을 붙여주기 위한 클래스

class ImageAssets
{
  // 이미지를 바로 assets에서 링크로 가져오는 건 위험한 코드(하드코딩)
  // => 따라서 이미지를 static const 상수로 저장해둬서 이미지 사용시 해당 상수 호출하면 됨

  // 아래 로고는 예시를 위해 삽입해둠.
  // 현재 로고는 더미 이미지 사용함 -> 나중에 나오면 해당 로고 파일로 이미지만 변경하면 됨.
  static const logo = 'assets/images/logo.png';
  static const mapImage = 'assets/images/mapImage.jpg';
  static const item1 = 'assets/images/item1.png';
  static const item2 = 'assets/images/item2.png';
  static const item3 = 'assets/images/item3.png';
  static const item4 = 'assets/images/item4.png';
  static const item5 = 'assets/images/item5.png';
  static const item6 = 'assets/images/item6.png';

}