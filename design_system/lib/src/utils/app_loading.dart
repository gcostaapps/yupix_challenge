import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../theme/theme.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    Key? key,
    this.text,
    this.cancelable = false,
  }) : super(key: key);

  final String? text;
  final bool cancelable;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (cancelable) {
          context.loaderOverlay.hide();
        }
        return Future.value(false);
      },
      child: Container(
        color: AppBaseColors.darkSurfaceColors,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: AppBaseColors.offWhite,
                  size: 40,
                ),
              ),
              if (text != null) ...[
                const SizedBox(height: 16),
                Text(
                  text!,
                  style: context.textTheme.bodyText1!.copyWith(
                    color: AppBaseColors.offWhite,
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
