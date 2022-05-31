import 'package:dartz/dartz.dart';

import '../../../domain/error_data.dart';
import '../../../domain/general_failure.dart';
import '../../../domain/shopping_item/i_shopping_item_repository.dart';
import '../../../domain/shopping_item/shopping_item.dart';
import 'i_shopping_item_datasource.dart';

class ShoppingItemRepository implements IShoppingItemRepository {
  final IShoppingItemDatasource shoppingItemDatasource;

  ShoppingItemRepository(this.shoppingItemDatasource);

  @override
  Future<Either<GeneralFailure, ShoppingItem>> addShoppingItem(
      ShoppingItem shoppingItem) async {
    try {
      final savedItem =
          await shoppingItemDatasource.addShoppingItem(shoppingItem);
      return Right(savedItem);
    } catch (e, stack) {
      return Left(GeneralFailure(ErrorData('addShoppingItem', e, stack)));
    }
  }

  @override
  Future<Either<GeneralFailure, Unit>> updateShoppingItem(
      ShoppingItem shoppingItem) async {
    try {
      await shoppingItemDatasource.updateShoppingItem(shoppingItem);
      return const Right(unit);
    } catch (e, stack) {
      return Left(GeneralFailure(ErrorData('updateShoppingItem', e, stack)));
    }
  }

  @override
  Future<Either<GeneralFailure, Unit>> deleteShoppingItem(
      String shoppingItemId) async {
    try {
      await shoppingItemDatasource.deleteShoppingItem(shoppingItemId);
      return const Right(unit);
    } catch (e, stack) {
      return Left(GeneralFailure(ErrorData('deleteShoppingItem', e, stack)));
    }
  }

  @override
  Future<Either<GeneralFailure, Unit>> deleteShoppingItems(
      List<String> shoppingItemsIds) async {
    try {
      await shoppingItemDatasource.deleteShoppingItems(shoppingItemsIds);
      return const Right(unit);
    } catch (e, stack) {
      return Left(GeneralFailure(ErrorData('deleteShoppingItems', e, stack)));
    }
  }

  @override
  Future<Either<GeneralFailure, List<ShoppingItem>>>
      getAllShopingItems() async {
    try {
      final items = await shoppingItemDatasource.getAllShopingItems();
      return Right(items);
    } catch (e, stack) {
      return Left(GeneralFailure(ErrorData('getAllShopingItems', e, stack)));
    }
  }
}
