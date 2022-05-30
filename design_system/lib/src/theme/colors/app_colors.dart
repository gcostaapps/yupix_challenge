import 'package:flutter/material.dart';

import 'app_base_colors.dart';

class AppColors {
  final bool isLight;

  AppColors(this.isLight);

  List<BoxShadow> getShadow(Color color) => [
        BoxShadow(
          color: color.withOpacity(isLight ? 0.25 : 0.05),
          blurRadius: 10,
          offset: const Offset(0, 6),
        ),
      ];

  Color get surfaceColor50 => isLight
      ? AppBaseColors.lightSurfaceColors.shade50
      : AppBaseColors.darkSurfaceColors.shade50;

  Color get surfaceColor100 => isLight
      ? AppBaseColors.lightSurfaceColors.shade100
      : AppBaseColors.darkSurfaceColors.shade100;

  Color get surfaceColor200 => isLight
      ? AppBaseColors.lightSurfaceColors.shade200
      : AppBaseColors.darkSurfaceColors.shade200;

  Color get textColor50 => isLight
      ? AppBaseColors.lightTextColors.shade50
      : AppBaseColors.darkTextColors.shade50;

  Color get textColor100 => isLight
      ? AppBaseColors.lightTextColors.shade100
      : AppBaseColors.darkTextColors.shade100;

  Color get textColor200 => isLight
      ? AppBaseColors.lightTextColors.shade200
      : AppBaseColors.darkTextColors.shade200;

  Color get textColor300 => isLight
      ? AppBaseColors.lightTextColors.shade300
      : AppBaseColors.darkTextColors.shade300;

  Color get textColor400 => isLight
      ? AppBaseColors.lightTextColors.shade400
      : AppBaseColors.darkTextColors.shade400;

  Color get textColor500 => isLight
      ? AppBaseColors.lightTextColors.shade500
      : AppBaseColors.darkTextColors.shade500;

  Color get textColor600 => isLight
      ? AppBaseColors.lightTextColors.shade600
      : AppBaseColors.darkTextColors.shade600;

  Color get textColor700 => isLight
      ? AppBaseColors.lightTextColors.shade700
      : AppBaseColors.darkTextColors.shade700;

  Color get textColor800 => isLight
      ? AppBaseColors.lightTextColors.shade800
      : AppBaseColors.darkTextColors.shade800;

  Color get errorColor => isLight
      ? AppBaseColors.errorColor.shade300
      : AppBaseColors.errorColor.shade200;

  Color get successColor => isLight
      ? AppBaseColors.successColor.shade300
      : AppBaseColors.successColor.shade200;

  Color get warningColor => isLight
      ? AppBaseColors.warningColor.shade300
      : AppBaseColors.warningColor.shade200;

  // ignore: long-method
  Color getColorByMode(Color color) {
    if (color.value == AppBaseColors.dark.shade200.value) {
      return AppBaseColors.dark.shade500;
    }
    if (color.value == AppBaseColors.blue.shade200.value) {
      return AppBaseColors.blue.shade500;
    }
    if (color.value == AppBaseColors.teal.shade200.value) {
      return AppBaseColors.teal.shade500;
    }
    if (color.value == AppBaseColors.pink.shade200.value) {
      return AppBaseColors.pink.shade500;
    }
    if (isLight) return color;
    if (color.value == Colors.red.shade600.value) {
      return Colors.red.shade300;
    }
    if (color.value == Colors.pink.shade400.value) {
      return Colors.pink.shade300;
    }
    if (color.value == Colors.purple.shade500.value) {
      return Colors.purple.shade300;
    }
    if (color.value == Colors.deepPurple.shade500.value) {
      return Colors.deepPurple.shade300;
    }
    if (color.value == Colors.indigo.shade500.value) {
      return Colors.indigo.shade300;
    }
    if (color.value == Colors.blue.shade500.value) {
      return Colors.blue.shade300;
    }
    if (color.value == Colors.cyan.shade600.value) {
      return Colors.cyan.shade300;
    }
    if (color.value == Colors.teal.shade500.value) {
      return Colors.teal.shade300;
    }
    if (color.value == Colors.green.shade500.value) {
      return Colors.green.shade300;
    }
    if (color.value == Colors.lightGreen.shade700.value) {
      return Colors.lightGreen.shade300;
    }
    if (color.value == Colors.orange.shade800.value) {
      return Colors.orange.shade300;
    }
    if (color.value == Colors.yellow.shade800.value) {
      return Colors.yellow.shade300;
    }
    if (color.value == Colors.brown.shade500.value) {
      return Colors.brown.shade300;
    }
    if (color.value == Colors.grey.shade600.value) {
      return Colors.grey.shade300;
    }
    if (color.value == Colors.blueGrey.shade500.value) {
      return Colors.blueGrey.shade300;
    }
    if (color.value == AppBaseColors.dark.shade500.value) {
      return AppBaseColors.dark.shade200;
    }
    if (color.value == AppBaseColors.blue.shade500.value) {
      return AppBaseColors.blue.shade200;
    }
    if (color.value == AppBaseColors.teal.shade500.value) {
      return AppBaseColors.teal.shade200;
    }
    if (color.value == AppBaseColors.pink.shade500.value) {
      return AppBaseColors.pink.shade200;
    }

    return color;
  }

