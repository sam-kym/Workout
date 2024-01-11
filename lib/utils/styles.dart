import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: scaffoldBackgroundColor,
  primaryColor: kPrimaryColor,
  primaryColorLight: kPrimaryLightColor,
  hintColor: Colors.grey[400],

  ///appBar theme
  appBarTheme: const AppBarTheme(
      color: kPrimaryColor,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white)),
//input decoration
  inputDecorationTheme: const InputDecorationTheme(focusColor: kPrimaryColor),

  ///text theme
  textTheme: TextTheme(
    bodyLarge: const TextStyle(),
    bodyMedium: const TextStyle(fontWeight: FontWeight.w400),
    titleMedium: const TextStyle(fontWeight: FontWeight.w500),
    titleSmall: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w400),
    displayLarge: const TextStyle(),
    displayMedium: const TextStyle(),
    displaySmall: const TextStyle(),
    headlineMedium: const TextStyle(),
    headlineSmall: const TextStyle(),
    titleLarge: const TextStyle(),
  ).apply(bodyColor: Colors.black),
  colorScheme:
  ColorScheme.fromSwatch(primarySwatch: createMaterialColor(kPrimaryColor))
      .copyWith(background: backgroundColor),
);
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
const poppinsLight = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w300,
);

const poppinsLightItalic = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic);

const poppinsRegular = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
);

const poppinsRegularItalic = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic);

const poppinsMedium = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);

const poppinsMediumItalic = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic);

const poppinsSemiBold = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);

const poppinsSemiBoldItalic = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic);

const poppinsBold = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
);

const poppinsBoldItalic = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic);
