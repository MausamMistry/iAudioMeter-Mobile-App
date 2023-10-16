import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF7DF7FF),
  onPrimary: Color(0xFF3ABFC8),
  primaryContainer: Color(0xFF31B4BC),
  onPrimaryContainer: Color(0xFF3ABFC8),
  secondary: Color(0xFF7DF7FF),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFCCE8E9),
  onSecondaryContainer: Color(0xFF041F20),
  tertiary: Color(0xFF4E5F7D),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFD5E3FF),
  onTertiaryContainer: Color(0xFF071C36),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFAFDFC),
  onBackground: Color(0xFF191C1C),
  surface: Color(0xFFFAFDFC),
  onSurface: Color(0xFF191C1C),
  surfaceVariant: Color(0xFFDAE4E5),
  onSurfaceVariant: Color(0xFF3F4949),
  outline: Color(0xFF6F7979),
  onInverseSurface: Color(0xFFEFF1F1),
  inverseSurface: Color(0xFF2D3131),
  inversePrimary: Color(0xFF4CD9E0),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF00696D),
  outlineVariant: Color(0xFFBEC8C9),
  scrim: Color(0xFF000000),
);

dynamic cardTheme = CardTheme(
  elevation: 2,
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10))),
  clipBehavior: Clip.antiAlias,
  surfaceTintColor: Colors.white,
  shadowColor: lightColorScheme.inverseSurface,
);

dynamic appBarTheme = AppBarTheme(
  elevation: 0,
  centerTitle: false,
  foregroundColor: Colors.white,
  backgroundColor: lightColorScheme.primary,
);

dynamic dialogTheme = const DialogTheme(elevation: 0);

dynamic buttonTheme = const ButtonThemeData(
    highlightColor: Colors.transparent, splashColor: Colors.transparent);

ThemeData themeData = ThemeData(
  useMaterial3: false,
  buttonTheme: buttonTheme,
  colorSchemeSeed: const Color(0xFF31B4BC),
  fontFamily: 'Arial',
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
