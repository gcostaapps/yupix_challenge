import 'package:dependencies_core/dependencies_core.dart';

import '../../domain/domain.dart';
import '../../infrastructure/services/storage_service.dart';

part 'shopping_list_actor_state.dart';

class ShoppingListActorCubit extends Cubit<ShoppingListActorState> {
  final IStorageService storageService;
  final ICategoryRepository categoryRepository;
  final IShoppingItemRepository shoppingItemRepository;

  ShoppingListActorCubit(
    this.storageService,
    this.categoryRepository,
    this.shoppingItemRepository,
  ) : super(ShoppingListActorState.initial());

  Future<bool> updateShoppingItem(ShoppingItem item) async {
    emit(state.copyWith(favoriteFailureOrSuccessOption: none()));

    final itemsResult = await shoppingItemRepository.updateShoppingItem(item);
    if (itemsResult.isLeft()) {
      emit(state.copyWith(
        favoriteFailureOrSuccessOption: some(
          Left(GeneralFailure(ErrorData('updateShoppingItem'))),
        ),
      ));
      return false;
    }

    emit(
      state.copyWith(favoriteFailureOrSuccessOption: some(const Right(unit))),
    );
    return true;
  }

  Future<bool> removeItem(ShoppingItem item) async {
    emit(state.copyWith(removeFailureOrSuccessOption: none()));

    final storageResult = await storageService.deleteFile(item.imageName);
    if (storageResult.isLeft()) {
      emit(state.copyWith(
        removeFailureOrSuccessOption: some(
          Left(GeneralFailure(ErrorData('removeItem-storage'))),
        ),
      ));
      return false;
    }

    final itemsResult =
        await shoppingItemRepository.deleteShoppingItem(item.id!);
    if (itemsResult.isLeft()) {
      emit(state.copyWith(
        removeFailureOrSuccessOption: some(
          Left(GeneralFailure(ErrorData('removeItem-items'))),
        ),
      ));
      return false;
    }

    emit(
      state.copyWith(removeFailureOrSuccessOption: some(const Right(unit))),
    );
    return true;
  }

  Future<bool> removeCategory(
      Category category, List<ShoppingItem> items) async {
    emit(state.copyWith(removeFailureOrSuccessOption: none()));
    for (final item in items) {
      final storageResult = await storageService.deleteFile(item.imageName);
      if (storageResult.isLeft()) {
        emit(state.copyWith(
          removeFailureOrSuccessOption: some(
            Left(GeneralFailure(ErrorData('removeCategory-storage'))),
          ),
        ));
        return false;
      }
    }

    final itemsResult = await shoppingItemRepository
        .deleteShoppingItems(items.map((e) => e.id!).toList());
    if (itemsResult.isLeft()) {
      emit(state.copyWith(
        removeFailureOrSuccessOption: some(
          Left(GeneralFailure(ErrorData('removeCategory-items'))),
        ),
      ));
      return false;
    }

    final categoryResult =
        await categoryRepository.deleteCategory(category.id!);
    if (categoryResult.isLeft()) {
      emit(state.copyWith(
        removeFailureOrSuccessOption: some(
          Left(GeneralFailure(ErrorData('removeCategory-category'))),
        ),
      ));
      return false;
    }

    emit(
      state.copyWith(removeFailureOrSuccessOption: some(const Right(unit))),
    );
    return true;
  }
}
