import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color(0xff161722),
    primary: Color(0xff25273c),
    secondary: Color(0xffcacde8),
    inversePrimary: Color(0xffe4e5f1),
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Color(0xffe4e5f1),
    displayColor: Colors.white,
  )
);