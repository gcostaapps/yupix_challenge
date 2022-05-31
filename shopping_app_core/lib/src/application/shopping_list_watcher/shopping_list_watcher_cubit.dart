import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'shopping_list_watcher_cubit.freezed.dart';
part 'shopping_list_watcher_state.dart';

class ShoppingListWatcherCubit extends Cubit<ShoppingListWatcherState> {
  ShoppingListWatcherCubit(
    this.categoryRepository,
    this.shoppingItemRepository,
  ) : super(const ShoppingListWatcherState.initial());

  final ICategoryRepository categoryRepository;
  final IShoppingItemRepository shoppingItemRepository;

  Future<void> loadItemsAndCategories() async {
    emit(const ShoppingListWatcherState.loading());
    final categoriesOrFailure = await categoryRepository.getAllCategories();
    final itemsOrFailure = await shoppingItemRepository.getAllShopingItems();

    if (categoriesOrFailure.isLeft() || itemsOrFailure.isLeft()) {
      final categoryError = categoriesOrFailure.isLeft() ? 'categories' : '';
      final itemError = itemsOrFailure.isLeft() ? 'and items' : '';
      final errorMessage = 'Error getting $categoryError $itemError.';
      emit(ShoppingListWatcherState.failed(errorMessage));
      return;
    }

    final List<Category> categories =
        categoriesOrFailure.fold((l) => [], (r) => r);
    final List<ShoppingItem> items = itemsOrFailure.fold((l) => [], (r) => r);

    emit(ShoppingListWatcherState.loaded(
      categories,
      items,
    ));
  }

  void addOrUpdateLocalCategory(Category category) {
    state.maybeWhen(
      loaded: (categories, items) {
        final newCategories =
            List<Category>.from(_getUpdatedLocalList(category, categories));
        emit(
          ShoppingListWatcherState.loaded(
            newCategories,
            items,
          ),
        );
      },
      orElse: () => {},
    );
  }

  void deleteLocalCategory(String categoryId) {
    state.maybeWhen(
      loaded: (categories, items) {
        emit(
          ShoppingListWatcherState.loaded(
            _deleteObjectFromLocalList(categoryId, categories),
            items,
          ),
        );
      },
      orElse: () => {},
    );
  }

  void addOrUpdateLocalItem(ShoppingItem item) {
    state.maybeWhen(
      loaded: (categories, items) {
        emit(
          ShoppingListWatcherState.loaded(
              categories, _getUpdatedLocalList(item, items)),
        );
      },
      orElse: () => {},
    );
  }

  void deleteLocalItem(String itemId) {
    state.maybeWhen(
      loaded: (categories, items) {
        emit(
          ShoppingListWatcherState.loaded(
              categories, _deleteObjectFromLocalList(itemId, items)),
        );
      },
      orElse: () => {},
    );
  }

  List<T> _getUpdatedLocalList<T>(dynamic object, List<T> list) {
    final newList = List<T>.from(list);
    final objectIndex = newList.indexWhere((dynamic t) => t.id == object.id);
    if (objectIndex == -1) {
      return newList..insert(0, object as T);
    }

    newList[objectIndex] = object as T;
    return newList;
  }

  List<T> _deleteObjectFromLocalList<T>(String id, List<T> list) {
    final newList = List<T>.from(list);
    final objectIndex = newList.indexWhere((dynamic t) => t.id == id);

    newList.removeAt(objectIndex);

    return newList;
  }
}
