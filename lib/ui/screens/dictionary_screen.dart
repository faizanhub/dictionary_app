import 'package:dictionary_app/constants/app_strings.dart';
import 'package:dictionary_app/constants/text_styles.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  static const routeName = '/';

  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  String word = '';

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
                    onChanged: (value) {
                      setState(() {
                        word = 'Word : ' + value;
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
                  onPressed: () {},
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

            ///Text Widget
            Text(
              '$word',
              style: wordTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
