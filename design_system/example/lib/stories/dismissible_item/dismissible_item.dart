import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final dismissibleItemStory = Story(
  name: 'Widgets/Dismissible/Dismissible Item',
  builder: (BuildContext context) {
    final leftToRightWidget = Container(
      color: Colors.blue,
      child: const Icon(Icons.favorite),
    );

    final rightToLeftWidget = Container(
      color: Colors.red,
      child: const Icon(Icons.delete),
    );

    return Row(
      children: [
        Expanded(
          child: DismissibleItem(
            key: const ValueKey(1),
            rightToLeftWidget: rightToLeftWidget,
            leftToRightWidget: leftToRightWidget,
            confirmDismiss: (direction) async =>
                Future.value(direction == DismissDirection.startToEnd),
            onDismissed: (direction) => debugPrint(direction.toString()),
            child: Container(
              color: Colors.yellow,
              height: 200,
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: DismissibleItem(
            key: const ValueKey(2),
            rightToLeftWidget: rightToLeftWidget,
            leftToRightWidget: leftToRightWidget,
            confirmDismiss: (direction) async =>
                Future.value(direction == DismissDirection.startToEnd),
            onDismissed: (direction) => debugPrint(direction.toString()),
            child: Container(
              color: Colors.yellow,
              height: 200,
            ),
          ),
        ),
      ],
    );
  },
);
