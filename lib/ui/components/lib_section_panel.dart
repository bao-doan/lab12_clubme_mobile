import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_card_item.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/pages/playlist_page/local_widgets/lib_card_artist.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';

class SectionPanel extends StatelessWidget {
  String label;
  bool scrollable;
  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text  (
          '$label',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headline5!.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 20.0,),
        // buildScrollDisplay(),
        // buildGridDisplay(),
        scrollable ?  buildScrollDisplay() : buildGridDisplay()

      ],
    );
  }

  Widget buildGridDisplay() {
    return LayoutBuilder(
        builder: (context, constraints) => Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (int i = 0; i < children.length; i++)
              SizedBox(
                width: constraints.maxWidth / 2 - 10,
                child: children[i],
              )
          ],
        )
    );
  }

  Widget buildScrollDisplay() {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 10,
          children: [
            for (int i = 0; i < children.length; i ++) SizedBox(
              width: 0.45 * constraints.maxWidth,
              child: children[i],
            ),
          ],
        ),
      ),
    );
  }

  SectionPanel({
    required this.label,
    required this.scrollable,
    required this.children,
  });
}



