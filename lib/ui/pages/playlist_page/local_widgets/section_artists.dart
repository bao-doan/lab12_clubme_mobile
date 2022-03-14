import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/providers/artist_provider.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_card_item.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_section_panel.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_card_artist.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';
import 'package:provider/provider.dart';

class SectionArtists extends StatefulWidget {
  const SectionArtists({Key? key}) : super(key: key);


  @override
  State<SectionArtists> createState() => _SectionArtistsState();
}

class _SectionArtistsState extends State<SectionArtists> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArtistProvider>(
      builder: (context, provider, child) => SectionPanel(
          label: 'Artists',
          scrollable: true,
          children: [
            for (int i = 0; i < provider.items.length; i ++)
              LibCardArtist(
                artist: provider.items[i],
              )
          ],
      ),
    );
  }

}



