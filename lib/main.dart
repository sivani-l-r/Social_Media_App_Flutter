import 'package:flutter/material.dart';
import 'package:social_media_app/pages/login.dart';
import 'package:social_media_app/pages/start.dart';
import 'package:social_media_app/themes/darkmode.dart';
import 'package:social_media_app/themes/lightmode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}

