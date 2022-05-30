import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class FavoriteContainer extends StatelessWidget {
  const FavoriteContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: context.isLightMode ? Colors.blue : Colors.blue.shade200,
      padding: const EdgeInsets.only(left: 24),
      child: Icon(Icons.favorite, color: context.colorScheme.onPrimary),
    );
  }
}
