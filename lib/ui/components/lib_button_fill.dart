import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';

class LibButtonFill extends StatelessWidget {
  String label;
  Color? color;
  Function? onTap;

  LibButtonFill({
    required this.label,
    this.onTap,
    this.color,
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
          color: color ?? Colors.blueAccent,
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
