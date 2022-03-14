import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/core/data/music_data.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';

class LibBackground extends StatelessWidget {
  final Widget? _child;
  final String? albumArt;
  final gradients = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.pinkAccent,
        // Colors.purpleAccent,
        // Colors.indigo,
        Colors.indigoAccent,
        // Colors.green,
        // Colors.greenAccent,
        // Colors.black,
        // Colors.black54
      ]
  );

  LibBackground({
    Key? key,
    Widget? child,
    String? albumArt,
  }) : this._child = child, this.albumArt = albumArt ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return albumArt != null
      ? Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: PayloadHelper.imageFromUri(albumArt),
            fit: BoxFit.fitHeight,
          ),
          gradient: gradients,
        ),
        child: Stack(
          children: [
            LibGlassmorphism(),
            _child!
          ],
        ),
      )
      : Container(
        decoration: BoxDecoration(
          gradient: gradients,
        ),
        child: _child,
      );
  }
}
