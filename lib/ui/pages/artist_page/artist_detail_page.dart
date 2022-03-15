import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/api/prefs/prefs_client.dart';
import 'package:lab12_clubme_mobile/core/api/resources/song_rest.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
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

class ArtistDetailPage extends StatefulWidget {
  Artist artist;

  @override
  _ArtistDetailPageState createState() => _ArtistDetailPageState();

  ArtistDetailPage({
    required this.artist,
  });
}

class _ArtistDetailPageState extends State<ArtistDetailPage> {
  @override
  Widget build(BuildContext context) {
    return LibDetailPage(
      title: '${widget.artist.name}',
      background: widget.artist.image?.secure_url ?? '',
      children: [
        SizedBox(height: 10.0,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: PayloadHelper.imageFromImage(widget.artist.image),
                  fit: BoxFit.fitWidth
                ),
              ),
            ),
            SizedBox(width: 30.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.0,),
                  Text(
                      widget.artist.title ?? 'A world wide artist',
                    style: TextStyle(
                      color: kTextColor,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  LayoutBuilder(
                    builder: (context, constraints) => SizedBox(
                      width: constraints.maxWidth,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          LibTagBadge(tag: 'music'),
                          LibTagBadge(tag: 'music'),
                          LibTagBadge(tag: 'music'),
                          LibTagBadge(tag: 'music'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 10.0,),
        SectionAlbums(),
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
