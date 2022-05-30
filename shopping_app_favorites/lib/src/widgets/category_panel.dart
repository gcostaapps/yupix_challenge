import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

import 'favorite_category_shopping_items.dart';

class CategoryPanel extends StatelessWidget {
  const CategoryPanel({
    Key? key,
    required this.category,
    required this.categoryShoppingItems,
    required this.isExpanded,
    required this.onExpandedChanged,
  }) : super(key: key);

  final Category category;
  final List<ShoppingItem> categoryShoppingItems;
  final bool isExpanded;
  final Function(bool) onExpandedChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: ExpandableHeader(
          text: category.name,
          length: categoryShoppingItems.length,
          isExpanded: isExpanded,
          onExpandedChanged: onExpandedChanged,
          color: AppUtils.colorShade500ToMaterial(category.color),
          child: FavoriteCategoryShoppingItems(
            shoppingItems: categoryShoppingItems,
          ),
        ),
      ),
    );
  }
}
