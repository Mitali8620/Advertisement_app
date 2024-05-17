import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class LightTheme {
  ThemeData? lightTheme = ThemeData(
    useMaterial3: false,
    colorScheme: lightColorScheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        shape: MaterialStateProperty.all(roundedBorder16),
      ),
    ),
    appBarTheme: AppBarTheme(color: lightColorScheme.primary),
  );
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF2962FF),
  onPrimary: Color(0xFF2962FF),
  primaryContainer: Color(0xFFFFDAD4),
  onPrimaryContainer: Color(0xFF410000),
  secondary: Color(0xFF000100),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFBAEAFF),
  onSecondaryContainer: Color(0xFF001F29),
  tertiary: Color(0xFF705C2E),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFBDFA6),
  onTertiaryContainer: Color(0xFF251A00),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF201A19),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF201A19),
  surfaceVariant: Color(0xFFF5DDDA),
  onSurfaceVariant: Color(0xFF534341),
  outline: Color(0xFF857370),
  onInverseSurface: Color(0xFFFBEEEC),
  inverseSurface: Color(0xFF362F2E),
  inversePrimary: Color(0xFFFFB4A8),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFC00100),
);
