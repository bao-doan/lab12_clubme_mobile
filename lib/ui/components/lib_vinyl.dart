import 'package:flutter/material.dart';
import 'package:lab12_clubme_mobile/ui/utils/asset_image.dart';
import 'package:lab12_clubme_mobile/ui/utils/constants.dart';

class LibVinyl extends StatefulWidget {
  bool spinning;
  LibVinyl({
    Key? key,
    this.spinning = false
  }) : super(key: key);

  @override
  _LibVinylState createState() => _LibVinylState();
}

class _LibVinylState extends State<LibVinyl> with SingleTickerProviderStateMixin {
  // Spin
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);


  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.spinning) {
      _controller.repeat();
    } else {
      _controller.stop();
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.stop();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black87.withOpacity(0.3),
                width: 10.0,
              )
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black87,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 0.0,
              ),
              image: DecorationImage(
                image: AssetImage(AppImage.vinyl_default),
                fit: BoxFit.cover,
              ),
              // borderRadius: BorderRadius.circular(30.0),
              // shape: BoxShape.circle
            ),
          ),
        ),
      ),
    );
  }
}
