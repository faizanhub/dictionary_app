import 'package:dictionary_app/ui/my_routes.dart';
import 'package:dictionary_app/ui/my_theme.dart';
import 'package:dictionary_app/ui/screens/dictionary_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
      ),
      initialRoute: DictionaryScreen.routeName,
      onGenerateRoute: MyRoutes.generateRoute,
      home: DictionaryScreen(),
    );
  }
}
