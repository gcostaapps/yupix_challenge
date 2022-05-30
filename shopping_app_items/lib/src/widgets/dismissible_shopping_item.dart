import 'package:dependencies_core/dependencies_core.dart' hide State;
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:shopping_app_core/shopping_app_core.dart';

import 'delete_container.dart';
import 'favorite_container.dart';

class DismissibleShoppingItem extends StatefulWidget {
  const DismissibleShoppingItem({
    Key? key,
    required this.shoppingItem,
    required this.onDismissed,
  }) : super(key: key);

  final ShoppingItem shoppingItem;
  final Function(DismissDirection) onDismissed;

  @override
  State<DismissibleShoppingItem> createState() =>
      _DismissibleShoppingItemState();
}

class _DismissibleShoppingItemState extends State<DismissibleShoppingItem> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.shoppingItem.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return DismissibleItem(
      key: UniqueKey(),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          if (!isFavorite) {
            await context.read<ShoppingListActorCubit>().updateShoppingItem(
                widget.shoppingItem
                    .copyWith(isFavorite: true, favoritedAt: DateTime.now()));
          }
          return Future.value(false);
        }
        final confirmDelete = await AppDialogs.showWarningDialog<bool>(
          context,
          title: 'Delete category?',
          message:
              'You will also delete all items associated with this category. This action is irreversible. Are you sure?',
          onConfirm: (c) => Navigator.pop(c, true),
        );
        if (confirmDelete == true) {
          final deleted = context
              .read<ShoppingListActorCubit>()
              .removeItem(widget.shoppingItem);
          return Future.value(deleted);
        }

        return Future.value(false);
      },
      onDismissed: widget.onDismissed,
      rightToLeftWidget: const DeleteContainer(),
      leftToRightWidget: const FavoriteContainer(),
      child: ShoppingItemWidget(
        isFavorite: widget.shoppingItem.isFavorite,
        onTapFavorite: (ctx) async {
          if (!isFavorite) {
            await ctx.read<ShoppingListActorCubit>().updateShoppingItem(widget
                .shoppingItem
                .copyWith(isFavorite: true, favoritedAt: DateTime.now()));
          }
        },
        title: widget.shoppingItem.name,
        url: widget.shoppingItem.imageUrl,
      ),
    );
  }
}
