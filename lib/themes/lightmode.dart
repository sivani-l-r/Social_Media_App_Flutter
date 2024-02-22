import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Color(0xfffafafa),
    primary: Color(0xffe4e5f1),
    secondary: Color(0xffd2d3db),
    inversePrimary: Color(0xff484b6a),
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: const Color(0xff484b6a),
    displayColor: Colors.black,
  )
);