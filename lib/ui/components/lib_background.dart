import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/components/lib_glassmorphism.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:lab12_clubme_mobile/core/data/music_data.dart';
import 'package:lab12_clubme_mobile/ui/utils/payload_helper.dart';

class LibBackground extends StatelessWidget {
  final Widget? _child;
  final String? albumArt;
  final int themeMode;
  final List<List<Color>> themes = [
    [
      Colors.pinkAccent,
      Colors.indigoAccent,
    ],
    [
      Colors.purpleAccent,
      Colors.indigo,
    ],
    [
      Colors.black,
      Colors.black54,
    ],
  ];

  LinearGradient getGradients(int themeMode) {
    return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: themes[themeMode],
    );
  }

  LibBackground({
    Key? key,
    Widget? child,
    String? albumArt,
    this.themeMode = 0,
  }) : this._child = child, this.albumArt = albumArt ?? '' ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return albumArt != null && albumArt!.isNotEmpty
      ? Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: PayloadHelper.imageFromUri(albumArt),
            fit: BoxFit.fitHeight,
          ),
          gradient: getGradients(themeMode),
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
          gradient: getGradients(themeMode),
        ),
        child: _child,
      );
  }
}
