class User {
  String _name; // 이름
  int _experience; // 경험치
  int _level; // 레벨
  String _region; // 지역

  // User 클래스의 생성자
  User(this._name, this._experience, this._level, this._region);

  // Getter와 Setter를 사용하여 필드에 접근
  // 이름
  String get name => _name;
  set name(String newName) => _name = newName;

  // 경험치
  int get experience => _experience;
  set experience(int newExperience) {
    _experience = newExperience;
    // 경험치를 설정할 때 추가적인 로직을 여기에 포함시킬 수 있습니다.
    // 예: 레벨 업 조건 확인
    if (_experience >= 100) {
      _level++;
      _experience -= 100; // 레벨업 후 경험치 초기화 (예제 로직)
    }
  }

  // 레벨
  int get level => _level;
  set level(int newLevel) => _level = newLevel;

  // 지역
  String get region => _region;
  set region(String newRegion) => _region = newRegion;
}
