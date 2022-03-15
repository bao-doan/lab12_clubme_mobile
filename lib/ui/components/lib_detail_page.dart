import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/api/prefs/prefs_client.dart';
import 'package:lab12_clubme_mobile/core/api/resources/song_rest.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/core/providers/song_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_bottom_navigation.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
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

class LibDetailPage extends StatefulWidget {
  String? title;
  String? background;
  int? themeMode;
  List<Widget> children;

  @override
  _LibDetailPageState createState() => _LibDetailPageState();

  LibDetailPage({
    this.title,
    this.background,
    this.themeMode,
    required this.children,
  });
}

class _LibDetailPageState extends State<LibDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LibBackground(
        albumArt: widget.background ?? '',
        themeMode: widget.themeMode ?? 0,
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  Expanded(
                    child: Text(
                      widget.title ?? 'Title',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
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
                        ...widget.children
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
    );
  }
}
