import 'package:flutter/material.dart';

import '../card/clickable_card.dart';
import '../theme/app_theme.dart';
import 'base_button.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    Key? key,
    required this.text,
    this.onTap,
    this.iconData,
    this.wide = true,
    this.borderRadius = 12,
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final IconData? iconData;
  final bool wide;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClickableCard(
      borderRadius: BorderRadius.circular(borderRadius),
      shadowColor: onTap != null
          ? context.theme.primaryColorLight.withOpacity(
              context.theme.brightness == Brightness.light ? 0.75 : 0.1,
            )
          : null,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: onTap != null ? null : context.theme.disabledColor,
          gradient: onTap != null ? context.linearGradient : null,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: BaseButton(
          text: text,
          wide: wide,
          enabled: onTap != null,
        ),
      ),
    );
  }
}
