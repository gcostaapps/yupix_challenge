import 'package:flutter/material.dart';

class DismissibleItem extends StatelessWidget {
  const DismissibleItem({
    required Key key,
    required this.rightToLeftWidget,
    this.leftToRightWidget,
    required this.confirmDismiss,
    required this.onDismissed,
    required this.child,
  }) : super(key: key);

  final Widget rightToLeftWidget;
  final Widget? leftToRightWidget;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final Function(DismissDirection)? onDismissed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Dismissible(
          key: ValueKey(key),
          onDismissed: onDismissed,
          confirmDismiss: confirmDismiss,
          background: leftToRightWidget ?? Container(),
          secondaryBackground: rightToLeftWidget,
          direction: leftToRightWidget != null
              ? DismissDirection.horizontal
              : DismissDirection.endToStart,
          child: child,
        ),
      ),
    );
  }
}
