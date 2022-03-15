import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';

class LibDialog extends StatelessWidget {
  Widget child;

  @override
  Widget build(BuildContext context) {
    return LibGlassmorphism(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(kRadius),
        topRight: Radius.circular(kRadius),
      ),
      child: child,
    );
  }

  LibDialog({
    required this.child,
  });
}
