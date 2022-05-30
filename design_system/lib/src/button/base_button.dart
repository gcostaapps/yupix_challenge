import 'package:flutter/material.dart';

import '../theme/theme.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.text,
    required this.enabled,
    required this.wide,
  }) : super(key: key);

  final String text;
  final bool enabled;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    const double height = 40;

    final textColor =
        enabled ? context.colorScheme.onPrimary : AppBaseColors.placeholder;

    final textWidget = Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: context.textTheme.button!.copyWith(color: textColor),
      ),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: wide ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (wide) Expanded(child: textWidget),
              if (!wide) Flexible(child: textWidget),
            ],
          ),
        ),
      ),
    );
  }
}
