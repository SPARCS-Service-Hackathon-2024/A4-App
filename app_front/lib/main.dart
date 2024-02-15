// main.dart

import 'package:app_front/View/Screen/BulletinBoardPage.dart';
import 'package:app_front/View/Screen/login_page.dart';

import 'package:flutter/material.dart';
import 'package:app_front/View/Screen/RentalTap.dart';
import 'package:app_front/View/Screen/RentalPage.dart';
import 'package:app_front/View/Screen/BulletinBoardPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RentalPage()),
                );
              },
              child: Text('대여창고'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BulletinBoardPage()),
                );
              },
              child: Text('우리동네 게시판'),
            ),
          ),
        ],
      ),
    );
  }
}
