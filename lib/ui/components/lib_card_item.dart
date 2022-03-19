import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';

class LibCardItem extends StatelessWidget {
  Function? onTap;
  String image;
  String title;

  LibCardItem({
    Key? key,
    this.onTap,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        (onTap ?? () {})();
      },
      child: LayoutBuilder(
        builder: (context, constrains) => ClipRRect(
          borderRadius: BorderRadius.circular(kRadius),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: PayloadHelper.imageFromUri(image),
                        fit: BoxFit.fitWidth,
                      )
                  ),
                ),
              ),
              SizedBox(
                width: constrains.maxWidth,
                height: constrains.maxWidth,
                child: LibGlassmorphism(
                  blur: 0,
                  opacity: 0.2,
                  child: Center(
                    child: Text  (
                      title.length > 0 ? title : 'Card Title',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
