import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_core/src/domain/shopping_item/shopping_item.dart';
import 'package:shopping_app_core/src/infrastructure/shopping_item/datasource/shopping_item_datasource.dart';

void main() {
  late ShoppingItemDatasource shoppingItemDatasource;
  late FakeFirebaseFirestore firestore;

  const item = ShoppingItem(
    name: 'Test',
    imageUrl: 'https://example.com',
    imageName: 'teste',
    isFavorite: false,
    categoryId: '1',
    position: 0,
  );

  setUp(() async {
    firestore = FakeFirebaseFirestore();
    shoppingItemDatasource = ShoppingItemDatasource(firestore);
  });

  group('ShoppingItem datasource', () {
    test('should get all items', () async {
      final savedItem = await shoppingItemDatasource.addShoppingItem(item);
      final items = await shoppingItemDatasource.getAllShopingItems();

      expect(items.length, 1);
      expect(items, isA<List<ShoppingItem>>());
      expect(items.first, equals(savedItem));
    });

    test('should add the item and return the value saved with it\'s id',
        () async {
      final newItem = await shoppingItemDatasource.addShoppingItem(item);

      expect(newItem.id, isNotNull);
    });

    test('should update an item', () async {
      final newItem = await shoppingItemDatasource.addShoppingItem(item);
      final items = await shoppingItemDatasource.getAllShopingItems();
      expect(items.first, newItem);

      final date = DateTime(2022, 05, 29);
      final modifiedItem =
          newItem.copyWith(isFavorite: true, favoritedAt: date, position: 1);
      await shoppingItemDatasource.updateShoppingItem(modifiedItem);
      final updatedItems = await shoppingItemDatasource.getAllShopingItems();
      expect(updatedItems.first, modifiedItem);
    });

    test('should delete a saved item', () async {
      final newItem = await shoppingItemDatasource.addShoppingItem(item);
      final items = await shoppingItemDatasource.getAllShopingItems();
      expect(items.length, 1);
      await shoppingItemDatasource.deleteShoppingItem(newItem.id!);
      final newItems = await shoppingItemDatasource.getAllShopingItems();
      expect(newItems.length, 0);
    });

    test('should delete a list of items from list of ids', () async {
      final newItem = await shoppingItemDatasource.addShoppingItem(item);
      final newItem2 = await shoppingItemDatasource.addShoppingItem(item);

      await shoppingItemDatasource.deleteShoppingItems(
        [newItem.id!, newItem2.id!],
      );
      final items = await shoppingItemDatasource.getAllShopingItems();
      expect(items.length, 0);
    });
  });
}
