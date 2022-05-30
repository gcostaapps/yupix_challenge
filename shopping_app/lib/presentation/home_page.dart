import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app_favorites/shopping_app_favorites.dart';
import 'package:shopping_app_form/shopping_app_form.dart';
import 'package:shopping_app_items/shopping_app_items.dart';

import '../application/home_drawer/home_drawer_cubit.dart';
import 'widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeDrawerCubit(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeDrawerCubit, HomeDrawerState>(
      builder: (context, state) => Scaffold(
        backgroundColor: context.colorScheme.background,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: context.colorScheme.surface,
          title: Text(
            state.map(
              products: (_) => 'Shopping List',
              favorites: (_) => 'Favorites',
              newItem: (_) => 'New Item or Category',
            ),
          ),
          centerTitle: true,
        ),
        drawerScrimColor: AppBaseColors.darkSurfaceColors,
        drawer: const AppDrawer(),
        body: state.map(
          products: (_) => const ShoppingListPage(),
          favorites: (_) => const FavoritesPage(),
          newItem: (_) => const NewItemPage(),
        ),
      ),
    );
  }
}
