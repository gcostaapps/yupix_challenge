// ignore_for_file: library_private_types_in_public_api

import 'package:design_system/design_system.dart';
import 'package:example/stories/button/button_stories.dart';
import 'package:example/stories/card/card_stories.dart';
import 'package:example/stories/dialogs/custom_dialog.dart';
import 'package:example/stories/form/form_stories.dart';
import 'package:example/stories/loading/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'stories/dismissible_item/dismissible_item.dart';
import 'stories/expandable_header/expandable_header.dart';
import 'stories/product_item/shopping_item.dart';
import 'stories/styleguide/styleguide_stories.dart';

final _plugins = initializePlugins(
  contentsSidePanel: true,
  knobsSidePanel: true,
  initialDeviceFrameData: DeviceFrameData(
    device: Devices.ios.iPhone13,
  ),
);

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Storybook(
      wrapperBuilder: (context, child) => GlobalLoaderOverlay(
        child: MaterialApp(
          theme: AppTheme().buildThemeData(
            primarySwatch: AppBaseColors.blue,
            secondarySwatch: AppBaseColors.blue,
            brightness: Brightness.light,
          ),
          darkTheme: AppTheme().buildThemeData(
            primarySwatch: AppBaseColors.blue,
            secondarySwatch: AppBaseColors.blue,
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          home: Builder(builder: (context) {
            return Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              body: Center(child: child),
            );
          }),
        ),
      ),
      plugins: _plugins,
      stories: [
        ...styleguideStories,
        ...buttonStories,
        ...cardStories,
        ...formStories,
        dismissibleItemStory,
        expandableHeaderStory,
        shoppingItemStory,
        customDialogStory,
        appLoadingStory,
      ],
    );
  }
}
