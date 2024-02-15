import 'package:app_front/Resources/images/image_assets.dart';
import 'package:flutter/material.dart';

class BulletinBoardPage extends StatefulWidget {
  @override
  _BulletinBoardPageState createState() => _BulletinBoardPageState();
}

class _BulletinBoardPageState extends State<BulletinBoardPage> {
  // 가상의 게시글 데이터 리스트
  final List<Post> posts = [
    Post(author: '정재용',
        likes: 20,
        title: '성심당 꼭가세요..♥',
        content: '오늘 오랜만에 성심당 방문해봤습니다. 진짜 말도 안됨 성심당은 전설이다..',
        tags: ['맛집'],
        imagePath: ImageAssets.post1),
    Post(author: '강명준',
        likes: 7,
        title: '트레이더스에서 쇼핑하실 분!',
        content: '트레이더스는 너무 양이 많아서요ㅜ 같이 쇼핑하실 분 구해요 !',
        tags: ['공동구매', '모임'],
        imagePath: ImageAssets.post2),
    Post(author: '전영주',
        likes: 38,
        title: '혹시 여기 연취 안가보신분..',
        content: '그럼 전 당신을 궁동 주민으로 인정하지 못합니다. 당장 가서 시켜먹어..',
        tags: ['맛집'],
        imagePath: ImageAssets.post3),
    Post(author: '이동현',
        likes: 11,
        title: '여기 세탁방 왜이렇게 비싸졌어요',
        content: '현금 얼마 안들고와서 건조기 못돌렸어요 나 그냥 꿉꿉한 빨래 부자 됐음. 누가 좀...',
        tags: ['질문'],
        imagePath: ImageAssets.post4),
    Post(author: '재용티비',
        likes: 15,
        title: '가구 조립 잘하는 분 구해요',
        content: '이케아 가구가 이렇게 불친절할줄 몰랐어요. 아닌가 내가 못하는건가',
        tags: [],
        imagePath: ImageAssets.post5),
    // 이하 생략
  ];

  // 선택된 태그를 관리하기 위한 상태
  String selectedTag = '맛집';

