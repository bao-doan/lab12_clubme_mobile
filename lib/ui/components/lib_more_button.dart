import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class LibMoreButton extends StatelessWidget {
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        (onTap ?? (){})();
      },
      child: Container(
        child: Icon(
          Icons.more_horiz,
          color: kTextColor,
        ),
      ),
    );
  }

  LibMoreButton({
    this.onTap,
  });
}
