import 'package:flutter/cupertino.dart';

class SalaryProvider with ChangeNotifier {
  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  set currentTabIndex(int value) {
    _currentTabIndex = value;
    notifyListeners();
  }
}
