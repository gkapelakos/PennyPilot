import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Provider for SharedPreferences
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

// StateNotifier to manage ThemeMode
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final SharedPreferences prefs;

  ThemeModeNotifier(this.prefs) : super(_initialTheme(prefs));

  static ThemeMode _initialTheme(SharedPreferences prefs) {
    final themeIndex = prefs.getInt('themeMode');
    if (themeIndex == null) return ThemeMode.system;
    return ThemeMode.values[themeIndex];
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    await prefs.setInt('themeMode', mode.index);
  }
}

// Global provider for ThemeMode
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return ThemeModeNotifier(prefs);
});
