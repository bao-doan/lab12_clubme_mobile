import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/api/prefs/prefs_client.dart';
import 'package:lab12_clubme_mobile/core/api/resources/song_rest.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/core/providers/favorite_provider.dart';
import 'package:lab12_clubme_mobile/core/providers/song_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_bottom_navigation.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_detail_page.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_song_list.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_card_artist.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_tag_badge.dart';
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

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final favoriteProvider = Provider.of<FavoriteProvider>(context, listen: false);
    favoriteProvider.fetchSongsForFavorites();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, provider, child) {
        return LibDetailPage(
          title: 'Favorite songs',
          themeMode: 1,
          children: [
            SizedBox(height: 10.0,),
            Text  (
              'Songs',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 20.0,),
            LibSongList(list: provider.songs),
          ],
        );
      },
    );
  }
}
