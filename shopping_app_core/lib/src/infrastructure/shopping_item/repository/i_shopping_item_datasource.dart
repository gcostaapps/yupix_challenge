import '../../../domain/shopping_item/shopping_item.dart';

abstract class IShoppingItemDatasource {
  Future<List<ShoppingItem>> getAllShopingItems();
  Future<ShoppingItem> addShoppingItem(ShoppingItem shoppingItem);
  Future<void> updateShoppingItem(ShoppingItem shoppingItem);
  Future<void> deleteShoppingItem(String shoppingItemId);
  Future<void> deleteShoppingItems(List<String> shoppingItemsIds);
}
