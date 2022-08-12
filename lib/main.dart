import 'package:dictionary_app/ui/my_routes.dart';
import 'package:dictionary_app/ui/my_theme.dart';
import 'package:dictionary_app/ui/screens/dictionary_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.appTheme,
      initialRoute: DictionaryScreen.routeName,
      onGenerateRoute: MyRoutes.generateRoute,
      home: const DictionaryScreen(),
    );
  }
}
