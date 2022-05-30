import 'package:dependencies_core/dependencies_core.dart' hide State;
import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

import '../../application/shopping_list_form/shopping_list_form_cubit.dart';

class FormSelector extends StatelessWidget {
  const FormSelector({
    Key? key,
    required this.isItemForm,
  }) : super(key: key);

  final bool isItemForm;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Category',
          style: context.textTheme.bodyText2!.copyWith(
            color: !isItemForm
                ? context.colorScheme.onSurface
                : context.colorScheme.onBackground,
            fontWeight: !isItemForm ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Switch.adaptive(
          value: isItemForm,
          onChanged: (_) => isItemForm
              ? context.read<ShoppingListFormCubit>().changeToCategoryForm()
              : context.read<ShoppingListFormCubit>().changeToItemForm(),
        ),
        Text(
          'Item',
          style: context.textTheme.bodyText2!.copyWith(
            color: isItemForm
                ? context.colorScheme.onSurface
                : context.colorScheme.onBackground,
            fontWeight: isItemForm ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
