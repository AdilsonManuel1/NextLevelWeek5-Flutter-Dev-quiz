
//import 'package:devquiz/challenge/challenge_page_widget.dart';
//import 'package:devquiz/challenge/challenge_page_widget.dart';
//import 'package:devquiz/home/home_page.dart';
import 'package:devquiz/splash/splash_page.dart';
import 'package:flutter/material.dart';


//import 'home/home_page.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      
    );
  }
}