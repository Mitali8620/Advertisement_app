import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_constants.dart';

class DarkTheme {
  ThemeData? darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    fontFamily: GoogleFonts.roboto().fontFamily,
    appBarTheme: AppBarTheme(color: darkColorScheme.onPrimary),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(darkColorScheme.onPrimary),
        elevation: MaterialStateProperty.all(5),
        shape: MaterialStateProperty.all(roundedBorder16),
      ),
    ),
  );
}

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB4A8),
  onPrimary: Color(0xFF690000),
  primaryContainer: Color(0xFF930100),
  onPrimaryContainer: Color(0xFFFFDAD4),
  secondary: Color(0xFF60D4FE),
  onSecondary: Color(0xFF003545),
  secondaryContainer: Color(0xFF004D62),
  onSecondaryContainer: Color(0xFFBAEAFF),
  tertiary: Color(0xFFDEC48C),
  onTertiary: Color(0xFF3E2E04),
  tertiaryContainer: Color(0xFF564419),
  onTertiaryContainer: Color(0xFFFBDFA6),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF201A19),
  onBackground: Color(0xFFEDE0DD),
  surface: Color(0xFF201A19),
  onSurface: Color(0xFFEDE0DD),
  surfaceVariant: Color(0xFF534341),
  onSurfaceVariant: Color(0xFFD8C2BE),
  outline: Color(0xFFA08C89),
  onInverseSurface: Color(0xFF201A19),
  inverseSurface: Color(0xFFEDE0DD),
  inversePrimary: Color(0xFFC00100),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB4A8),
);
