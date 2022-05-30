import 'package:dependencies_core/dependencies_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

import '../../application/shopping_list_form/shopping_list_form_cubit.dart';
import 'categories_dialog.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListFormCubit, ShoppingListFormState>(
      buildWhen: (p, c) =>
          p is ShoppingListFormItem &&
          c is ShoppingListFormItem &&
          p.category != c.category,
      builder: (context, state) {
        final itemState = state as ShoppingListFormItem;

        final categoryColor = itemState.category == null
            ? context.colorScheme.surface
            : context.isLightMode
                ? AppUtils.colorShade500ToMaterial(itemState.category!.color)
                : AppUtils.colorShade500ToMaterial(itemState.category!.color)
                    .shade200;

        return ClickableCard(
          onTap: () async {
            final categorySelected =
                await AppDialogs.showDialogBlurred<Category?>(
              context,
              const CategoriesDialog(),
            );
            if (categorySelected != null) {
              context
                  .read<ShoppingListFormCubit>()
                  .changeItemCategory(categorySelected);
            }
          },
          shadowColor: categoryColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            color: categoryColor,
            padding: const EdgeInsets.all(12),
            child: Text(
              itemState.category == null
                  ? 'Select a category'
                  : itemState.category!.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyText2!.copyWith(
                color: itemState.category == null
                    ? context.colorScheme.onSurface
                    : context.colorScheme.onPrimary,
              ),
            ),
          ),
        );
      },
    );
  }
}
