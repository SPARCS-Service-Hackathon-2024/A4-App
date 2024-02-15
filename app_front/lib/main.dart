// main.dart

import 'package:app_front/View/Screen/login_page.dart';

import 'package:flutter/material.dart';



void main(){

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: '로그인 앱',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),

    );
  }

}