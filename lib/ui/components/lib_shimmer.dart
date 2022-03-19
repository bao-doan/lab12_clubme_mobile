import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class LibShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  LibShimmer({
    this.width = double.infinity,
    required this.height,
    this.radius = 0.0,
  });

  LibShimmer.rect({
    required this.height,
    this.width = double.infinity,
    this.radius = kRadius,
  });

  LibShimmer.circular({
    required this.height,
    required this.width,
    this.radius = 100.0,
  });


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: LibGlassmorphism(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          width: width,
          height: height,
        ),
      ),
    );
  }


}
