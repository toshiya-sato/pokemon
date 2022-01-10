import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String themeModeKey = 'themeMode';

Future<void> saveThemeMode(ThemeMode theme) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setInt(themeModeKey, theme.index);
}

Future<ThemeMode> getThemeMode() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  int? index = sharedPreferences.getInt(themeModeKey);
  return ThemeMode.values.elementAt(index!);
}
