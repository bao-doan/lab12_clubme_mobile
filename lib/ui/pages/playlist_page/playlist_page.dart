import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/api/resources/song_rest.dart';
import 'package:lab12_clubme_mobile/core/providers/song_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_bottom_navigation.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_card_artist.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/section_albums.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/section_artists.dart';
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
    // Provider.of<SongProvider>(context).fetch();
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
      builder: (context, provider, child) => Scaffold(
        body: Consumer<PlayerProvider>(
          builder: (playerContext, playerProvider, playerChild) => LibBackground(
            // albumArt: 'http://res.cloudinary.com/bao-doan/image/upload/v1646882185/clubme/images/h14amecj7uok2oapzjrb.jpg',
            albumArt: playerProvider.song?.image?.secure_url ?? '',
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),

                            SectionArtists(),
                            SizedBox(
                              height: 20.0,
                            ),
                            SectionAlbums(),
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
                            provider.list.isEmpty
                            ? Center(child: CircularProgressIndicator(color: kAccentColor,))
                            : Column(
                              children: [
                                for (int i = 0; i < provider.list.length; i++)
                                  Dismissible(
                                    key: Key(i.toString()),
                                    background: Container(
                                      color: Colors.transparent,
                                      margin: EdgeInsets.only(bottom: 10.0),
                                    ),
                                    secondaryBackground: Container(
                                      color: Colors.amber,
                                      margin: EdgeInsets.only(bottom: 10.0),
                                    ),
                                    child: SongItem(
                                      song: provider.list[i],
                                      playing: provider.list[i].uid == Provider.of<PlayerProvider>(context).songId,
                                    ),
                                  ),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Consumer<PlayerProvider>(
                    builder: (context, provider, child) {
                      return provider.song == null ? SizedBox() : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0
                        ),
                        child: LibQuickPlayPanel(),
                      );
                    },
                  ),
                  SizedBox(height: 20.0),
                  LibBottomNavigation(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




