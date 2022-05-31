import 'package:dependencies_core/dependencies_core.dart';

import '../../../shopping_app_core.dart';

part 'shopping_list_actor_state.dart';

class ShoppingListActorCubit extends Cubit<ShoppingListActorState> {
  final IStorageService storageService;
  final ICategoryRepository categoryRepository;
  final IShoppingItemRepository shoppingItemRepository;
  final ShoppingListWatcherCubit shoppingListWatcherCubit;

  ShoppingListActorCubit(
    this.storageService,
    this.categoryRepository,
    this.shoppingItemRepository,
    this.shoppingListWatcherCubit,
  ) : super(ShoppingListActorState.initial());

  Future<bool> reorderShoppingItem(ShoppingItem item) async {
    resetFailuresState();
    final saved = await _updateShoppingItem(item);
    if (!saved) {
      emit(state.copyWith(
          reorderFailureOrSuccessOption: some(Left(GeneralFailure(
        ErrorData('reorderShoppingItem'),
      )))));
      return false;
    }

    emit(
      state.copyWith(reorderFailureOrSuccessOption: some(const Right(unit))),
    );
    shoppingListWatcherCubit.addOrUpdateLocalItem(item);
    return true;
  }

  Future<bool> favoriteShoppingItem(ShoppingItem item) async {
    resetFailuresState();

    final saved = await _updateShoppingItem(item);
    if (!saved) {
      emit(state.copyWith(
          favoriteFailureOrSuccessOption: some(Left(GeneralFailure(
        ErrorData('favoriteShoppingItem'),
      )))));
      return false;
    }

    emit(
      state.copyWith(favoriteFailureOrSuccessOption: some(const Right(unit))),
    );
    shoppingListWatcherCubit.addOrUpdateLocalItem(item);
    return true;
  }

  Future<bool> _updateShoppingItem(ShoppingItem item) async {
    final itemsResult = await shoppingItemRepository.updateShoppingItem(item);
    return itemsResult.isRight();
  }

  Future<bool> removeItem(ShoppingItem item) async {
    resetFailuresState();

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
    shoppingListWatcherCubit.deleteLocalItem(item.id!);
    return true;
  }

  Future<bool> removeCategory(
      Category category, List<ShoppingItem> items) async {
    resetFailuresState();

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

    final itemsIds = items.map((e) => e.id!).toList();
    final itemsResult =
        await shoppingItemRepository.deleteShoppingItems(itemsIds);

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

    for (final id in itemsIds) {
      shoppingListWatcherCubit.deleteLocalItem(id);
    }
    shoppingListWatcherCubit.deleteLocalCategory(category.id!);

    return true;
  }

  void resetFailuresState() => emit(state.copyWith(
        reorderFailureOrSuccessOption: none(),
        favoriteFailureOrSuccessOption: none(),
        removeFailureOrSuccessOption: none(),
      ));
}
