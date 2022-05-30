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
    required this.onDismissed,
  }) : super(key: key);

  final Category category;
  final List<ShoppingItem> categoryShoppingItems;
  final bool isExpanded;
  final Function(bool) onExpandedChanged;
  final Function(DismissDirection) onDismissed;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShoppingListActorCubit, ShoppingListActorState>(
      listenWhen: (p, c) =>
          p.removeFailureOrSuccessOption != c.removeFailureOrSuccessOption &&
          c.removeFailureOrSuccessOption.isSome(),
      listener: (context, state) {
        final failureOrSuccess =
            state.removeFailureOrSuccessOption.fold(() => null, (r) => r)!;
        if (failureOrSuccess.isLeft()) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Error deleting category/item'),
            duration: Duration(seconds: 2),
          ));
        }
      },
      child: DismissibleItem(
        key: UniqueKey(),
        confirmDismiss: (direction) async {
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
                .removeCategory(category, categoryShoppingItems);
            return Future.value(deleted);
          }

          return Future.value(false);
        },
        onDismissed: (_) {},
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
}
