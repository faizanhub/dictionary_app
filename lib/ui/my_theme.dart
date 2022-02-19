import 'package:dictionary_app/constants/text_styles.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData appTheme = ThemeData(
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: Color(0xff273238),
    iconTheme: IconThemeData(
      color: Color(0xff90caf9),
      size: 55,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xff273238),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
