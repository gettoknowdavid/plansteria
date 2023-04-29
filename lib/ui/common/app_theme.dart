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
    primary: Color(0xff0378c7),
    primaryContainer: Color(0xFF01304F),
    secondary: Color(0xff96d967),
    secondaryContainer: Color(0xFF3C5629),
    tertiary: Color(0xfffffdd0),
    tertiaryContainer: Color(0xfffffef4),
    appBarColor: Color(0xFF3C5629),
    error: Color(0xffb00020),
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 20,
  tabBarStyle: FlexTabBarStyle.universal,
  lightIsWhite: true,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 22,
    useFlutterDefaults: true,
    elevatedButtonSchemeColor: SchemeColor.onPrimary,
    elevatedButtonSecondarySchemeColor: SchemeColor.primary,
    dialogRadius: 10.0,
    timePickerDialogRadius: 10.0,
    dialogElevation: 10.0,
    elevatedButtonRadius: 10.0,
    outlinedButtonRadius: 10.0,
    textButtonRadius: 10.0,
    defaultRadius: 10.0,
    bottomSheetRadius: 30.0,
    bottomSheetElevation: 20.0,
    bottomSheetModalElevation: 20.0,
    bottomNavigationBarType: BottomNavigationBarType.fixed,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.primaryContainer,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
    bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.primaryContainer,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: kFontFamily,
);

final darkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xFF0378C7),
    primaryContainer: Color(0xFF01304F),
    secondary: Color(0xFF96D967),
    secondaryContainer: Color(0xFF3C5629),
    tertiary: Color(0xfffffdd0),
    tertiaryContainer: Color(0xfffffef4),
    appBarColor: Color(0xFF3C5629),
    error: Color(0xffb00020),
  ).defaultError.toDark(8, true),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 20,
  appBarStyle: FlexAppBarStyle.scaffoldBackground,
  tabBarStyle: FlexTabBarStyle.universal,
  darkIsTrueBlack: true,
  swapColors: true,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 22,
    useFlutterDefaults: true,
    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
    elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
    inputDecoratorSchemeColor: SchemeColor.primaryContainer,
    textButtonSchemeColor: SchemeColor.primaryContainer,
    dialogRadius: 10.0,
    timePickerDialogRadius: 10.0,
    dialogElevation: 10.0,
    elevatedButtonRadius: 10.0,
    outlinedButtonRadius: 10.0,
    textButtonRadius: 10.0,
    defaultRadius: 10.0,
    tabBarItemSchemeColor: SchemeColor.secondary,
    tabBarIndicatorSchemeColor: SchemeColor.background,
    bottomSheetRadius: 30.0,
    bottomSheetElevation: 20.0,
    bottomSheetModalElevation: 20.0,
    bottomNavigationBarType: BottomNavigationBarType.fixed,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primaryContainer,
    // bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.primary,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primaryContainer,
    // bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.primary,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: kFontFamily,
);
