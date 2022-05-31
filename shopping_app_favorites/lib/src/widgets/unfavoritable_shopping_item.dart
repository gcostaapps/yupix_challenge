import 'package:dependencies_core/dependencies_core.dart' hide State;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

import 'package:design_system/design_system.dart';

import 'unfavoritable_container.dart';

class UnfavoritableShoppingItem extends StatelessWidget {
  const UnfavoritableShoppingItem({
    Key? key,
    required this.shoppingItem,
  }) : super(key: key);

  final ShoppingItem shoppingItem;

  @override
  Widget build(BuildContext context) {
    return DismissibleItem(
      key: UniqueKey(),
      confirmDismiss: (_) {
        context
            .read<ShoppingListActorCubit>()
            .favoriteShoppingItem(shoppingItem.copyWith(isFavorite: false));
        return Future.value(true);
      },
      rightToLeftWidget: const UnfavoritableContainer(),
      child: ShoppingItemWidget(
        isFavorite: shoppingItem.isFavorite,
        onTapFavorite: (ctx) => ctx
            .read<ShoppingListActorCubit>()
            .favoriteShoppingItem(shoppingItem.copyWith(isFavorite: false)),
        title: shoppingItem.name,
        url: shoppingItem.imageUrl,
        subtitle: shoppingItem.favoritedAt != null
            ? 'Added on ${DateFormat.MMMd().format(shoppingItem.favoritedAt!)}'
            : null,
      ),
    );
  }
}
