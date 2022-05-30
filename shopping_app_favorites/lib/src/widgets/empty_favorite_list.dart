import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class EmptyFavoriteList extends StatelessWidget {
  const EmptyFavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Container(
          decoration: BoxDecoration(
            color: context.colorScheme.primary.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.fromLTRB(40, 40, 40, 32),
          child: Icon(
            Icons.favorite,
            size: 120,
            color: context.colorScheme.onPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Text('No favorites yet!', style: context.textTheme.headline6),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Favorite items from your shopping list to see them here.',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyText2!.copyWith(
              color: context.colorScheme.onBackground,
            ),
          ),
        ),
      ],
    );
  }
}
