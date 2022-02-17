import 'package:dictionary_app/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioScreen extends StatefulWidget {
  static const routeName = '/audio_screen';
  final String audioUrl;

  const AudioScreen({required this.audioUrl});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppStrings.audioAppBarText}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () async {
                  await player.setUrl(widget.audioUrl);
                  await player.play();
                },
                icon: Icon(Icons.play_arrow),
                color: theme.iconTheme.color,
                iconSize: theme.iconTheme.size!,
              ),
              Text(
                '${AppStrings.play}',
                style: theme.textTheme.headline1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
