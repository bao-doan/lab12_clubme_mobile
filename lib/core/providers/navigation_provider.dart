import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/** Keep state of Navigation bar */

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<String> pageIDs = ['explore', 'favorites', 'settings'];
  String lastPageID = '';


  List<String> history = [];
  navigate(String pageId) {
    history.add(pageId);
    _currentIndex = pageIDs.indexOf(pageId);
    print('HISTORY navigate $history');
    notifyListeners();
  }

  back() {
    try {
      print('HISTORY back $history');
      if (history.isNotEmpty) {
        final removed = history.removeLast();
        print('HISTORY removed $removed');
        final accessIndex = history.length - 1 > -1 ? history.length - 1 : 0;
        _currentIndex = history.isEmpty
            ? 0
            : pageIDs.indexOf(history[accessIndex]);
      }
    }
    catch (e) {
      print('NavigationProvider $e');
    }
    notifyListeners();
  }
}