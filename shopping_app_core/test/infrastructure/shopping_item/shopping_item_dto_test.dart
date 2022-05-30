import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_core/src/domain/shopping_item/shopping_item.dart';
import 'package:shopping_app_core/src/infrastructure/shopping_item/datasource/shopping_item_dto.dart';

void main() {
  ShoppingItem createShoppingItem(DateTime date) => ShoppingItem(
        id: '1',
        imageUrl: 'https://example.com',
        categoryId: '1',
        isFavorite: true,
        name: 'Test',
        imageName: 'teste',
        favoritedAt: date,
        position: 0,
      );

  ShoppingItemDto createShoppingItemDto(DateTime date) => ShoppingItemDto(
        id: '1',
        imageUrl: 'https://example.com',
        categoryId: '1',
        imageName: 'teste',
        isFavorite: true,
        name: 'Test',
        favoritedAt: date,
        position: 0,
      );

  group('ShoppingItemDto', () {
    test('should convert a shoppingItem to shoppingItemDto with correct values',
        () {
      final now = DateTime.now();
      final shoppingItem = createShoppingItem(now);
      final shoppingItemDto = createShoppingItemDto(now);
      expect(ShoppingItemDto.fromDomain(shoppingItem), equals(shoppingItemDto));
    });

    test('should convert to a shoppingItem with correct values', () {
      final now = DateTime.now();
      final shoppingItem = createShoppingItem(now);
      final shoppingItemDto = createShoppingItemDto(now);
      expect(shoppingItemDto.toDomain(), equals(shoppingItem));
    });
  });
}
