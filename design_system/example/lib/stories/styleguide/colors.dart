import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:design_system/design_system.dart';

import '../../utils.dart';

final colorsStory = Story(
  name: 'Styleguide/Colors',
  builder: (BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children:
          appColors.map((color) => ColoredContainer(color: color)).toList(),
    );
  },
);

class ColoredContainer extends StatelessWidget {
  const ColoredContainer({
    Key? key,
    required this.color,
  }) : super(key: key);

  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: AppBaseColors.getLinearGradient(
          context.isLightMode ? color.shade500 : color.shade200,
        ),
      ),
    );
  }
}
