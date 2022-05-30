import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final typographyStory = Story(
  name: 'Styleguide/Typography',
  builder: (BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Headline 1', style: Theme.of(context).textTheme.headline1),
        Text('Headline 2', style: Theme.of(context).textTheme.headline2),
        Text('Headline 3', style: Theme.of(context).textTheme.headline3),
        Text('Headline 4', style: Theme.of(context).textTheme.headline4),
        Text('Headline 5', style: Theme.of(context).textTheme.headline5),
        Text('Headline 6', style: Theme.of(context).textTheme.headline6),
        Text('Subtitle 1', style: Theme.of(context).textTheme.subtitle1),
        Text('Subtitle 2', style: Theme.of(context).textTheme.subtitle2),
        Text('Body 1', style: Theme.of(context).textTheme.bodyText1),
        Text('Body 2', style: Theme.of(context).textTheme.bodyText2),
        Text('BUTTON', style: Theme.of(context).textTheme.button),
        Text('Caption', style: Theme.of(context).textTheme.caption),
        Text('OVERLINE', style: Theme.of(context).textTheme.overline),
      ],
    );
  },
);
