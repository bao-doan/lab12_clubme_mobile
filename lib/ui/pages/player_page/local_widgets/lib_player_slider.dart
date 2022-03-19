import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_vinyl.dart';
import 'package:lab12_clubme_mobile/ui/dialogs/add_playlist_dialog.dart';
import 'package:lab12_clubme_mobile/ui/utils/asset_image.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
// import 'package:lab12_clubme_mobile/core/data/music_data.dart';
import 'package:lab12_clubme_mobile/core/providers/player_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_background.dart';
import 'package:lab12_clubme_mobile/ui/utils/format_helper.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';
import 'package:provider/provider.dart';

class LibPlayerSlider extends StatefulWidget {
  const LibPlayerSlider({Key? key}) : super(key: key);

  @override
  _LibPlayerSliderState createState() => _LibPlayerSliderState();
}

class _LibPlayerSliderState extends State<LibPlayerSlider> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlayerProvider>(context);
    final _position = provider.position;
    final _duration = provider.duration;
    // final _duration = provider.song?.audio?.duration ?? 100;
    final currentTime = '${_position.inMinutes}:${_position.inSeconds < 10 ? '0' + _position.inSeconds.toString() : _position.inSeconds}';
    final totalTime = '${_duration.inMinutes}:${_duration.inSeconds < 10 ? '0' + _duration.inSeconds.toString() : _duration.inSeconds}';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          FormatHelper.getDurationTimer(provider.position.inSeconds.toDouble()),
          style: TextStyle(
              color: Colors.white
          ),
        ),
        // SizedBox(width: 10,),
        Expanded(
          child: SliderTheme(
            data: SliderThemeData(
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 6.0,
              ),

            ),
            child: Slider(
              value: provider.position.inSeconds.toDouble(),
              min: 0,
              // max: provider.duration.inSeconds.toDouble(),
              max: provider.song?.audio?.duration ?? 120,
              onChanged: (value) {
                provider.onSeektoSec(value.toInt());
              },
              activeColor: Colors.pinkAccent,
              inactiveColor: Colors.greenAccent,

            ),
          ),
        ),
        // SizedBox(width: 10,),
        Text(
          FormatHelper.getDurationTimer(provider.song?.audio?.duration ?? 0),
          style: TextStyle(
              color: Colors.white
          ),
        )
      ],
    );
  }
}
