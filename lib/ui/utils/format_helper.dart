import 'package:flutter/material.dart';
import 'dart:math';

class FormatHelper {
  static String getDurationTimer(double duration) {
    final minutes = (duration / 60).floor();
    final secs = ((duration / 60 - minutes) * 60).floor();
    final displayM = minutes < 10 ? '0$minutes' : '$minutes';
    final displayS = secs < 10 ? '0$secs' : '$secs';
    return '$displayM:$displayS';
  }

}