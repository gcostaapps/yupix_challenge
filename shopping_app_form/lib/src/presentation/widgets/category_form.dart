import 'package:dependencies_core/dependencies_core.dart';
import 'package:flutter/material.dart';

import 'package:design_system/design_system.dart';

import '../../application/shopping_list_form/shopping_list_form_cubit.dart';
import 'color_selector.dart';

class CategoryForm extends StatelessWidget {
  const CategoryForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShoppingListFormCubit, ShoppingListFormState>(
      listenWhen: (p, c) =>
          p is ShoppingListFormCategory &&
          c is ShoppingListFormCategory &&
          p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption &&
          c.saveFailureOrSuccessOption.isSome(),
      listener: (context, state) {
        final saveOrFailure = (state as ShoppingListFormCategory)
            .saveFailureOrSuccessOption
            .fold(() => null, (a) => a);

        final message = saveOrFailure!.isLeft()
            ? 'Error saving category'
            : 'Category saved successfully';

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FormLabel(text: 'Category name'),
          SizedBox(height: 8),
          _CategoryNameField(),
          SizedBox(height: 24),
          FormLabel(text: 'Color'),
          SizedBox(height: 8),
          _CategoryColorField(),
        ],
      ),
    );
  }
}

class _CategoryNameField extends StatelessWidget {
  const _CategoryNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListFormCubit, ShoppingListFormState>(
      buildWhen: (p, c) =>
          p is ShoppingListFormCategory &&
          c is ShoppingListFormCategory &&
          p.name != c.name,
      builder: (context, state) {
        final categoryState = state as ShoppingListFormCategory;
        return AppFormField(
          hint: 'Type your category name',
          controller:
              categoryState.name == null ? TextEditingController() : null,
          onChanged: (v) =>
              context.read<ShoppingListFormCubit>().changeCategoryName(v),
        );
      },
    );
  }
}

class _CategoryColorField extends StatelessWidget {
  const _CategoryColorField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListFormCubit, ShoppingListFormState>(
      buildWhen: (p, c) =>
          p is ShoppingListFormCategory &&
          c is ShoppingListFormCategory &&
          p.color != c.color,
      builder: (context, state) {
        final categoryState = state as ShoppingListFormCategory;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: AppUtils.appColors
              .map(
                (color) => ColorSelector(
                  color: color,
                  isSelected: categoryState.color.value == color.value,
                  onSelectColor: (v) => context
                      .read<ShoppingListFormCubit>()
                      .changeCategoryColor(v),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
