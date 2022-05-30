import 'package:flutter/material.dart';

import 'app_typography.dart';
import 'colors/app_base_colors.dart';
import 'colors/app_colors.dart';

extension AppThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isLightMode => theme.brightness == Brightness.light;
  ColorScheme get colorScheme => theme.colorScheme;
  Gradient get linearGradient => LinearGradient(
        begin: const Alignment(-1.2, 0),
        end: const Alignment(0.8, 0),
        transform: const GradientRotation(0.7853982), //math.pi/4
        colors: [
          theme.primaryColor.lighten(percentage: 30),
          theme.primaryColor,
        ],
      );
}

extension ColorX on Color {
  /// Darken a color by [percentage] amount (100 = black)
  // ........................................................
  Color darken({int percentage = 10}) {
    assert(1 <= percentage && percentage <= 100);
    final f = 1 - percentage / 100;
    return Color.fromARGB(
      alpha,
      (red * f).round(),
      (green * f).round(),
      (blue * f).round(),
    );
  }

  /// Lighten a color by [percentage] amount (100 = white)
  // ........................................................
  Color lighten({int percentage = 10}) {
    assert(1 <= percentage && percentage <= 100);
    final p = percentage / 100;
    return Color.fromARGB(
      alpha,
      red + ((255 - red) * p).round(),
      green + ((255 - green) * p).round(),
      blue + ((255 - blue) * p).round(),
    );
  }
}

class AppTheme {
  // ignore: long-method
  ThemeData buildThemeData({
    required MaterialColor primarySwatch,
    required MaterialColor secondarySwatch,
    required Brightness brightness,
  }) {
    final isLight = brightness == Brightness.light;

    final appColors = AppColors(isLight);

    final primaryColor =
        isLight ? primarySwatch.shade500 : primarySwatch.shade200;
    final primaryColorLight =
        isLight ? primarySwatch.shade200 : primarySwatch.shade100;
    final primaryColorDark =
        isLight ? primarySwatch.shade800 : primarySwatch.shade500;

    final secondaryColor =
        isLight ? secondarySwatch.shade500 : secondarySwatch.shade200;
    final secondaryColorDark =
        isLight ? secondarySwatch.shade800 : secondarySwatch.shade500;

    const cardTheme = CardTheme(
      elevation: 0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shadowColor: Color(0x32000000),
    );

    const sliderTheme = SliderThemeData(
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
    );

    final textButtonTheme = TextButtonThemeData(
      style: TextButton.styleFrom(primary: primaryColor),
    );

    final iconTheme = IconThemeData(
      color: appColors.textColor100,
      size: 24,
    );

    final appBarTheme = AppBarTheme(
      elevation: 4,
      iconTheme: iconTheme,
      backgroundColor: appColors.surfaceColor50,
      foregroundColor: appColors.textColor100,
    );

    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: cardTheme,
      textButtonTheme: textButtonTheme,
      iconTheme: iconTheme,
      sliderTheme: sliderTheme,
      appBarTheme: appBarTheme,
      toggleableActiveColor: primaryColor,
      errorColor: appColors.errorColor,
      canvasColor: appColors.surfaceColor50,
      backgroundColor: appColors.surfaceColor100,
      cardColor: appColors.surfaceColor50,
      primaryColor: primaryColor,
      shadowColor: const Color(0x32000000),
      unselectedWidgetColor: appColors.textColor200,
      dividerColor: appColors.textColor500,
      disabledColor: isLight ? AppBaseColors.line : AppBaseColors.label,
      primaryColorLight: primaryColorLight,
      primaryColorDark: primaryColorDark,
      dialogBackgroundColor: appColors.surfaceColor50,
      colorScheme: ColorScheme(
        primary: primaryColor,
        primaryContainer: primaryColorDark,
        secondary: secondaryColor,
        secondaryContainer: secondaryColorDark,
        surface: appColors.surfaceColor50,
        background: appColors.surfaceColor100,
        error: appColors.errorColor,
        onPrimary: appColors.textColor800,
        onSecondary: appColors.textColor800,
        onSurface: appColors.textColor100,
        onBackground: appColors.textColor300,
        onError: AppBaseColors.offBlack,
        brightness: brightness,
      ),
      brightness: brightness,
      textTheme: AppTypography().buildTextTheme(
        appColors.textColor100,
        fontFamily: 'Poppins',
      ),
    );
  }
}
