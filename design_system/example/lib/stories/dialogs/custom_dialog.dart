import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final customDialogStory = Story(
  name: 'Widgets/Dialogs/Custom Dialog',
  builder: (BuildContext context) {
    final warning = context.knobs.boolean(label: 'Warning', initial: false);
    final icon = context.knobs.options(
      label: 'Icon',
      initial: Icons.check,
      options: const [
        Option(label: 'Check', value: Icons.check),
        Option(label: 'Other', value: Icons.video_call),
      ],
    );

    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: Center(
        child: CustomDialog(
          isWarning: warning,
          message: context.knobs.text(label: 'Message', initial: 'Message'),
          title: context.knobs.text(label: 'Title', initial: 'Title'),
          confirmIcon: icon,
          onConfirm: (_) => {},
        ),
      ),
    );
  },
);
