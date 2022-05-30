import 'package:flutter/material.dart';

extension AppTypographyX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

class AppTypography {
  // ignore: long-method
  TextTheme buildTextTheme(Color textColor, {required String fontFamily}) {
    return TextTheme(
      headline1: TextStyle(
        fontFamily: fontFamily,
        fontSize: 96,
        height: 1.17,
        fontWeight: FontWeight.w300,
        color: textColor,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        fontFamily: fontFamily,
        fontSize: 60,
        height: 1.2,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: -0.5,
      ),
      headline3: TextStyle(
        fontFamily: fontFamily,
        fontSize: 48,
        height: 1,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0,
      ),
      headline4: TextStyle(
        fontFamily: fontFamily,
        fontSize: 32,
        height: 1.19,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        fontFamily: fontFamily,
        fontSize: 24,
        height: 1.17,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0,
      ),
      headline6: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        height: 1.2,
        fontWeight: FontWeight.w500,
        color: textColor,
        letterSpacing: 0.15,
      ),
      subtitle1: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      subtitle2: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        height: 1.14,
        fontWeight: FontWeight.w500,
        color: textColor,
        letterSpacing: 0.1,
      ),
      bodyText1: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0.5,
      ),
      bodyText2: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0.25,
      ),
      button: TextStyle(
        fontFamily: fontFamily,
        fontSize: 16,
        height: 1,
        fontWeight: FontWeight.w500,
        color: textColor,
        letterSpacing: 1.25,
      ),
      caption: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12,
        height: 1.33,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 0.4,
      ),
      overline: TextStyle(
        fontFamily: fontFamily,
        fontSize: 10,
        height: 1,
        fontWeight: FontWeight.w400,
        color: textColor,
        letterSpacing: 1.5,
      ),
    );
  }
}
