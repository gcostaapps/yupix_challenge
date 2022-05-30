import 'package:dependencies_core/dependencies_core.dart' hide State;
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:shopping_app_core/shopping_app_core.dart';

import '../application/shopping_list_form/shopping_list_form_cubit.dart';
import 'widgets/category_form.dart';
import 'widgets/form_selector.dart';
import 'widgets/item_form.dart';

class NewItemPage extends StatelessWidget {
  const NewItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoppingListFormCubit(
        context.read(),
        context.read(),
        context.read(),
        context.read(),
      ),
      child: BlocBuilder<ShoppingListWatcherCubit, ShoppingListWatcherState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const _NewItemLoading(),
            loading: (_) => const _NewItemLoading(),
            failed: (_) => const _NewItemFailed(),
            loaded: (state) {
              return NewItemView(
                categories: state.categories,
                shoppingItems: state.items,
              );
            },
          );
        },
      ),
    );
  }
}

class NewItemView extends StatefulWidget {
  const NewItemView({
    Key? key,
    required this.categories,
    required this.shoppingItems,
  }) : super(key: key);

  final List<Category> categories;
  final List<ShoppingItem> shoppingItems;

  @override
  State<NewItemView> createState() => _NewItemViewState();
}

class _NewItemViewState extends State<NewItemView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListFormCubit, ShoppingListFormState>(
      builder: (context, state) {
        final isItemForm = state is ShoppingListFormItem;
        final isValidForm = isItemForm
            ? state.isValidForm
            : (state as ShoppingListFormCategory).isValidForm;
        return Scaffold(
          backgroundColor: context.colorScheme.background,
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  '*All fields are required',
                  style: context.textTheme.bodyText2!.copyWith(
                    color: context.colorScheme.onBackground,
                  ),
                ),
                const SizedBox(height: 24),
                const FormLabel(text: 'Type'),
                FormSelector(isItemForm: isItemForm),
                const SizedBox(height: 24),
                if (isItemForm) const ItemForm(),
                if (!isItemForm) const CategoryForm(),
                const SizedBox(height: kBottomNavigationBarHeight * 1.5),
              ],
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppElevatedButton(
              text: 'Add ${isItemForm ? 'Item' : 'Category'}',
              onTap: isValidForm ? () async => onSaveForm(state) : null,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }

  Future<void> onSaveForm(ShoppingListFormState state) async {
    if (isItemNameDuplicated(state)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Item with this name already exists'),
        duration: Duration(seconds: 2),
      ));
      return;
    }

    if (isCategoryNameDuplicated(state)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Category with this name already exists'),
        duration: Duration(seconds: 2),
      ));
      return;
    }

    final isItemForm = state is ShoppingListFormItem;
    int itemPosition = 0;
    if (isItemForm) {
      itemPosition = widget.shoppingItems
          .where((item) => item.categoryId == state.category!.id!)
          .length;
    }
    await saveForm(isItemForm, itemPosition);
  }

  bool isItemNameDuplicated(ShoppingListFormState state) {
    if (state is ShoppingListFormItem) {
      return widget.shoppingItems
          .where((item) => item.name.trim() == state.name!.trim())
          .isNotEmpty;
    }
    return false;
  }

  bool isCategoryNameDuplicated(ShoppingListFormState state) {
    if (state is ShoppingListFormCategory) {
      return widget.categories
          .where((item) => item.name.trim() == state.name!.trim())
          .isNotEmpty;
    }

    return false;
  }

  Future<void> saveForm(bool isItemForm, int itemPosition) async {
    context.loaderOverlay.show(
      widget: AppLoading(text: 'Saving ${isItemForm ? 'Item' : 'Category'}'),
    );

    isItemForm
        ? await context
            .read<ShoppingListFormCubit>()
            .saveShoppingItem(itemPosition)
        : await context.read<ShoppingListFormCubit>().saveCategory();
    context.loaderOverlay.hide();
  }
}

class _NewItemLoading extends StatelessWidget {
  const _NewItemLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _NewItemFailed extends StatelessWidget {
  const _NewItemFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error, check your internet connection'),
    );
  }
}
