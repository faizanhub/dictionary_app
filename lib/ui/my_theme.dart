import 'package:dictionary_app/constants/text_styles.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData appTheme = ThemeData(
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: Color(0xff273238),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xff273238),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
    ),
  );
}
