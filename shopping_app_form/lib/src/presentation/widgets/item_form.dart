import 'package:dependencies_core/dependencies_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../application/shopping_list_form/shopping_list_form_cubit.dart';
import 'category_selector.dart';
import 'image_selector.dart';

class ItemForm extends StatelessWidget {
  const ItemForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShoppingListFormCubit, ShoppingListFormState>(
      listenWhen: (p, c) =>
          p is ShoppingListFormItem &&
          c is ShoppingListFormItem &&
          p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption &&
          (c.saveFailureOrSuccessOption.isSome() ||
              c.fileUploadFailure.isSome()),
      listener: (context, state) {
        final saveOrFailure = (state as ShoppingListFormItem)
            .saveFailureOrSuccessOption
            .fold(() => null, (a) => a);

        final message = state.fileUploadFailure.isSome()
            ? 'Error uploading image to storage'
            : saveOrFailure!.isLeft()
                ? 'Error saving item'
                : 'Item saved successfully';

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FormLabel(text: 'Item name'),
          SizedBox(height: 8),
          _ItemNameField(),
          SizedBox(height: 16),
          CategorySelector(),
          SizedBox(height: 24),
          FormLabel(text: 'Image'),
          ImageSelector(),
        ],
      ),
    );
  }
}

class _ItemNameField extends StatelessWidget {
  const _ItemNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListFormCubit, ShoppingListFormState>(
      buildWhen: (p, c) =>
          p is ShoppingListFormItem &&
          c is ShoppingListFormItem &&
          p.name != c.name,
      builder: (context, state) {
        final itemState = state as ShoppingListFormItem;
        return AppFormField(
          hint: 'Type your item name',
          controller: itemState.name == null ? TextEditingController() : null,
          onChanged: (v) =>
              context.read<ShoppingListFormCubit>().changeItemName(v),
        );
      },
    );
  }
}
