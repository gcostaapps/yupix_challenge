import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class UnfavoritableContainer extends StatelessWidget {
  const UnfavoritableContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      color: context.isLightMode ? Colors.blue : Colors.blue.shade200,
      padding: const EdgeInsets.only(right: 24),
      child: Icon(Icons.favorite_border, color: context.colorScheme.onPrimary),
    );
  }
}
