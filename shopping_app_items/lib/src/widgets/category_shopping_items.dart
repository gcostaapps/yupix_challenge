import 'package:dependencies_core/dependencies_core.dart' hide State;
import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

import 'dismissible_shopping_item.dart';

class CategoryShoppingItems extends StatefulWidget {
  const CategoryShoppingItems({
    Key? key,
    required this.shoppingItems,
  }) : super(key: key);

  final List<ShoppingItem> shoppingItems;

  @override
  State<CategoryShoppingItems> createState() => _CategoryShoppingItemsState();
}

class _CategoryShoppingItemsState extends State<CategoryShoppingItems> {
  late List<ShoppingItem> localShoppingItems;
  @override
  void initState() {
    super.initState();
    localShoppingItems = widget.shoppingItems;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShoppingListActorCubit, ShoppingListActorState>(
      listenWhen: (p, c) =>
          p.favoriteFailureOrSuccessOption !=
              c.favoriteFailureOrSuccessOption &&
          c.favoriteFailureOrSuccessOption.isSome(),
      listener: (context, state) {
        final favoriteOrFailure =
            state.favoriteFailureOrSuccessOption.fold(() => null, (a) => a)!;
        if (favoriteOrFailure.isRight()) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Item added to favorites'),
            duration: Duration(seconds: 2),
          ));
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: LayoutBuilder(builder: (context, constraints) {
          return ReorderableWrap(
            needsLongPressDraggable: false,
            onReorder: (_, __) => {},
            spacing: 16,
            runSpacing: 16,
            buildDraggableFeedback: (_, __, child) => Material(
              elevation: 20,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: child,
              ),
            ),
            children: localShoppingItems
                .map((item) => SizedBox(
                      width: constraints.maxWidth / 2 - 8,
                      child: DismissibleShoppingItem(
                        shoppingItem: item,
                        onDismissed: (_) {
                          //In case that the stream takes a long time to update
                          setState(() {
                            localShoppingItems.removeAt(
                              localShoppingItems.indexOf(item),
                            );
                          });
                        },
                      ),
                    ))
                .toList(),
          );
        }),
      ),
    );
  }
}
