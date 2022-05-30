import 'dart:ui';

import 'package:flutter/material.dart';

import '../../design_system.dart';

class AppDialogs {
  static Future<T?> showDialogBlurred<T extends Object?>(
    BuildContext context,
    Widget child, {
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        barrierDismissible: barrierDismissible,
        barrierLabel: '',
        barrierColor: AppBaseColors.darkSurfaceColors,
        pageBuilder: (ctx, anim1, anim2) => child,
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 8,
          ),
          child: FadeTransition(
            opacity: anim1,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: child,
              ),
            ),
          ),
        ),
        context: context,
      );

  static Future<T?> showWarningDialog<T extends Object?>(
    BuildContext context, {
    required String title,
    required String message,
    required Function(BuildContext) onConfirm,
    bool isDelete = true,
    double maxWidth = 800,
  }) =>
      showGeneralDialog<T>(
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: AppBaseColors.darkSurfaceColors,
        pageBuilder: (ctx, anim1, anim2) {
          return CustomDialog(
            isWarning: isDelete,
            title: title,
            message: message,
            onConfirm: onConfirm,
            maxWidth: maxWidth,
          );
        },
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 8,
          ),
          child: FadeTransition(
            opacity: anim1,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: child,
              ),
            ),
          ),
        ),
        context: context,
      );

  static Future<T?> showPrimaryDialog<T extends Object?>(
    BuildContext context, {
    required String title,
    required String message,
    required Function(BuildContext) onConfirm,
    IconData? icon,
    double maxWidth = 800,
  }) =>
      showGeneralDialog<T>(
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: AppBaseColors.darkSurfaceColors,
        pageBuilder: (ctx, anim1, anim2) {
          return CustomDialog(
            isWarning: false,
            title: title,
            message: message,
            onConfirm: onConfirm,
            confirmIcon: icon ?? Icons.check,
            maxWidth: maxWidth,
          );
        },
        transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 8,
          ),
          child: FadeTransition(
            opacity: anim1,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: child,
              ),
            ),
          ),
        ),
        context: context,
      );
}
