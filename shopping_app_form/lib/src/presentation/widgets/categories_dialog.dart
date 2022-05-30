import 'package:dependencies_core/dependencies_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

import 'package:design_system/design_system.dart';

class CategoriesDialog extends StatelessWidget {
  const CategoriesDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watcherState =
        context.select((ShoppingListWatcherCubit c) => c.state);
    final categories = watcherState.maybeMap(
      loaded: (state) => state.categories,
      orElse: () => [],
    );
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        color: context.colorScheme.surface,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.75,
          minHeight: MediaQuery.of(context).size.height * 0.25,
        ),
        width: MediaQuery.of(context).size.width - 32,
        child: Material(
          type: MaterialType.transparency,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 12),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: Text(
                  'Categories',
                  style: context.textTheme.subtitle1,
                ),
              ),
              const SizedBox(height: 8),
              if (categories.isEmpty) const Text('There is no category yet'),
              if (categories.isNotEmpty)
                ...categories
                    .map((category) => _CategoryDialogItem(category: category))
                    .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryDialogItem extends StatelessWidget {
  const _CategoryDialogItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final categoryColor = AppUtils.colorShade500ToMaterial(category.color);
    return InkWell(
      onTap: () => Navigator.pop(context, category),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Text(
          category.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyText1!.copyWith(
            color: context.isLightMode ? categoryColor : categoryColor.shade200,
          ),
        ),
      ),
    );
  }
}
