import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';
import 'package:lab12_clubme_mobile/core/providers/favorite_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_like_button.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_vinyl.dart';
import 'package:lab12_clubme_mobile/ui/dialogs/add_playlist_dialog.dart';
import 'package:lab12_clubme_mobile/ui/pages/player_page/local_widgets/lib_player_controls.dart';
import 'package:lab12_clubme_mobile/ui/pages/player_page/local_widgets/lib_player_slider.dart';
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
    // play();
  }

  void play() async {
    final provider = Provider.of<PlayerProvider>(context, listen: false);
    // provider.play(path: widget.song.fileUrl);
    await provider.stopPrevSong();
    await provider.playNewSong(song: provider.song ?? Song());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, provider, child) => Scaffold(
        body: LibBackground(
          albumArt: provider.song?.image?.secure_url ?? '',
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                buildHeader(context),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: buildUpperInfo(),
                ),
                Expanded(
                  child: Hero(
                    tag: 'player',
                    child: buildPlayerControlPanel(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    // final fp = Provider.of<FavoriteProvider>(context, listen: false);
    final pp = Provider.of<PlayerProvider>(context, listen: false);
    final song = pp.song ?? Song();
    return Row(
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
        Spacer(),
        Consumer<FavoriteProvider>(
          builder: (context, fp, child) => LibLikeButton(
            selected: fp.isFavorite(song),
            onTap: (value) {
              value ? fp.setFavoriteSong(song) : fp.removeFavoriteSong(song);
            },
          ),
        ),
        SizedBox(width: 15.0,)
      ],
    );
  }

  Widget buildUpperInfo() {
    return Consumer<PlayerProvider>(
      builder: (context, provider, child) => Column(
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
              // spinning: provider.playing,
            ),
          ),
          SizedBox(height: 20.0,),
          Center(
            child: Text(
              provider.song?.title ?? 'Untitled Song',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: kTextColor,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Center(
            child: Text(
              provider.song?.artist?.name ?? 'Untitled Artist',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: kTextColor.withOpacity(0.7),
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          SizedBox(height: 20.0,),

        ],
      ),
    );
  }

  Widget buildPlayerControlPanel() {
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
          LibPlayerSlider(),
          LibPlayerControls(),
        ],
      ),
    );
  }

}
