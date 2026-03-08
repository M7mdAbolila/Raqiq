import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences _prefs;

  ThemeCubit(ThemeMode initialMode, this._prefs)
    : super(ThemeState(themeMode: initialMode));
  Future<void> toggleTheme() async {
    final newMode = state.isDark ? ThemeMode.light : ThemeMode.dark;
    emit(ThemeState(themeMode: newMode));
    await _prefs.setBool('is_dark_mode', newMode == ThemeMode.dark);
  }
}
