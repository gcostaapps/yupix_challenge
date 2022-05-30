import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final appLoadingStory = Story(
  name: 'Widgets/Loading/App Loading',
  builder: (BuildContext context) {
    final text = context.knobs.text(label: 'Text', initial: 'App Loading');

    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.loaderOverlay.show(widget: AppLoading(text: text));
          Future.delayed(
            const Duration(seconds: 2),
            () => context.loaderOverlay.hide(),
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Show app loading'),
        ),
      ),
    );
  },
);