  void _showPostCreateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text('글 작성하기', style: TextStyle(color: Colors.white)),
                backgroundColor: Color(0xFF2E39F6),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('태그 선택', style: TextStyle(fontSize: 16)),
                    const Wrap(
                      spacing: 8.0, // 태그 사이의 공간
                      children: <Widget>[
                        Chip(label: Text('맛집')),
                        Chip(label: Text('공동구매')),
                        Chip(label: Text('정보')),
                        Chip(label: Text('질문')),
                    //    Chip(label: Text('모임')),
                    //    Chip(label: Text('나들이')),
                        // 추가 태그들...
                      ],
                    ),
                    SizedBox(height: 8.0), // 태그와 제목 필드 사이의 간격
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '제목', // 직접 제목을 입력받습니다.
                      ),
                      maxLines: 1, // 제목 필드의 최대 라인을 1로 설정
                    ),
                    SizedBox(height: 8.0), // 제목 필드와 내용 필드 사이의 간격
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '내용', // 직접 내용을 입력받습니다.
                      ),
                      maxLines: 5, // 제목 필드의 최대 라인을 1로 설정
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(height: 2.0), // 내용 필드와 사진 추가 버튼 사이의 간격
                    TextButton(
                      onPressed: () {
                        // 사진 추가 로직
                      },
                      child: Text('사진 추가'),
                    ),
                    SizedBox(height: 8.0), // 사진 추가 버튼과 작성 취소 버튼 사이의 간격
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // 다이얼로그 닫기
                          },
                          child: Text('작성 취소'),
                        ),
                        TextButton(
                          onPressed: () {
                            // 작성 완료 로직
                          },
                          child: Text('작성 완료'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // 뒤로 가기 아이콘
          onPressed: () {
            Navigator.pop(context); // 현재 화면에서 뒤로 가기
          },
        ),
        title: Text(
          '우리 동네 게시판',
          style: TextStyle(
            fontWeight: FontWeight.bold, // 타이틀 볼드체
          ),
        ),
        centerTitle: true, // 타이틀을 중앙에 배치
      ),

      floatingActionButton: null, // 기존 floatingActionButton 제거
      body: Stack(
        children: [
          // 여기에 나머지 Scaffold의 body 내용을 추가합니다.
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ['맛집', '공동구매', '정보', '질문', '모임', '나들이'].map((tag) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: FilterChip(
                          label: Text(tag),
                          selected: selectedTag == tag,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedTag = tag;
                            }
                            );
                          },
                          backgroundColor: Colors.grey[200], // 비선택 시 배경 색상
                          selectedColor: Colors.blue, // 선택 시 배경 색상
                          labelStyle: TextStyle(
                            color: selectedTag == tag ? Colors.white : Colors.black, // 선택 여부에 따른 라벨 색상 변경
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // 모서리 둥글기 설정
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return GestureDetector(
                        onDoubleTap: () => _showPostDetails(context, post),
                        child: Card(
                          child: Padding( // Card 내부에 패딩 추가
                            padding: const EdgeInsets.fromLTRB(8.0,22.0,0.0,0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      post.imagePath,
                                      width: 100, // 이미지 너비 고정
                                      height: 100, // 이미지 높이 고정
                                      fit: BoxFit.cover, // 이미지 비율 유지하면서 영역 채우기
                                    ),
                                    Expanded( // Column을 Expanded로 감싸서 Row 내에서 나머지 공간 차지하도록 함
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 시작점에서 정렬
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              post.title,
                                              style: TextStyle(fontWeight: FontWeight.bold), // 게시글 제목
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              post.content.length > 50 ? '${post.content.substring(0, 50)}...' : post.content, // 게시글 내용
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    children: post.tags.map((tag) =>
                                        Container(
                                          margin: EdgeInsets.only(right: 4.0), // 오른쪽으로 마진 추가
                                          child: Chip(
                                            label: Text(tag, style: TextStyle(color: Colors.black)), // 텍스트 스타일 변경
                                            backgroundColor: Color(0xFFCBD7F7), // 배경색 변경
                                            shape: StadiumBorder(), // 모서리를 더 둥글게
                                          ),
                                        )
                                    ).toList(), // 게시글 태그
                                  ),

                                ),
                              ],
                            ),
                          ),
                        )

                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20, // 하단에서의 위치 조정
            left: 0,
            right: 0,
            child: Center( // Center 위젯을 사용하여 수평 중앙 정렬
              child: Container(
                width: 159, // 너비 설정
                height: 48, // 높이 설정
                decoration: BoxDecoration(
                  color: Color(0xFF2E39F6), // 배경색 설정
                  borderRadius: BorderRadius.circular(20), // 모서리 둥글기 설정
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25), // 그림자 색상
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4), // 그림자 위치 조정
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () => _showPostCreateDialog(context), // 탭 이벤트 처리
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '글 작성하기', // 버튼 내 텍스트
                        style: TextStyle(
                          fontSize: 16, // 텍스트 크기
                          color: Color(0xFFFAFAFA), // 텍스트 색상
                          fontWeight: FontWeight.bold, // 텍스트 볼드
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButtonLocation을 사용하지 않거나 변경하지 않습니다.
    );
  }
  void _showPostDetails(BuildContext context, Post post) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text('', style: TextStyle(color: Colors.white)),
                // Title을 비워둡니다.
                backgroundColor: Color(0xFF2E39F6),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("[태그] ${post.tags.join(", ")}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.0),
                    Text('Lv3. ${post.author}'),
                    Divider(), // 작성자와 본문 사이의 구분선
                    Text(post.content),
                    SizedBox(height: 10.0),
                    Image.asset(post.imagePath),
                    SizedBox(height: 10.0),
                    Text('좋아요: ${post.likes}'),
                    SizedBox(height: 8.0),
                    Divider(), // 좋아요와 댓글 사이의 구분선
                    Text('Lv4. 장어은 : 성심당은 킹정이지!!',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0), // 텍스트 필드와 버튼 사이 간격 추가
                        TextButton(
                          onPressed: () {
                            // 댓글 작성 로직
                          },
                          child: Text(
                            '작성',
                            style: TextStyle(
                              fontSize: 14, // 텍스트 크기
                              color: Color(0xFFFAFAFA), // 텍스트 색상
                              fontWeight: FontWeight.bold, // 텍스트 볼드
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF2E39F6), // 버튼 배경 색상
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0), // 버튼 패딩
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// 게시글 데이터를 나타내는 클래스
class Post {
  final String author;
  final int likes;
  final String title;
  final String content;
  final List<String> tags;
  final String imagePath;

  Post({
    required this.author,
    required this.likes,
    required this.title,
    required this.content,
    required this.tags,
    required this.imagePath,
  });
}