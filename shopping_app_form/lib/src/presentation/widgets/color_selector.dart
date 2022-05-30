import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    Key? key,
    required this.color,
    required this.isSelected,
    required this.onSelectColor,
  }) : super(key: key);

  final MaterialColor color;
  final bool isSelected;
  final Function(Color) onSelectColor;

  @override
  Widget build(BuildContext context) {
    const pagePadding = 32;
    const numberOfSquaresInRow = 4;
    const horizontalPadding = 16;

    final widthAvailable = MediaQuery.of(context).size.width - pagePadding;
    final width = (widthAvailable / numberOfSquaresInRow) - horizontalPadding;

    return ClickableCard(
      onTap: () => onSelectColor(color.shade500),
      shadowColor: color,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          gradient: AppBaseColors.getLinearGradient(
            context.isLightMode ? color.shade500 : color.shade200,
          ),
        ),
        child: isSelected
            ? Icon(Icons.check, color: context.colorScheme.onPrimary)
            : null,
      ),
    );
  }
}
