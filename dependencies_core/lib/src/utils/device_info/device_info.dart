// ignore_for_file: constant_identifier_names
// ignore-for-file: prefer-match-file-name
// ignore-for-file: avoid_classes_with_only_static_members

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_platform/universal_platform.dart';

enum FormFactorType { Monitor, SmallPhone, LargePhone, Tablet }

class DeviceOS {
  // Syntax sugar, proxy the UniversalPlatform methods so our views can reference a single class
  static bool isIOS = UniversalPlatform.isIOS;
  static bool isAndroid = UniversalPlatform.isAndroid;
  static bool isMacOS = UniversalPlatform.isMacOS;
  static bool isLinux = UniversalPlatform.isLinux;
  static bool isWindows = UniversalPlatform.isWindows;

  // Higher level device class abstractions (more syntax sugar for the views)
  static bool isWeb = kIsWeb;
  static bool get isDesktop => isWindows || isMacOS || isLinux;
  static bool get isMobile => isAndroid || isIOS;
  static bool get isDesktopOrWeb => isDesktop || isWeb;
  static bool get isMobileOrWeb => isMobile || isWeb;
}

class DeviceScreen {
  // Get the device form factor as best we can.
  // Otherwise we will use the screen size to determine which class we fall into.

  static double smallPhoneDiagonalPx = 550;
  static double largePhoneDiagonalPx = 900;
  static double tabletDiagonalPx = 1500;
  static FormFactorType get(BuildContext context) {
    final Size s = MediaQuery.of(context).size;
    final double diagonalPx = sqrt((s.width * s.width) + (s.height * s.height));

    if (diagonalPx <= smallPhoneDiagonalPx) return FormFactorType.SmallPhone;
    if (diagonalPx <= largePhoneDiagonalPx) return FormFactorType.LargePhone;
    if (diagonalPx <= tabletDiagonalPx) return FormFactorType.Tablet;
    return FormFactorType.Monitor;
  }

  // Shortcuts for various mobile device types
  static bool isPhone(BuildContext context) =>
      isSmallPhone(context) || isLargePhone(context);
  static bool isTablet(BuildContext context) =>
      get(context) == FormFactorType.Tablet;
  static bool isMonitor(BuildContext context) =>
      get(context) == FormFactorType.Monitor;
  static bool isSmallPhone(BuildContext context) =>
      get(context) == FormFactorType.SmallPhone;
  static bool isLargePhone(BuildContext context) =>
      get(context) == FormFactorType.LargePhone;
}
