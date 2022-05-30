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

  late StreamSubscription categorySubscription;
  late StreamSubscription itemsSubscription;

  Future<void> loadItemsAndCategories() async {
    emit(const ShoppingListWatcherState.loading());
    final categoriesOrFailure = categoryRepository.getAllCategories();
    final itemsOrFailure = shoppingItemRepository.getAllShopingItems();

    if (categoriesOrFailure.isLeft() || itemsOrFailure.isLeft()) {
      final categoryError = categoriesOrFailure.isLeft() ? 'categories' : '';
      final itemError = itemsOrFailure.isLeft() ? 'and items' : '';
      final errorMessage = 'Error getting $categoryError $itemError.';
      emit(ShoppingListWatcherState.failed(errorMessage));
      return;
    }

    final Stream<List<Category>> categoriesStream =
        categoriesOrFailure.fold((l) => Stream.value([]), (r) => r);
    final Stream<List<ShoppingItem>> itemsStream =
        itemsOrFailure.fold((l) => Stream.value([]), (r) => r);

    categorySubscription = categoriesStream.listen((categories) {
      List<ShoppingItem> items = [];
      if (state is WatcherLoaded) {
        items = (state as WatcherLoaded).items;
      }
      emit(ShoppingListWatcherState.loaded(categories, items));
    });
    itemsSubscription = itemsStream.listen((items) {
      List<Category> categories = [];
      if (state is WatcherLoaded) {
        categories = (state as WatcherLoaded).categories;
      }
      emit(ShoppingListWatcherState.loaded(categories, items));
    });
  }

  @override
  Future<void> close() {
    categorySubscription.cancel();
    itemsSubscription.cancel();
    return super.close();
  }
}
