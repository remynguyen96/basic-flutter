import 'package:flutter/material.dart';

final appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xff388E3C),
  accentColor: Color(0xff536DFE),
  primarySwatch: Colors.yellow,
  fontFamily: 'SF-Pro-Text-Regular',
  textTheme: TextTheme(
    body1: TextStyle(fontSize: 16),
    display4: TextStyle(
      fontFamily: 'SF-Pro-Text',
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: Colors.black,
    ),
  ),
);
