import 'package:dependencies_core/dependencies_core.dart' hide State;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

import 'package:design_system/design_system.dart';

import 'unfavoritable_container.dart';

class UnfavoritableShoppingItem extends StatefulWidget {
  const UnfavoritableShoppingItem({
    Key? key,
    required this.shoppingItem,
  }) : super(key: key);

  final ShoppingItem shoppingItem;

  @override
  State<UnfavoritableShoppingItem> createState() =>
      _UnfavoritableShoppingItemState();
}

class _UnfavoritableShoppingItemState extends State<UnfavoritableShoppingItem> {
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
      confirmDismiss: (_) {
        context.read<ShoppingListActorCubit>().updateShoppingItem(
            widget.shoppingItem.copyWith(isFavorite: false));
        return Future.value(true);
      },
      onDismissed: (_) {},
      rightToLeftWidget: const UnfavoritableContainer(),
      child: ShoppingItemWidget(
        isFavorite: isFavorite,
        onTapFavorite: (ctx) async {
          ctx.read<ShoppingListActorCubit>().updateShoppingItem(
              widget.shoppingItem.copyWith(isFavorite: false));
        },
        title: widget.shoppingItem.name,
        url: widget.shoppingItem.imageUrl,
        subtitle: widget.shoppingItem.favoritedAt != null
            ? 'Added on ${DateFormat.MMMd().format(widget.shoppingItem.favoritedAt!)}'
            : null,
      ),
    );
  }
}
