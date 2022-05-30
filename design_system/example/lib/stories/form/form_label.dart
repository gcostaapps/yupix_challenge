import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final formLabelStory = Story(
  name: 'Widgets/Form/Form Label',
  builder: (BuildContext context) {
    final text = context.knobs.text(label: 'Label', initial: 'Label');

    return FormLabel(text: text);
  },
);
