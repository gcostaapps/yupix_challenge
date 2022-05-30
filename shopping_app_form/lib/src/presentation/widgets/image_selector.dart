import 'package:dependencies_core/dependencies_core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../application/shopping_list_form/shopping_list_form_cubit.dart';

class ImageSelector extends StatelessWidget {
  const ImageSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingListFormCubit, ShoppingListFormState>(
      listenWhen: (p, c) =>
          p is ShoppingListFormItem &&
          c is ShoppingListFormItem &&
          c.filePickFailure.isSome() &&
          c.filePickFailure != p.filePickFailure,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error picking image'),
          duration: Duration(seconds: 2),
        ));
      },
      buildWhen: (p, c) =>
          p is ShoppingListFormItem &&
          c is ShoppingListFormItem &&
          p.file != c.file,
      builder: (context, state) {
        final itemState = state as ShoppingListFormItem;
        return InkWell(
          onTap: () async {
            context.loaderOverlay.show(
              widget: const AppLoading(text: 'Picking image'),
            );
            context
                .read<ShoppingListFormCubit>()
                .getItemImage()
                .then((value) => context.loaderOverlay.hide());
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 24, bottom: 24),
            child: itemState.file == null
                ? Column(
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 56,
                        color: context.colorScheme.onBackground,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Add item image',
                        style: context.textTheme.bodyText2!.copyWith(
                          color: context.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  )
                : Image.file(
                    itemState.file!,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
          ),
        );
      },
    );
  }
}
