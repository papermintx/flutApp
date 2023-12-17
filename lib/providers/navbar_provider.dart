// bottom_navbar_provider.dart
import 'package:flutter/foundation.dart';

class BottomNavbarProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
