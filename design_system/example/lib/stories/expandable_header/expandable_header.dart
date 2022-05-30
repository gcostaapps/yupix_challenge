import 'package:design_system/design_system.dart';
import 'package:example/utils.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final expandableHeaderStory = Story(
  name: 'Widgets/Headers/Expandable Header',
  builder: (BuildContext context) {
    List<Option<MaterialColor>> optionColors = appColorsMap.entries
        .map((color) => Option(label: color.key, value: color.value))
        .toList();

    final color = context.knobs.options<MaterialColor>(
      label: 'Color',
      initial: optionColors.first.value,
      options: optionColors,
    );

    final text = context.knobs.text(label: 'Test', initial: 'Test');

    final length =
        context.knobs.sliderInt(label: 'Number of items', initial: 0, max: 20);
    return Column(
      children: [
        const SizedBox(height: 200),
        ExpandableHeader(
          text: text,
          color: color,
          length: length,
          isExpanded: false,
          onExpandedChanged: (_) => {},
          child: Container(
            width: double.infinity,
            height: 200,
            color: Colors.red,
          ),
        ),
      ],
    );
  },
);
