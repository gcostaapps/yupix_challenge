import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final formFieldStory = Story(
  name: 'Widgets/Form/Form Field',
  builder: (BuildContext context) {
    final hint = context.knobs.text(label: 'Hint', initial: 'Hint');
    final icon = context.knobs.options(
      label: 'Icon',
      initial: null,
      options: const [
        Option(label: 'Null', value: null),
        Option(label: 'Search', value: Icons.search),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AppFormField(iconData: icon, hint: hint),
    );
  },
);
