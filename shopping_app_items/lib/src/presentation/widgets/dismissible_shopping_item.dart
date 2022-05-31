import 'package:dependencies_core/dependencies_core.dart' hide State;
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:shopping_app_core/shopping_app_core.dart';

import 'delete_container.dart';
import 'favorite_container.dart';

class DismissibleShoppingItem extends StatelessWidget {
  const DismissibleShoppingItem({
    Key? key,
    required this.shoppingItem,
  }) : super(key: key);

  final ShoppingItem shoppingItem;

  @override
  Widget build(BuildContext context) {
    return DismissibleItem(
      key: UniqueKey(),
      confirmDismiss: (v) async => dismissShoppingItem(context, v),
      rightToLeftWidget: const DeleteContainer(),
      leftToRightWidget: const FavoriteContainer(),
      child: ShoppingItemWidget(
        isFavorite: shoppingItem.isFavorite,
        onTapFavorite: (ctx) async => favoriteShoppingItem(ctx),
        title: shoppingItem.name,
        url: shoppingItem.imageUrl,
      ),
    );
  }

  Future<bool> dismissShoppingItem(
    BuildContext context,
    DismissDirection direction,
  ) async {
    final isFavoriteDirection = direction == DismissDirection.startToEnd;
    if (isFavoriteDirection) {
      return favoriteShoppingItem(context);
    }

    if (await confirmDeletion(context)) return deleteItem(context);

    return Future.value(false);
  }

  Future<bool> favoriteShoppingItem(BuildContext context) async {
    if (!shoppingItem.isFavorite) {
      await context.read<ShoppingListActorCubit>().favoriteShoppingItem(
          shoppingItem.copyWith(isFavorite: true, favoritedAt: DateTime.now()));
    }
    return Future.value(false);
  }

  Future<bool> confirmDeletion(BuildContext context) async {
    final delete = await AppDialogs.showWarningDialog<bool>(
      context,
      title: 'Delete category?',
      message:
          'You will also delete all items associated with this category. This action is irreversible. Are you sure?',
      onConfirm: (c) => Navigator.pop(c, true),
    );
    return delete == true;
  }

  Future<bool> deleteItem(BuildContext context) async {
    context.loaderOverlay.show(widget: const AppLoading(text: 'Deleting item'));
    final deleted =
        await context.read<ShoppingListActorCubit>().removeItem(shoppingItem);
    context.loaderOverlay.hide();
    return Future.value(deleted);
  }
}
