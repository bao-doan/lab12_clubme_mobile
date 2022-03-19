import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/utils/asset_image.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';

/** A Wrapper Widget supports loading with Skeleton, View, empty data View */
class LibDisplayWith extends StatelessWidget {
  bool waiting;
  bool empty;
  Widget skeleton;
  Widget hasDataView;
  Widget? hasNoDataView;

  buildDefaultHasNoDataView() {
    return SizedBox(
      width: double.infinity,
      child: LibGlassmorphism(
        color: Colors.white,
        opacity: 0.2,
        borderRadius: BorderRadius.circular(kRadius),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImage.empty_data),
                )
              ),
            ),
            Text(
              'No data',
              textAlign: TextAlign.center,
              style: TextStyle(color: kTextColor),
            ),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return waiting
        ? skeleton
        : (empty
            ? (hasNoDataView ?? buildDefaultHasNoDataView())
            : hasDataView);
  }

  LibDisplayWith({
    required this.waiting,
    required this.empty,
    required this.skeleton,
    required this.hasDataView,
    this.hasNoDataView,
  });
}
