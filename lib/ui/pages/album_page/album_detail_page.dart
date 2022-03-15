import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/api/prefs/prefs_client.dart';
import 'package:lab12_clubme_mobile/core/api/resources/song_rest.dart';
import 'package:lab12_clubme_mobile/core/models/album_model.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/core/providers/song_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_bottom_navigation.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_card_inline.dart';
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

class AlbumDetailPage extends StatefulWidget {
  Album album;

  @override
  _AlbumDetailPageState createState() => _AlbumDetailPageState();

  AlbumDetailPage({
    required this.album,
  });
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  @override
  Widget build(BuildContext context) {
    return LibDetailPage(
      title: widget.album.title,
      background: widget.album.image?.secure_url ?? '',
      children: [
        SizedBox(height: 10.0,),
        LayoutBuilder(
          builder: (context, constrains) => SizedBox(
            width: constrains.maxWidth,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                LibCardInline(
                  label: widget.album.artist?.name ?? '',
                  image: widget.album.image?.secure_url ?? '',
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0,),
        Text  (
          'Songs',
          style: Theme.of(context).textTheme.headline5!.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 20.0,),
        Consumer<SongProvider>(
          builder: (context, provider, child) => LibSongList(list: provider.list),
        ),
      ],
    );
  }
}
