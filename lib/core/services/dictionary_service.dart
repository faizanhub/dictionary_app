import 'dart:convert';

import 'package:dictionary_app/constants/configs.dart';
import 'package:dictionary_app/core/models/word.dart';

import 'package:http/http.dart' as http;

class DictionaryService {
  Future<Word?> getData(String word) async {
    String url = '${Configs.baseUrl}${word.trim()}?key=${Configs.apiKey}';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      var jsonResponse = jsonDecode(data)[0];
      String meaning = jsonResponse['shortdef'][0];

      return Word(word: word, meaning: meaning);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
