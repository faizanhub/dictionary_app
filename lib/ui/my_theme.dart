import 'package:dictionary_app/constants/text_styles.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData appTheme = ThemeData(
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: const Color(0xff273238),
    iconTheme: const IconThemeData(
      color: Color(0xff90caf9),
      size: 55,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xff273238),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
