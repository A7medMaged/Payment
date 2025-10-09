import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payment/core/utils/theme/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ThemeCubit', () {
    test('initial state is ThemeMode.light', () {
      SharedPreferences.setMockInitialValues({});
      final themeCubit = ThemeCubit();
      expect(themeCubit.state, ThemeMode.light);
    });

    test('loads theme from shared preferences', () async {
      SharedPreferences.setMockInitialValues({'theme': 'dark'});
      final themeCubit = ThemeCubit();
      await Future.delayed(Duration.zero); // allow async loading to complete
      expect(themeCubit.state, ThemeMode.dark);
    });

    test('toggleTheme switches from light to dark', () async {
      SharedPreferences.setMockInitialValues({});
      final themeCubit = ThemeCubit();
      await Future.delayed(Duration.zero);
      expect(themeCubit.state, ThemeMode.light);

      themeCubit.toggleTheme();
      await Future.delayed(Duration.zero);

      expect(themeCubit.state, ThemeMode.dark);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('theme'), 'dark');
    });

    test('toggleTheme switches from dark to light', () async {
      SharedPreferences.setMockInitialValues({'theme': 'dark'});
      final themeCubit = ThemeCubit();
      await Future.delayed(Duration.zero);
      expect(themeCubit.state, ThemeMode.dark);

      themeCubit.toggleTheme();
      await Future.delayed(Duration.zero);

      expect(themeCubit.state, ThemeMode.light);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('theme'), 'light');
    });
  });
}
