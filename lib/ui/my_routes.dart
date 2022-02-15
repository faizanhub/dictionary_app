import 'package:dictionary_app/ui/screens/dictionary_screen.dart';
import 'package:flutter/material.dart';

abstract class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case DictionaryScreen.routeName:
        return MaterialPageRoute(builder: (_) => DictionaryScreen());

      default:
        return MaterialPageRoute(builder: (_) => DictionaryScreen());
    }
  }
}
