import 'package:flutter/material.dart';

class TabbarProvider with ChangeNotifier {
  String _screenName = '';

  String get screenName => _screenName;

  void changeScreenName(String name) {
    _screenName = name;
    notifyListeners();
  }
}
