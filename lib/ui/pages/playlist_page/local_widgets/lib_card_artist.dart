import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_card_item.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/pages/artist_page/artist_detail_page.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';

class LibCardArtist extends StatelessWidget {
  Artist? artist;

  LibCardArtist({
    Key? key,
    this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return LibCardItem(
      image: artist?.image?.secure_url ?? '',
      title: artist?.name ?? 'Untitled Artist',
      onTap: () {
        print('CLick ${artist?.uid ?? 'Untitled Artist'}');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArtistDetailPage(artist: artist ?? Artist())),
        );
      });
  }
}
