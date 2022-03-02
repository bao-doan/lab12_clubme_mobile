import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/constants.dart';
import 'package:lab12_clubme_mobile/data/music_data.dart';

class LibBackground extends StatelessWidget {
  final Widget? _child;
  final String? albumArt;
  const LibBackground({
    Key? key,
    Widget? child,
    String? albumArt,
  }) : this._child = child, this.albumArt = albumArt ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: AssetImage(albumArt ?? ''),
        //   fit: BoxFit.fitHeight,
        // ),
        gradient: LinearGradient(
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
        ),
      ),
      child: _child,
    );
  }
}
