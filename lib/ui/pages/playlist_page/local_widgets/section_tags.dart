import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/providers/artist_provider.dart';
import 'package:lab12_clubme_mobile/ui/animations/lib_fade_animation.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_card_item.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_section_panel.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_card_artist.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_tag_badge.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';
import 'package:provider/provider.dart';

class SectionTags extends StatelessWidget {
  List<String> tags = ['edm', 'rock', 'instrumental', 'cover', 'remix'];


  SectionTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: LibFadeAnimation(
        delay: 0.2,
        child: Wrap(
          spacing: 10,
          children: [
            ...tags
                .map((String e) => LibTagBadge(
                  tag: e,
                  onTap: () {
                    print('Click $e');
                  },
                  ))
                .toList()
          ],
        ),
      ),
    );
  }
}
