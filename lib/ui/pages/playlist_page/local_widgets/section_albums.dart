import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/album_model.dart';
import 'package:lab12_clubme_mobile/core/providers/album_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_section_panel.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_card_album.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:provider/provider.dart';

class SectionAlbums extends StatefulWidget {
  List<Album>? items;
  bool waiting;

  @override
  State<SectionAlbums> createState() => _SectionAlbumsState();

  SectionAlbums({
    this.items,
    required this.waiting,
  });
}

class _SectionAlbumsState extends State<SectionAlbums> {
  @override
  Widget build(BuildContext context) {
    return SectionPanel(
          label: 'Albums',
          scrollable: true,
          waiting: widget.waiting,
          children: [
            ...widget.items!.map((Album item) => LibCardAlbum(album: item,)).toList()
          ],
        );
  }
}
