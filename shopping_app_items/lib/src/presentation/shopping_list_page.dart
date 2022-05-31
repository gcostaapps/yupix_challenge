import 'package:dependencies_core/dependencies_core.dart' hide State;
import 'package:flutter/material.dart';

import 'package:shopping_app_core/shopping_app_core.dart';

import '../application/cubit/search_cubit.dart';
import 'widgets/dismissible_category.dart';
import 'widgets/shopping_list_page_header.dart';

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<ShoppingListWatcherCubit, ShoppingListWatcherState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => const _ShoppingListLoading(),
              loading: (_) => const _ShoppingListLoading(),
              failed: (_) => const _ShoppingListFailed(),
              loaded: (state) {
                context
                    .read<SearchCubit>()
                    .updateDefaultLists(state.categories, state.items);
                return const _ShoppingListView();
              },
            );
          },
        );
      }),
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

class _ShoppingListView extends StatefulWidget {
  const _ShoppingListView({Key? key}) : super(key: key);

  @override
  State<_ShoppingListView> createState() => __ShoppingListViewState();
}

class __ShoppingListViewState extends State<_ShoppingListView> {
  List<bool> expandedCategories = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listenWhen: (p, c) {
        final hasChangedCategories =
            p.filteredCategories.length != c.filteredCategories.length;
        return hasChangedCategories;
      },
      listener: (context, state) =>
          resetExpandedCategories(state.filteredCategories.length),
      builder: (context, state) {
        if (expandedCategories.isEmpty) {
          expandedCategories =
              List.generate(state.filteredCategories.length, (_) => false);
        }
        return BlocListener<ShoppingListActorCubit, ShoppingListActorState>(
          listenWhen: (p, c) =>
              p.removeFailureOrSuccessOption.isNone() &&
              c.removeFailureOrSuccessOption.isSome(),
          listener: (_, __) =>
              resetExpandedCategories(state.filteredCategories.length),
          child: CustomScrollView(
            slivers: [
              const ShoppingListPageHeader(),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.filteredCategories.length,
                    (context, index) {
                      final category = state.filteredCategories[index];
                      final categoryShoppingItems = state.filteredItems
                          .where((item) => item.categoryId == category.id)
                          .toList();
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: DismissibleCategory(
                          category: category,
                          categoryShoppingItems: categoryShoppingItems,
                          isExpanded: expandedCategories[index],
                          onExpandedChanged: (v) =>
                              setState(() => expandedCategories[index] = v),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void resetExpandedCategories(int length) {
    if (expandedCategories.length != length) {
      setState(() => expandedCategories = List.generate(length, (_) => false));
    }
  }
}
