import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_song_item.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
// import 'package:lab12_clubme_mobile/core/data/music_data.dart';
import 'package:lab12_clubme_mobile/ui/pages/player_page/player_page.dart';
import 'package:lab12_clubme_mobile/core/providers/player_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_like_button.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_more_button.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';
import 'package:provider/provider.dart';

class LibSongList extends StatelessWidget {
  List<Song> list;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Center(child: CircularProgressIndicator(color: kAccentColor,))
        : Column(
      children: [
        for (int i = 0; i < list.length; i++)
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
              song: list[i],
              playing: list[i].uid == Provider.of<PlayerProvider>(context).songId,
            ),
          ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  LibSongList({
    required this.list,
  });
}
