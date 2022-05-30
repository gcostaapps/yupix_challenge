import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class EmptyShoppingList extends StatelessWidget {
  const EmptyShoppingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Image.asset('assets/empty_list.png'),
          const SizedBox(height: 4),
          Text('Get started!', style: context.textTheme.headline6),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Add categories and items to your shopping list.',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyText2!.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
