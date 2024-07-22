import 'package:flutter/material.dart';

class GlobalThemeData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static final ValueNotifier<ThemeMode> themeModeNotifier =
      ValueNotifier(ThemeMode.light);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    surface: Color(0xFFE5F4FF),
    onSurface: Color(0xFF003A70),
    primary: Color(0xFF64A0FF),
    onPrimary: Colors.white,
    secondary: Color(0xFFCDE2FF),
    onSecondary: Color(0xFF003A70),
    error: Colors.redAccent,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    surface: Color(0xFF004ECC),
    onSurface: Colors.white,
    primary: Color(0xFF3984FE),
    onPrimary: Colors.white,
    secondary: Color(0xFF1D72FE),
    onSecondary: Colors.white,
    error: Colors.redAccent,
    onError: Colors.white,
    brightness: Brightness.dark,
  );

  static void toggleTheme() {
    if (themeModeNotifier.value == ThemeMode.light) {
      themeModeNotifier.value = ThemeMode.dark;
    } else {
      themeModeNotifier.value = ThemeMode.light;
    }
  }
}
