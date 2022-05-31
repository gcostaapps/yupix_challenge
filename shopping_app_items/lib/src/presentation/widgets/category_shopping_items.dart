import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

import 'package:dependencies_core/dependencies_core.dart' hide State;

import 'dismissible_shopping_item.dart';

class CategoryShoppingItems extends StatelessWidget {
  const CategoryShoppingItems({
    Key? key,
    required this.shoppingItems,
  }) : super(key: key);

  final List<ShoppingItem> shoppingItems;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShoppingListActorCubit, ShoppingListActorState>(
      listenWhen: (p, c) {
        final hasFinishedFavorite = p.favoriteFailureOrSuccessOption.isNone() &&
            c.favoriteFailureOrSuccessOption.isSome();
        final hasFinishedReorder = p.reorderFailureOrSuccessOption.isNone() &&
            c.reorderFailureOrSuccessOption.isSome();
        return hasFinishedFavorite || hasFinishedReorder;
      },
      listener: (context, state) {
        showFavoritesSnackbar(context, state.favoriteFailureOrSuccessOption);
        handleReorderFinished(context, state.reorderFailureOrSuccessOption);
      },
      child: SizedBox(
        width: double.infinity,
        child: LayoutBuilder(builder: (context, constraints) {
          return ReorderableWrap(
            needsLongPressDraggable: false,
            onReorder: (oldIndex, newIndex) async =>
                reorderItems(context, oldIndex, newIndex),
            spacing: 16,
            runSpacing: 16,
            buildDraggableFeedback: (_, __, child) =>
                _DraggableFeedback(child: child),
            children: shoppingItems
                .map((item) => SizedBox(
                      width: (constraints.maxWidth - 16) / 2,
                      child: DismissibleShoppingItem(shoppingItem: item),
                    ))
                .toList(),
          );
        }),
      ),
    );
  }

  Future<void> reorderItems(
    BuildContext context,
    int oldIndex,
    int newIndex,
  ) async {
    context.loaderOverlay
        .show(widget: const AppLoading(text: 'Reordering items'));

    final item = shoppingItems.removeAt(oldIndex);
    shoppingItems.insert(newIndex, item);
    for (final item in shoppingItems) {
      await context.read<ShoppingListActorCubit>().reorderShoppingItem(
          item.copyWith(position: shoppingItems.indexOf(item)));
    }
  }

  void showFavoritesSnackbar(
    BuildContext context,
    Option<Either<GeneralFailure, Unit>> favoriteFailureOrSuccessOption,
  ) {
    if (favoriteFailureOrSuccessOption.isSome()) {
      final favoriteOrFailure =
          favoriteFailureOrSuccessOption.fold(() => null, (a) => a)!;

      final message = favoriteOrFailure.isRight()
          ? 'Item added to favorites'
          : 'Item failed to add to favorites';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ));
    }
  }

  void handleReorderFinished(
    BuildContext context,
    Option<Either<GeneralFailure, Unit>> reorderFailureOrSuccessOption,
  ) {
    if (reorderFailureOrSuccessOption.isSome()) {
      context.loaderOverlay.hide();
      final reorderOrFailure =
          reorderFailureOrSuccessOption.fold(() => null, (a) => a)!;
      if (reorderOrFailure.isLeft()) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to reorder items'),
          duration: Duration(seconds: 2),
        ));
      }
    }
  }
}

class _DraggableFeedback extends StatelessWidget {
  const _DraggableFeedback({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
