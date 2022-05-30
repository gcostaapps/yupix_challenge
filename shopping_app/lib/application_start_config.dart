import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dependencies_core/dependencies_core.dart';
import 'package:design_system/design_system.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

import 'firebase_options.dart';
import 'utils/app_bloc_observer.dart';

class ApplicationStartConfig {
  Future<void> configureApp(Widget appWidget) async {
    WidgetsFlutterBinding.ensureInitialized();
    _improveGradients();
    if (!DeviceOS.isDesktop) await _initializeDatabase();

    //Provide Core Services and Repositories
    appWidget = MultiRepositoryProvider(
      providers: [
        RepositoryProvider<FirebaseFirestore>(
          create: (context) => DeviceOS.isDesktop
              ? FakeFirebaseFirestore()
              : FirebaseFirestore.instance,
        ),
        RepositoryProvider<ICategoryDatasource>(
          create: (context) => CategoryDatasource(context.read()),
        ),
        RepositoryProvider<ICategoryRepository>(
          create: (context) => CategoryRepository(context.read()),
        ),
        RepositoryProvider<IShoppingItemDatasource>(
          create: (context) => ShoppingItemDatasource(context.read()),
        ),
        RepositoryProvider<IShoppingItemRepository>(
          create: (context) => ShoppingItemRepository(context.read()),
        ),
        RepositoryProvider<IImagePickerService>(
          create: (context) => ImagePickerService(),
        ),
        RepositoryProvider<IStorageService>(
          create: (context) => DeviceOS.isDesktop
              ? DesktopStorageService()
              : FirebaseStorageService(
                  FirebaseStorage.instanceFor(
                    bucket: 'gs://shopping-list-8820b.appspot.com/',
                  ),
                ),
        ),
      ],
      child: appWidget,
    );

    return BlocOverrides.runZoned(
      () async {
        runZonedGuarded(
          () async => runApp(_monitorPerfomanceWidget(appWidget)),
          (exception, stackTrace) =>
              debugPrint('Error\n$exception\n$stackTrace'),
          //In real life scenarios a logger would be used to log the errors (Crashlytics, Sentry, etc)
        );
      },
      blocObserver: AppBlocObserver(),
    );
  }

  void _improveGradients() => Paint.enableDithering = true;

  Future<void> _initializeDatabase() =>
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Widget _monitorPerfomanceWidget(Widget child) {
    return kDebugMode && DeviceOS.isWindows
        ? StatsFl(
            align: Alignment.bottomLeft,
            isEnabled: true,
            height: 56,
            child: child,
          )
        : child;
  }
}
