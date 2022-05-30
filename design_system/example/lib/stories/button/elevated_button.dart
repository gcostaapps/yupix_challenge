import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final elevatedButtonStory = Story(
  name: 'Widgets/Buttons/Elevated Button',
  builder: (BuildContext context) {
    final enabled = context.knobs.boolean(label: 'Enabled', initial: true);
    final radius =
        context.knobs.slider(label: 'Radius', initial: 12, min: 0, max: 50);
    final wide = context.knobs.boolean(label: 'Wide', initial: true);
    final text = context.knobs.text(label: 'Text', initial: 'Save');

    return Padding(
      padding: const EdgeInsets.all(24),
      child: AppElevatedButton(
        text: text,
        onTap: enabled ? () => {} : null,
        wide: wide,
        borderRadius: radius,
      ),
    );
  },
);
