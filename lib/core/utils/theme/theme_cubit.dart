import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final String key = "theme";
  SharedPreferences? _prefs;

  ThemeCubit() : super(ThemeMode.light) {
    _loadFromPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> _loadFromPrefs() async {
    await _initPrefs();
    String? theme = _prefs!.getString(key);
    if (theme == 'dark') {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }

  Future<void> _saveToPrefs(String theme) async {
    await _initPrefs();
    _prefs!.setString(key, theme);
  }

  void toggleTheme() {
    if (state == ThemeMode.light) {
      _saveToPrefs('dark');
      emit(ThemeMode.dark);
    } else {
      _saveToPrefs('light');
      emit(ThemeMode.light);
    }
  }
}
