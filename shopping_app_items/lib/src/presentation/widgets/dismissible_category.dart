import 'package:dependencies_core/dependencies_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

import 'package:design_system/design_system.dart';

import 'category_shopping_items.dart';
import 'delete_container.dart';
import 'empty_category.dart';

class DismissibleCategory extends StatelessWidget {
  const DismissibleCategory({
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
    return BlocListener<ShoppingListActorCubit, ShoppingListActorState>(
      listenWhen: (p, c) {
        final hasFinishedDeletion =
            p.removeFailureOrSuccessOption != c.removeFailureOrSuccessOption &&
                c.removeFailureOrSuccessOption.isSome();
        return hasFinishedDeletion;
      },
      listener: (context, state) =>
          onDeleteFailure(context, state.removeFailureOrSuccessOption),
      child: DismissibleItem(
        key: UniqueKey(),
        confirmDismiss: (_) async => deleteCategory(context),
        rightToLeftWidget: const DeleteContainer(),
        child: ExpandableHeader(
          text: category.name,
          length: categoryShoppingItems.length,
          isExpanded: isExpanded,
          onExpandedChanged: onExpandedChanged,
          color: AppUtils.colorShade500ToMaterial(category.color),
          child: categoryShoppingItems.isEmpty
              ? const EmptyCategory()
              : CategoryShoppingItems(shoppingItems: categoryShoppingItems),
        ),
      ),
    );
  }

  void onDeleteFailure(
    BuildContext context,
    Option<Either<GeneralFailure, Unit>> removeFailureOrSuccessOption,
  ) {
    final failureOrSuccess =
        removeFailureOrSuccessOption.fold(() => null, (r) => r)!;
    if (failureOrSuccess.isLeft()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error deleting category/item'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  Future<bool> deleteCategory(BuildContext context) async {
    if (await confirmDelete(context)) {
      context.loaderOverlay
          .show(widget: const AppLoading(text: 'Deleting category'));
      final deleted = await context
          .read<ShoppingListActorCubit>()
          .removeCategory(category, categoryShoppingItems);
      context.loaderOverlay.hide();
      return Future.value(deleted);
    }

    return Future.value(false);
  }

  Future<bool> confirmDelete(BuildContext context) async {
    final result = await AppDialogs.showWarningDialog<bool>(
      context,
      title: 'Delete category?',
      message:
          'You will also delete all items associated with this category. This action is irreversible. Are you sure?',
      onConfirm: (c) => Navigator.pop(c, true),
    );
    return result == true;
  }
}
