import 'package:flutter/material.dart';
import 'package:simple_animations/multi_tween/multi_tween.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps {y, opacity}

class LibFadeAnimation extends StatelessWidget {
  Widget child;
  double delay;
  LibFadeAnimation({
    Key? key,
    required this.child,
    this.delay = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = TimelineTween<AniProps>()
      ..addScene(
        begin: Duration(milliseconds: 0),
        end: Duration(milliseconds: 500),
      ).animate(AniProps.y, tween: Tween<double>(begin: -10, end: 0,))
      ..addScene(
        begin: Duration(milliseconds: 0),
        end: Duration(milliseconds: 500),
      ).animate(AniProps.opacity, tween: Tween<double>(begin: 0, end: 1))
    ;
    return LayoutBuilder(
      builder: (context, constraints) => PlayAnimation<TimelineValue<AniProps>>(
        child: child,
        builder: (context, child, value) {
          return Transform.translate(
            offset: Offset(0, value.get(AniProps.y)),
            child: Opacity(
              opacity: value.get(AniProps.opacity),
              child: child,
            ),
          );
        },
        curve: Curves.decelerate,
        tween: tween,
        duration: tween.duration,
        delay: Duration(milliseconds: (delay * 1000).toInt()),
      ),
    );
  }
}
