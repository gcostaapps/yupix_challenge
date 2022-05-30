import 'package:dependencies_core/dependencies_core.dart' hide State;
import 'package:flutter/material.dart';

import 'package:shopping_app_core/shopping_app_core.dart';

import 'widgets/dismissible_category.dart';
import 'widgets/shopping_list_page_header.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListWatcherCubit, ShoppingListWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const _ShoppingListLoading(),
          loading: (_) => const _ShoppingListLoading(),
          failed: (_) => const _ShoppingListFailed(),
          loaded: (state) {
            return _ShoppingListView(
              categories: state.categories,
              shoppingItems: state.items,
            );
          },
        );
      },
    );
  }
}

class _ShoppingListView extends StatefulWidget {
  const _ShoppingListView({
    Key? key,
    required this.categories,
    required this.shoppingItems,
  }) : super(key: key);

  final List<Category> categories;
  final List<ShoppingItem> shoppingItems;

  @override
  State<_ShoppingListView> createState() => __ShoppingListViewState();
}

class __ShoppingListViewState extends State<_ShoppingListView> {
  late List<bool> expandedCategories;

  String searchText = '';

  @override
  void initState() {
    super.initState();
    expandedCategories = getExpandedItems();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ShoppingListPageHeader(
          showEmptyState: widget.categories.isEmpty,
          onSearchChanged: (v) {},
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: widget.categories.length,
              (context, index) {
                final category = widget.categories[index];
                final categoryShoppingItems = widget.shoppingItems
                    .where((item) => item.categoryId == category.id)
                    .toList();
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: DismissibleCategory(
                    category: category,
                    categoryShoppingItems: categoryShoppingItems,
                    isExpanded: expandedCategories[index],
                    onDismissed: (_) {},
                    onExpandedChanged: (v) =>
                        setState(() => expandedCategories[index] = v),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  List<Category> getSearchedCategories() {
    return widget.categories
        .where((category) => category.name.contains(searchText))
        .toList();
  }

  List<ShoppingItem> getSearchedItems(List<Category> categories) {
    return widget.shoppingItems
        .where((item) =>
            item.name.contains(searchText) ||
            categories
                .where((category) => category.id == item.categoryId)
                .isNotEmpty)
        .toList();
  }

  List<bool> getExpandedItems() {
    return List.generate(
      widget.categories.length,
      (_) => false,
    );
  }
}

class _ShoppingListLoading extends StatelessWidget {
  const _ShoppingListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ShoppingListFailed extends StatelessWidget {
  const _ShoppingListFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error, check your internet connection'),
    );
  }
}
