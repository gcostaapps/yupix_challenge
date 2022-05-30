import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../domain/shopping_item/shopping_item.dart';
import '../repository/i_shopping_item_datasource.dart';
import 'shopping_item_dto.dart';

class ShoppingItemDatasource implements IShoppingItemDatasource {
  final FirebaseFirestore firestore;

  ShoppingItemDatasource(this.firestore);

  final shoppingItemsCollection = 'shoppingItems';

  @override
  Stream<List<ShoppingItem>> getAllShopingItems() {
    final result = firestore.collection(shoppingItemsCollection).snapshots();

    return result.map((event) => event.docs
        .map((e) => ShoppingItemDto.fromMap({
              'id': e.id,
              ...e.data(),
            }).toDomain())
        .toList());
  }

  @override
  Future<ShoppingItem> addShoppingItem(ShoppingItem shoppingItem) async {
    final result = await firestore
        .collection(shoppingItemsCollection)
        .add(ShoppingItemDto.fromDomain(shoppingItem).toMapWithoutId());

    return shoppingItem.copyWith(id: result.id);
  }

  @override
  Future<void> updateShoppingItem(ShoppingItem shoppingItem) async {
    return firestore
        .collection(shoppingItemsCollection)
        .doc(shoppingItem.id)
        .update(ShoppingItemDto.fromDomain(shoppingItem).toMapWithoutId());
  }

  @override
  Future<void> deleteShoppingItem(String shoppingItemId) async {
    return firestore
        .collection(shoppingItemsCollection)
        .doc(shoppingItemId)
        .delete();
  }

  @override
  Future<void> deleteShoppingItems(List<String> shoppingItemsIds) {
    final batch = firestore.batch();

    for (final id in shoppingItemsIds) {
      batch.delete(firestore.collection(shoppingItemsCollection).doc(id));
    }

    return batch.commit();
  }
}
