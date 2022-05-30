import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/home_drawer/home_drawer_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final currentPage = context.select((HomeDrawerCubit c) => c.state);

    const productState = HomeDrawerState.products();
    const favoriteState = HomeDrawerState.favorites();
    const newItemState = HomeDrawerState.newItem();

    return Drawer(
      backgroundColor: context.colorScheme.surface,
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.2),
          Text(
            'Shopping List',
            style: context.textTheme.headline4!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenHeight * 0.1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DrawerItem(
                title: 'Items List',
                iconData: Icons.format_list_bulleted,
                isSelected: currentPage == productState,
                onTap: () =>
                    onTapDrawerItem(context, currentPage, productState),
              ),
              _DrawerItem(
                title: 'Favorites',
                iconData: Icons.favorite_border,
                isSelected: currentPage == favoriteState,
                onTap: () =>
                    onTapDrawerItem(context, currentPage, favoriteState),
              ),
              _DrawerItem(
                title: 'Add Item',
                iconData: Icons.add,
                isSelected: currentPage == newItemState,
                onTap: () =>
                    onTapDrawerItem(context, currentPage, newItemState),
              ),
            ],
          )
        ],
      ),
    );
  }

  void onTapDrawerItem(
    BuildContext context,
    HomeDrawerState currentPage,
    HomeDrawerState pageSelected,
  ) {
    if (pageSelected != currentPage) {
      context.read<HomeDrawerCubit>().onTapDrawerItem(pageSelected);
    }
    Navigator.pop(context);
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    Key? key,
    required this.title,
    required this.iconData,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? context.colorScheme.primary
        : context.colorScheme.onBackground;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: color,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: context.textTheme.headline6!.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
