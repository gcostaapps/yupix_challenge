import 'package:flutter/material.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

import 'unfavoritable_shopping_item.dart';

class FavoriteCategoryShoppingItems extends StatelessWidget {
  const FavoriteCategoryShoppingItems({
    Key? key,
    required this.shoppingItems,
  }) : super(key: key);

  final List<ShoppingItem> shoppingItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: LayoutBuilder(builder: (context, constraints) {
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: shoppingItems
              .map((item) => SizedBox(
                    width: constraints.maxWidth / 2 - 8,
                    child: UnfavoritableShoppingItem(shoppingItem: item),
                  ))
              .toList(),
        );
      }),
    );
  }
}
