import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/album_model.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_card_item.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/pages/album_page/album_detail_page.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';

class LibCardAlbum extends StatelessWidget {
  Album? album;

  LibCardAlbum({
    Key? key,
    this.album,
  });

  @override
  Widget build(BuildContext context) {
    return LibCardItem(
        image: album?.image?.secure_url ?? '',
        title: album?.title ?? 'Untitled Album',
        onTap: () {
          print('Click ${album?.uid ?? 'Untitled Album'}');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AlbumDetailPage(album: album ?? Album(),)),
          );
        }
    );
  }

}