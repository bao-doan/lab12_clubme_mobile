import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/album_model.dart';
import 'package:lab12_clubme_mobile/core/providers/album_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_section_panel.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_card_album.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:provider/provider.dart';

class SectionAlbums extends StatefulWidget {
  List<Album>? items;

  @override
  State<SectionAlbums> createState() => _SectionAlbumsState();

  SectionAlbums({
    this.items,
  });
}

class _SectionAlbumsState extends State<SectionAlbums> {
  @override
  Widget build(BuildContext context) {
    return widget.items != null
        ?  SectionPanel(
          label: 'Albums',
          scrollable: true,
          children: [
            ...widget.items!.map((Album item) => LibCardAlbum(album: item,)).toList()
          ],
        )
        : Consumer<AlbumProvider>(
          builder: (context, provider, child) => SectionPanel(
            label: 'Albums',
            scrollable: true,
            children: [
              for (int i = 0; i < provider.items.length; i ++)
                LibCardAlbum(
                  album: provider.items[i],
                )
            ],
          ),
    );
  }
}
