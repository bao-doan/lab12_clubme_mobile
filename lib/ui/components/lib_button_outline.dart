import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';

class LibButtonOutline extends StatelessWidget {
  String label;
  Function? onTap;

  LibButtonOutline({
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        (onTap ?? (){})();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 14.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: kTextColor,
          ),
          borderRadius: BorderRadius.circular(kRadius),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kTextColor,
          ),
        ),
      ),
    );
  }


}
