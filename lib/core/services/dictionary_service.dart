import 'dart:convert';

import 'package:dictionary_app/constants/configs.dart';
import 'package:dictionary_app/constants/error_strings.dart';
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

      String audioName = jsonResponse['hwi']['prs'].length != 0
          ? jsonResponse['hwi']['prs'][0]['sound']['audio']
          : '';

      return Word(
          word: word, meaning: meaning, audioUrl: getAudioUrl(audioName));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  String getAudioUrl(String audioFileName) {
    String folderName = '';
    final startWithAlphabetsOnly = RegExp(r'^[A-Za-z]');

    if (audioFileName.isEmpty) {
      throw Exception(ErrorStrings.invalidAudioFile);
    }

    if (audioFileName.startsWith('bix')) {
      folderName = 'bix';
    } else if (audioFileName.startsWith('gg')) {
      folderName = 'gg';
    } else if (!startWithAlphabetsOnly.hasMatch(audioFileName)) {
      folderName = '_';
    } else {
      folderName = audioFileName[0];
    }

    return '${Configs.audioBaseUrl}${folderName}/${audioFileName}${Configs.audioFileExtension}';

    ///base_url [subdirectory]/[base filename].[format]
  }
}
