import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';

import 'presentation/home_page.dart';

class CustomRouterDelegate {
  static BeamerDelegate routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const BeamPage(
              key: ValueKey('HomePage'),
              child: HomePage(),
            ),
      },
    ),
  );
}
