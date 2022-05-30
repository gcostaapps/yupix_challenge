import 'package:dependencies_core/dependencies_core.dart' hide State;
import 'package:flutter/material.dart';

import 'package:shopping_app_core/shopping_app_core.dart';

import 'widgets/category_panel.dart';
import 'widgets/empty_favorite_list.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListWatcherCubit, ShoppingListWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const _FavoritesLoading(),
          loading: (_) => const _FavoritesLoading(),
          failed: (_) => const _FavoritesFailed(),
          loaded: (state) {
            return _FavoritesView(
              categories: state.categories,
              shoppingItems: state.items,
            );
          },
        );
      },
    );
  }
}

class _FavoritesView extends StatefulWidget {
  const _FavoritesView({
    Key? key,
    required this.categories,
    required this.shoppingItems,
  }) : super(key: key);

  final List<Category> categories;
  final List<ShoppingItem> shoppingItems;

  @override
  State<_FavoritesView> createState() => __FavoritesViewState();
}

class __FavoritesViewState extends State<_FavoritesView> {
  late List<bool> expandedCategories;
  late List<ShoppingItem> favoriteShoppingItems;
  late List<Category> favoriteCategories;

  @override
  void initState() {
    super.initState();
    expandedCategories = List.generate(widget.categories.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    favoriteShoppingItems = List<ShoppingItem>.from(
        widget.shoppingItems.where((item) => item.isFavorite));
    favoriteCategories = widget.categories
        .where((category) => favoriteShoppingItems
            .where((item) => category.id == item.categoryId)
            .isNotEmpty)
        .toList();

    return BlocListener<ShoppingListActorCubit, ShoppingListActorState>(
      listenWhen: (p, c) =>
          p.favoriteFailureOrSuccessOption !=
              c.favoriteFailureOrSuccessOption &&
          c.favoriteFailureOrSuccessOption.isSome(),
      listener: (context, state) {
        final favoriteOrFailure =
            state.favoriteFailureOrSuccessOption.fold(() => null, (a) => a)!;
        if (favoriteOrFailure.isRight()) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Item removed from favorites'),
            duration: Duration(seconds: 2),
          ));
        }
      },
      child: favoriteCategories.isEmpty
          ? const EmptyFavoriteList()
          : CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: favoriteCategories.length,
                      (context, index) {
                        final category = favoriteCategories[index];
                        final categoryShoppingItems = favoriteShoppingItems
                            .where((item) => item.categoryId == category.id)
                            .toList();
                        return CategoryPanel(
                          category: category,
                          categoryShoppingItems: categoryShoppingItems,
                          isExpanded: expandedCategories[index],
                          onExpandedChanged: (v) =>
                              setState(() => expandedCategories[index] = v),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _FavoritesLoading extends StatelessWidget {
  const _FavoritesLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _FavoritesFailed extends StatelessWidget {
  const _FavoritesFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error, check your internet connection'),
    );
  }
}
