import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon/shared_preferences_util.dart';

final themeModeProvider =
    ChangeNotifierProvider<UserThemeMode>((ref) => UserThemeMode());

class UserThemeMode extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  UserThemeMode() {
    getThemeMode().then((value) => _themeMode = value);
  }

  ThemeMode get mode => _themeMode;

  void changeTheme(ThemeMode selectTheme) {
    _themeMode = selectTheme;
    saveThemeMode(_themeMode);
    notifyListeners();
  }
}
