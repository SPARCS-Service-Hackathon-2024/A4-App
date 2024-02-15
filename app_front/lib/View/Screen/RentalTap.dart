import 'package:flutter/material.dart';
import 'RentalPage.dart';
import 'BulletinBoardPage.dart';

class RentalTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Page'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Column(
              children: [
                Text(
                  '대여창고',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/image1.jpg', width: 100, height: 100),
                    Image.asset('assets/image2.jpg', width: 100, height: 100),
                    Image.asset('assets/image3.jpg', width: 100, height: 100),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RentalPage()),
              );
            },
            child: Text('더보기'),
          ),
        ],
      ),
    );
  }
}

class BulletinBoardTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bulletin Board Page'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Column(
              children: [
                Text(
                  '우리동네 게시판',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  '게시판 내용을 여기에 보여줍니다.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BulletinBoardPage()),
              );
            },
            child: Text('더보기'),
          ),
        ],
      ),
    );
  }
}


