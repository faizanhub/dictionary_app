import 'package:dictionary_app/ui/screens/audio_screen.dart';
import 'package:dictionary_app/ui/screens/dictionary_screen.dart';
import 'package:flutter/material.dart';

abstract class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case DictionaryScreen.routeName:
        return MaterialPageRoute(builder: (_) => DictionaryScreen());

      case AudioScreen.routeName:
        final args = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => AudioScreen(audioUrl: args,));

      default:
        return MaterialPageRoute(builder: (_) => DictionaryScreen());
    }
  }
}
