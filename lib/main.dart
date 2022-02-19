import 'package:dictionary_app/ui/my_routes.dart';
import 'package:dictionary_app/ui/my_theme.dart';
import 'package:dictionary_app/ui/screens/dictionary_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
            color: Colors.green,
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
      ),
      initialRoute: DictionaryScreen.routeName,
      onGenerateRoute: MyRoutes.generateRoute,
      home: DictionaryScreen(),
    );
  }
}
