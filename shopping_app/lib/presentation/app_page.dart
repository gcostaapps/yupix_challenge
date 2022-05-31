import 'package:beamer/beamer.dart';
import 'package:dependencies_core/dependencies_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

import '../router_delegate.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShoppingListWatcherCubit>(
          create: (context) =>
              ShoppingListWatcherCubit(context.read(), context.read())
                ..loadItemsAndCategories(),
        ),
        BlocProvider<ShoppingListActorCubit>(
          create: (context) => ShoppingListActorCubit(
            context.read(),
            context.read(),
            context.read(),
            context.read(),
          ),
        ),
      ],
      child: GlobalLoaderOverlay(
        child: MaterialApp.router(
          title: 'Shopping App',
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
          scrollBehavior: DeviceOS.isDesktop ? MyCustomScrollBehavior() : null,
          debugShowCheckedModeBanner: false,
          routeInformationParser: BeamerParser(),
          routerDelegate: CustomRouterDelegate.routerDelegate,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}

/// This is a workaround for emulate drag on desktop with mouse without need to use scroll wheel for debugging purposes.
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
