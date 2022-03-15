import 'package:flutter/foundation.dart';

/** Keep state of Navigation bar */

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  setCurrentIndex(int value) {
    _currentIndex = value;
  }
}