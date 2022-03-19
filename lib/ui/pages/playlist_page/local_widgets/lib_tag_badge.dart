import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/core/models/artist_model.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_card_item.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';

class LibTagBadge extends StatelessWidget {
  String tag;
  Function? onTap;

  LibTagBadge({
    Key? key,
    required this.tag,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        (onTap ?? () {})();
      },
      child: LibGlassmorphism(
        borderRadius: BorderRadius.circular(kRadius),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Text(
            '#$tag',
            style: TextStyle(
              color: kTextColor,
            ),
          ),
        ),
      ),
    );
  }


}
