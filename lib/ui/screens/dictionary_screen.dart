import 'package:dictionary_app/constants/app_strings.dart';
import 'package:dictionary_app/constants/error_strings.dart';
import 'package:dictionary_app/constants/text_styles.dart';
import 'package:dictionary_app/core/models/word.dart';
import 'package:dictionary_app/core/services/dictionary_service.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  static const routeName = '/';

  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  String searchingWord = '';
  DictionaryService dictionaryService = DictionaryService();
  Word? wordInstance;

  bool isLoading = false;

  TextEditingController textEditingController = TextEditingController();

  void handleSearchWord() async {
    if (searchingWord.isEmpty) {
      wordInstance!.meaning = '';
      updateUi();
      return;
    }

    setState(() {
      isLoading = true;
    });

    ///main handling
    try {
      wordInstance = await dictionaryService.getData(searchingWord);
    } catch (e) {
      print('${ErrorStrings.invalidData}');

      wordInstance!.meaning = AppStrings.invalidWord;
    }

    if (wordInstance != null) {
      textEditingController.clear();
      updateUi();
    }
  }

  void updateUi() {
    setState(() {
      searchingWord = '';
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.appBarText,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Row of Icons and TextField
            Row(
              children: [
                SizedBox(width: 5),
                Icon(
                  Icons.spellcheck_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    onChanged: (value) {
                      setState(() {
                        searchingWord = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: AppStrings.hintText,
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 10),

            ///Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: handleSearchWord,
                  child: Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                ),
              ],
            ),

            ///Divider
            Divider(
              color: Colors.amber,
              thickness: 1.5,
            ),

            ///Text Widget //word
            Text(
              'Word : $searchingWord',
              style: wordTextStyle,
            ),

            SizedBox(height: 10),

            ///Text Widget //word
            SizedBox(
              height: 400,
              width: double.infinity,
              child: !isLoading
                  ? Card(
                      color: Color(0xff19272d),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Text(
                          wordInstance != null
                              ? '${wordInstance!.meaning}'
                              : '',
                          style: wordTextStyle.copyWith(
                              fontSize: 25, color: Colors.white60),
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
