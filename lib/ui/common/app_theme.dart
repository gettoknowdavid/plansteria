// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kFontFamily = GoogleFonts.manrope().fontFamily;

final lightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xff008080),
    primaryContainer: Color(0xff004040),
    secondary: Color(0xffff7f50),
    secondaryContainer: Color(0xffca6038),
    tertiary: Color(0xfffffdd0),
    tertiaryContainer: Color(0xfffffef4),
    appBarColor: Color(0xffca6038),
    error: Color(0xffb00020),
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 2,
  lightIsWhite: true,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 4,
    defaultRadius: 20.0,
    elevatedButtonSchemeColor: SchemeColor.onPrimary,
    elevatedButtonSecondarySchemeColor: SchemeColor.primary,
    dialogRadius: 30.0,
    timePickerDialogRadius: 30.0,
    dialogElevation: 10.0,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.tertiary,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
    bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.tertiary,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: kFontFamily,
);

final darkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xff008080),
    primaryContainer: Color(0xff004040),
    secondary: Color(0xffff7f50),
    secondaryContainer: Color(0xffca6038),
    tertiary: Color(0xfffffdd0),
    tertiaryContainer: Color(0xfffffef4),
    appBarColor: Color(0xffca6038),
    error: Color(0xffb00020),
  ).defaultError.toDark(8, true),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  appBarStyle: FlexAppBarStyle.scaffoldBackground,
  darkIsTrueBlack: true,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 18,
    defaultRadius: 20.0,
    elevatedButtonSchemeColor: SchemeColor.onPrimary,
    elevatedButtonSecondarySchemeColor: SchemeColor.primary,
    inputDecoratorSchemeColor: SchemeColor.primaryContainer,
    dialogRadius: 30.0,
    timePickerDialogRadius: 30.0,
    dialogElevation: 10.0,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.tertiary,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
    bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.tertiary,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: kFontFamily,
);
