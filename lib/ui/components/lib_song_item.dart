import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
// import 'package:lab12_clubme_mobile/core/data/music_data.dart';
import 'package:lab12_clubme_mobile/ui/pages/player_page/player_page.dart';
import 'package:lab12_clubme_mobile/core/providers/player_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_like_button.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_more_button.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';
import 'package:provider/provider.dart';

class SongItem extends StatelessWidget {
  final Song _song;
  final bool _playing;
  const SongItem({
    Key? key,
    required Song song,
    bool playing = false,
  }) : _song = song, _playing = playing, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () async {
              final provider = Provider.of<PlayerProvider>(context, listen: false);
              if (provider.songId != null && provider.songId!.length > 0) {
                await provider.stopPrevSong();
                await provider.playNewSong(song: _song);
              }
              else {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayerPage(song: _song))
                );
              }
            },
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: PayloadHelper.imageFromSong(_song),
                  fit: BoxFit.cover,
                ),
                color: Colors.greenAccent
              ),
            ),
          ),
          SizedBox(width: 10.0,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_song.title}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: _playing ? kAccentColor : kTextColor,
                  ),
                ),
                SizedBox(height: 4,),
                Row(
                  children: [
                    Text(
                      '${_song.artist!.name}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      width: 4.0,
                      height: 4.0,
                      margin: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kTextColor,
                      ),
                    ),
                    Text(
                      '${_song.album!.title}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Spacer(),
          LibLikeButton(
            selected: false,
            onTap: (value) {
              print('$value');
            },
          ),
          SizedBox(width: 10,),
          LibMoreButton(),
        ],
      ),
    );
  }
}