import 'package:app_front/Resources/images/image_assets.dart';
import 'package:flutter/material.dart';

class BulletinBoardPage extends StatefulWidget {
  @override
  _BulletinBoardPageState createState() => _BulletinBoardPageState();
}

class _BulletinBoardPageState extends State<BulletinBoardPage> {
  // 가상의 게시글 데이터 리스트
  final List<Post> posts = [
    Post(author: '정재용', likes: 20, title: '성심당 꼭가세요..♥', content: '오늘 오랜만에 성심당 방문해봤습니다. 진짜 말도 안됨 성심당은 전설이다..', tags: ['맛집'], imagePath: ImageAssets.post1),
    Post(author: '강명준', likes: 7, title: '트레이더스에서 쇼핑하실 분!', content: '트레이더스는 너무 양이 많아서요ㅜ 같이 쇼핑하실 분 구해요 !', tags: ['공동구매', '모임'], imagePath: ImageAssets.post2),
    Post(author: '전영주', likes: 38, title: '혹시 여기 연취 안가보신분..', content: '그럼 전 당신을 궁동 주민으로 인정하지 못합니다. 당장 가서 시켜먹어..', tags: ['맛집'], imagePath: ImageAssets.post3),
    Post(author: '이동현', likes: 11, title: '여기 세탁방 왜이렇게 비싸졌어요', content: '현금 얼마 안들고와서 건조기 못돌렸어요 나 그냥 꿉꿉한 빨래 부자 됐음. 누가 좀...', tags: ['질문'], imagePath: ImageAssets.post4),
    Post(author: '재용티비', likes: 15, title: '가구 조립 잘하는 분 구해요', content: '이케아 가구가 이렇게 불친절할줄 몰랐어요. 아닌가 내가 못하는건가', tags: [], imagePath: ImageAssets.post5),
    // 이하 생략
  ];

  // 선택된 태그를 관리하기 위한 상태
  String selectedTag = '맛집';

  void _showPostCreateDialog() {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _contentController = TextEditingController();
    String selectedTag = '맛집'; // 기본값 설정, 사용자가 선택 변경 가능

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('글 작성하기'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                DropdownButton<String>(
                  value: selectedTag,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTag = newValue!;
                    });
                  },
                  items: <String>['맛집', '공동구매', '정보', '질문', '모임', '나들이']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(hintText: "제목을 입력하세요"),
                ),
                TextField(
                  controller: _contentController,
                  decoration: InputDecoration(hintText: "내용을 입력하세요"),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                ElevatedButton(
                  onPressed: () {
                    // 사진 선택 로직 구현
                  },
                  child: Text('사진 선택'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('작성 완료'),
              onPressed: () {
                // 글 작성 로직 구현 (예: 입력 데이터 검증 및 저장)
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('우리 동네 게시판'),
      ),
      body: Column(
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
                        });
                      },
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(post.imagePath), // 게시글 사진
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)), // 게시글 제목
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(post.content.length > 50 ? '${post.content.substring(0, 50)}...' : post.content), // 게시글 내용
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            children: post.tags.map((tag) => Chip(label: Text(tag))).toList(), // 게시글 태그
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPostCreateDialog,
        child: Icon(Icons.create),
      ),
    );
  }

  void _showPostDetails(BuildContext context, Post post) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(post.title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('작성자: ${post.author}'),
                Image.asset(post.imagePath),
                Text(post.content),
                Text('좋아요: ${post.likes}'),
                TextField(
                  decoration: InputDecoration(
                    hintText: '댓글을 입력하세요...',
                  ),
                  onSubmitted: (value) {
                    // 댓글 제출 로직 (예: 상태 업데이트 또는 서버에 저장)
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('닫기'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
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