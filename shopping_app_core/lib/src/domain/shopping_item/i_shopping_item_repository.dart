import 'package:dependencies_core/dependencies_core.dart';

import '../general_failure.dart';
import 'shopping_item.dart';

abstract class IShoppingItemRepository {
  Future<Either<GeneralFailure, List<ShoppingItem>>> getAllShopingItems();
  Future<Either<GeneralFailure, ShoppingItem>> addShoppingItem(
      ShoppingItem shoppingItem);
  Future<Either<GeneralFailure, Unit>> updateShoppingItem(
      ShoppingItem shoppingItem);
  Future<Either<GeneralFailure, Unit>> deleteShoppingItem(
      String shoppingItemId);
  Future<Either<GeneralFailure, Unit>> deleteShoppingItems(
      List<String> shoppingItemsIds);
}
