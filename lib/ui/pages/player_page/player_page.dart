import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_vinyl.dart';
import 'package:lab12_clubme_mobile/ui/utils/asset_image.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
// import 'package:lab12_clubme_mobile/core/data/music_data.dart';
import 'package:lab12_clubme_mobile/core/providers/player_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_background.dart';
import 'package:lab12_clubme_mobile/ui/utils/format_helper.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';
import 'package:provider/provider.dart';

class PlayerPage extends StatefulWidget {
  final Song song;
  const PlayerPage({
    Key? key,
    required this.song
  }) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    play();
  }

  void play() async {
    final provider = Provider.of<PlayerProvider>(context, listen: false);
    // provider.play(path: widget.song.fileUrl);
    await provider.stopPrevSong();
    await provider.playNewSong(song: widget.song);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, provider, child) => Scaffold(
        body: LibBackground(
          albumArt: widget.song.image?.secure_url ?? '',
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: kTextColor,
                      ),
                    ),
                    Text(
                      'Now Playing',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: buildUpperInfo(context),
                ),
                Expanded(
                  child: Hero(
                    tag: 'player',
                    child: buildPlayerControls(provider),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUpperInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 10,),
        Text(
          'Listen to your favourite Music',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: kTextColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 30.0,),
        Center(
          child: LibVinyl(
            spinning: true,
          ),
        ),
        SizedBox(height: 20.0,),
        Center(
          child: Text(
            widget.song.title!,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                color: kTextColor,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Center(
          child: Text(
            widget.song.artist?.name ?? '',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: kTextColor.withOpacity(0.7),
                fontWeight: FontWeight.w700
            ),
          ),
        ),
        SizedBox(height: 20.0,),

      ],
    );
  }

  Widget buildPlayerControls(PlayerProvider provider) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(1),
            ]
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildPlayerSlider(),
          buildPlayerButtons(),
        ],
      ),
    );
  }

  Widget buildPlayerButtons() {
    return Consumer<PlayerProvider>(
      builder: (context, provider, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              provider.stop();
            },
            iconSize: 36,
            icon: Icon(
              Icons.skip_previous,
              color: Colors.pink,
            ),
          ),
          IconButton(
            onPressed: () {
              provider.onPressPlay();
            },
            iconSize: 48,
            icon: Icon(
              provider.playing ? Icons.pause : Icons.play_arrow,
              color: Colors.pink,
            ),
          ),
          IconButton(
            onPressed: () {},
            iconSize: 36,
            icon: Icon(
              Icons.skip_next,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
}

  Widget buildPlayerSlider() {
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
