import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';

class LibGlassmorphism extends StatelessWidget {
  double blur;
  double opacity;
  Color color;
  BorderRadius? borderRadius;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            color: color.withOpacity(opacity),
            child: child ?? Container(),
          )
      ),
    );
  }

  LibGlassmorphism({
    this.blur = 8.0,
    this.opacity = 0.6,
    this.color = Colors.black,
    borderRadius,
    this.child,
  }) {
    // borderRadius = BorderRadius.zero;
    this.borderRadius = borderRadius ?? BorderRadius.zero;
  }
}
