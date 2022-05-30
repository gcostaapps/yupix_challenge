import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final shoppingItemStory = Story(
  name: 'Widgets/Item/Shopping Item',
  builder: (BuildContext context) {
    return const ProductItemPage();
  },
);

class ProductItemPage extends StatefulWidget {
  const ProductItemPage({Key? key}) : super(key: key);

  @override
  State<ProductItemPage> createState() => _ProductItemPageState();
}

class _ProductItemPageState extends State<ProductItemPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final title = context.knobs.text(label: 'Title', initial: 'Shopping Item');
    final subtitle = context.knobs.text(label: 'Subtitle', initial: '');

    return ShoppingItemWidget(
      isFavorite: isFavorite,
      onTapFavorite: (ctx) => setState(() => isFavorite = !isFavorite),
      subtitle: subtitle,
      title: title,
      url:
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/assortment-of-colorful-ripe-tropical-fruits-top-royalty-free-image-995518546-1564092355.jpg',
    );
  }
}
