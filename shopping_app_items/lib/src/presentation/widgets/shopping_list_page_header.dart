import 'package:dependencies_core/dependencies_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../application/cubit/search_cubit.dart';
import 'empty_shopping_list.dart';

class ShoppingListPageHeader extends StatelessWidget {
  const ShoppingListPageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (p, c) {
        final hasChangedCategoriesOrText =
            p.filteredCategories.length != c.filteredCategories.length ||
                p.searchText != c.searchText;
        return hasChangedCategoriesOrText;
      },
      builder: (context, state) {
        final isEmptyAndNotSearching =
            state.filteredCategories.isEmpty && state.searchText.trim().isEmpty;
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 40),
                AppFormField(
                  hint: 'Search by item name or category',
                  iconData: Icons.search,
                  onChanged: context.read<SearchCubit>().search,
                ),
                const SizedBox(height: 24),
                if (isEmptyAndNotSearching) const EmptyShoppingList()
              ],
            ),
          ),
        );
      },
    );
  }
}
