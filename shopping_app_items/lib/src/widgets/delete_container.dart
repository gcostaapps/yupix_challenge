import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DeleteContainer extends StatelessWidget {
  const DeleteContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      color: context.isLightMode ? Colors.red : Colors.red.shade200,
      padding: const EdgeInsets.only(right: 24),
      child: Icon(Icons.delete, color: context.colorScheme.onPrimary),
    );
  }
}
