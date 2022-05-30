import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'empty_shopping_list.dart';

class ShoppingListPageHeader extends StatelessWidget {
  const ShoppingListPageHeader({
    Key? key,
    required this.showEmptyState,
    required this.onSearchChanged,
  }) : super(key: key);

  final bool showEmptyState;
  final Function(String) onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            const SizedBox(height: 40),
            AppFormField(
              hint: 'Search by item name or category',
              iconData: Icons.search,
              onChanged: onSearchChanged,
            ),
            const SizedBox(height: 24),
            if (showEmptyState) const EmptyShoppingList()
          ],
        ),
      ),
    );
  }
}
