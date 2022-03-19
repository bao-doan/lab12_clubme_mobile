import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';
import 'package:lab12_clubme_mobile/core/providers/favorite_provider.dart';
import 'package:lab12_clubme_mobile/ui/dialogs/add_playlist_dialog.dart';
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
  final Function? onPressPlay;

   const SongItem({
    Key? key,
    required Song song,
    bool playing = false,
    this.onPressPlay,
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
              /** this will be applied */
              (onPressPlay ?? (){})();

              /** Below will be deprecated */
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
            child: GestureDetector(
              onTap: () {
                (onPressPlay ?? (){})();
              },
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
          ),
          // Spacer(),
          Consumer<FavoriteProvider>(
            builder: (context, provider, child) => LibLikeButton(
              selected: provider.isFavorite(_song),
              onTap: (value) {
                print('$value');
                value ? provider.setFavoriteSong(_song) : provider.removeFavoriteSong(_song);
              },
            ),
          ),
          SizedBox(width: 10,),
          LibMoreButton(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => AddPlaylistDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}