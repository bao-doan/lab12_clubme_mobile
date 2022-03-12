import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class LibMoreButton extends StatelessWidget {
  const LibMoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.more_horiz,
        color: kTextColor,
      ),
    );
  }
}
