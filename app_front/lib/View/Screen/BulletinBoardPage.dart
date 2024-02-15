import 'package:flutter/material.dart';

class BulletinBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('우리 동네 게시판'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('게시글 1'),
          ),
          ListTile(
            title: Text('게시글 2'),
          ),
          ListTile(
            title: Text('게시글 3'),
          ),
          ListTile(
            title: Text('게시글 4'),
          ),
          ListTile(
            title: Text('게시글 5'),
          ),
          ListTile(
            title: Text('게시글 6'),
          ),
          ListTile(
            title: Text('게시글 7'),
          ),
          ListTile(
            title: Text('게시글 8'),
          ),
          ListTile(
            title: Text('게시글 9'),
          ),
          ListTile(
            title: Text('게시글 10'),
          ),
        ],
      ),
    );
  }
}
