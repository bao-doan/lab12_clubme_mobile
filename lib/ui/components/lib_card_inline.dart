import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';

class LibCardInline extends StatelessWidget {
  String label;
  String image;

  @override
  Widget build(BuildContext context) {
    return LibGlassmorphism(
      borderRadius: BorderRadius.circular(kRadius),
      color: Colors.white,
      opacity: 0.2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min ,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: PayloadHelper.imageFromUri(image),
                    fit: BoxFit.fitWidth,
                  )
              ),
            ),
            SizedBox(width: 10,),
            Text(
              label,
              style: TextStyle(
                color: kTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  LibCardInline({
    required this.label,
    required this.image,
  });
}
