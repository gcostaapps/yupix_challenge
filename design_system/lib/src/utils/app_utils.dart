import 'package:flutter/material.dart';

import '../theme/theme.dart';

class AppUtils {
  static const appColors = [
    AppBaseColors.blue,
    AppBaseColors.lavender,
    AppBaseColors.chili,
    AppBaseColors.magenta,
    AppBaseColors.pink,
    AppBaseColors.tiger,
    AppBaseColors.teal,
    AppBaseColors.warm,
  ];

  static MaterialColor colorShade500ToMaterial(Color color) {
    for (final materialColor in appColors) {
      if (materialColor.shade500.value == color.value) {
        return materialColor;
      }
    }
    return appColors.first;
  }
}
