import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkTheme = true;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}