  Color getLightColor(Color color) {
    if (isLight) return color;
    if (color.value == Colors.red.shade300.value) {
      return Colors.red.shade600;
    }
    if (color.value == Colors.pink.shade300.value) {
      return Colors.pink.shade400;
    }
    if (color.value == Colors.purple.shade300.value) {
      return Colors.purple.shade500;
    }
    if (color.value == Colors.deepPurple.shade300.value) {
      return Colors.deepPurple.shade500;
    }
    if (color.value == Colors.indigo.shade300.value) {
      return Colors.indigo.shade500;
    }
    if (color.value == Colors.blue.shade300.value) {
      return Colors.blue.shade500;
    }
    if (color.value == Colors.cyan.shade300.value) {
      return Colors.cyan.shade600;
    }
    if (color.value == Colors.teal.shade300.value) {
      return Colors.teal.shade500;
    }
    if (color.value == Colors.green.shade300.value) {
      return Colors.green.shade500;
    }
    if (color.value == Colors.lightGreen.shade300.value) {
      return Colors.lightGreen.shade700;
    }
    if (color.value == Colors.orange.shade300.value) {
      return Colors.orange.shade800;
    }
    if (color.value == Colors.yellow.shade300.value) {
      return Colors.yellow.shade800;
    }
    if (color.value == Colors.brown.shade300.value) {
      return Colors.brown.shade500;
    }
    if (color.value == Colors.grey.shade300.value) {
      return Colors.grey.shade600;
    }
    if (color.value == Colors.blueGrey.shade300.value) {
      return Colors.blueGrey.shade500;
    }
    return color;
  }

  List<MaterialColor> get colorPicker =>
      isLight ? lightColorsPicker : darkColorsPicker;

  final lightColorsPicker = [
    MaterialColor(Colors.red.shade600.value, {500: Colors.red.shade600}),
    MaterialColor(Colors.pink.shade400.value, {500: Colors.pink.shade400}),
    MaterialColor(Colors.purple.shade500.value, {500: Colors.purple.shade500}),
    MaterialColor(
        Colors.deepPurple.shade500.value, {500: Colors.deepPurple.shade500}),
    MaterialColor(Colors.indigo.shade500.value, {500: Colors.indigo.shade500}),
    MaterialColor(Colors.blue.shade500.value, {500: Colors.blue.shade500}),
    MaterialColor(Colors.cyan.shade600.value, {500: Colors.cyan.shade600}),
    MaterialColor(Colors.teal.shade500.value, {500: Colors.teal.shade500}),
    MaterialColor(Colors.green.shade500.value, {500: Colors.green.shade500}),
    MaterialColor(
        Colors.lightGreen.shade700.value, {500: Colors.lightGreen.shade700}),
    MaterialColor(Colors.yellow.shade800.value, {500: Colors.yellow.shade800}),
    MaterialColor(Colors.orange.shade800.value, {500: Colors.orange.shade800}),
    MaterialColor(Colors.brown.shade500.value, {500: Colors.brown.shade500}),
    MaterialColor(Colors.grey.shade600.value, {500: Colors.grey.shade600}),
    MaterialColor(
        Colors.blueGrey.shade500.value, {500: Colors.blueGrey.shade500}),
  ];

  final darkColorsPicker = [
    MaterialColor(Colors.red.shade300.value, {500: Colors.red.shade300}),
    MaterialColor(Colors.pink.shade300.value, {500: Colors.pink.shade300}),
    MaterialColor(Colors.purple.shade300.value, {500: Colors.purple.shade300}),
    MaterialColor(
        Colors.deepPurple.shade300.value, {500: Colors.deepPurple.shade300}),
    MaterialColor(Colors.indigo.shade300.value, {500: Colors.indigo.shade300}),
    MaterialColor(Colors.blue.shade300.value, {500: Colors.blue.shade300}),
    MaterialColor(Colors.cyan.shade300.value, {500: Colors.cyan.shade300}),
    MaterialColor(Colors.teal.shade300.value, {500: Colors.teal.shade300}),
    MaterialColor(Colors.green.shade300.value, {500: Colors.green.shade300}),
    MaterialColor(
        Colors.lightGreen.shade300.value, {500: Colors.lightGreen.shade300}),
    MaterialColor(Colors.yellow.shade300.value, {500: Colors.yellow.shade300}),
    MaterialColor(Colors.orange.shade300.value, {500: Colors.orange.shade300}),
    MaterialColor(Colors.brown.shade300.value, {500: Colors.brown.shade300}),
    MaterialColor(Colors.grey.shade300.value, {500: Colors.grey.shade300}),
    MaterialColor(
        Colors.blueGrey.shade300.value, {500: Colors.blueGrey.shade300}),
  ];
}
