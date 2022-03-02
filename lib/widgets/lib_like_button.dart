import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/constants.dart';
import 'package:flutter/cupertino.dart';

class LibLikeButton extends StatefulWidget {
  final bool selected;
  final ValueChanged<bool>? onTap;

  const LibLikeButton({
    Key? key,
    this.selected = false,
    this.onTap,
  }) :
        super(key: key);

  @override
  State<LibLikeButton> createState() => _LibLikeButtonState();
}

class _LibLikeButtonState extends State<LibLikeButton> {
  late bool _selected;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selected = widget.selected;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
        (widget.onTap ?? (selected) {})(_selected);
      },
      child: Container(
        child: Icon(
          _selected ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          color: _selected ? kAccentColor : kTextColor,
        ),
      ),
    );
  }
}
