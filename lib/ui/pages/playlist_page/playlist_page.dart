import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/api/prefs/prefs_client.dart';
import 'package:lab12_clubme_mobile/core/api/resources/song_rest.dart';
import 'package:lab12_clubme_mobile/core/providers/album_provider.dart';
import 'package:lab12_clubme_mobile/core/providers/favorite_provider.dart';
import 'package:lab12_clubme_mobile/core/providers/song_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_bottom_navigation.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_detail_page.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_song_list.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_card_artist.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/section_albums.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/section_artists.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/section_tags.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/core/data/music_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:lab12_clubme_mobile/core/api/rest_client_mixin.dart';
import 'package:lab12_clubme_mobile/ui/pages/player_page/player_page.dart';
import 'package:lab12_clubme_mobile/core/providers/player_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_background.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_quickplay_panel.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_song_item.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';
import 'package:provider/provider.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {

  @override
  void initState() {
    super.initState();
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    favoriteProvider.getFavoriteList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Provider.of<PlayerProvider>(context).dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SongProvider>(context).fetch();

    return Consumer<SongProvider>(
      builder: (context, provider, child) {
        // final player = Provider.of<PlayerProvider>(context, listen: false);
        return LibDetailPage(
          // background: player.playlist.currentSong.image?.secure_url,
          hasHeader: false,
          children: [
            SizedBox(
              height: 20.0,
            ),

            SectionArtists(),
            SizedBox(
              height: 20.0,
            ),
            SectionTags(),
            SizedBox(
              height: 20.0,
            ),
            Consumer<AlbumProvider>(
              builder: (context, provider, child) => SectionAlbums(
                items: provider.items,
                waiting: provider.waiting,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text  (
              'Explore',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              '${provider.list.length} songs',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 12,
                  height: 1.5
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Consumer<FavoriteProvider>(
              builder: (context, fp, child) => LibSongList(
                  list: provider.list,
                  waiting: provider.waiting,
              ),
            ),
            // )
          ],
        );
      },
    );
  }
}




