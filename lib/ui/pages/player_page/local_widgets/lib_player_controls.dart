import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/song_model.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_vinyl.dart';
import 'package:lab12_clubme_mobile/ui/dialogs/add_playlist_dialog.dart';
import 'package:lab12_clubme_mobile/ui/utils/asset_image.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
// import 'package:lab12_clubme_mobile/core/data/music_data.dart';
import 'package:lab12_clubme_mobile/core/providers/player_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_background.dart';
import 'package:lab12_clubme_mobile/ui/utils/format_helper.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';
import 'package:provider/provider.dart';

class LibPlayerControls extends StatefulWidget {
  const LibPlayerControls({Key? key}) : super(key: key);

  @override
  _LibPlayerControlsState createState() => _LibPlayerControlsState();
}

class _LibPlayerControlsState extends State<LibPlayerControls> {
  bool loop = false;



  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, provider, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => AddPlaylistDialog(),
              );
            },
            iconSize: 24,
            icon: Icon(
              Icons.list,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  provider.stop();
                },
                iconSize: 36,
                icon: Icon(
                  Icons.skip_previous,
                  color: Colors.pink,
                ),
              ),
              IconButton(
                onPressed: () {
                  provider.onPressPlay();
                },
                iconSize: 48,
                icon: Icon(
                  provider.playing ? Icons.pause : Icons.play_arrow,
                  color: Colors.pink,
                ),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 36,
                icon: Icon(
                  Icons.skip_next,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                loop = !loop;
              });
            },
            iconSize: 24,
            icon: Icon(
              Icons.loop_outlined,
              color: loop ? Colors.greenAccent : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
