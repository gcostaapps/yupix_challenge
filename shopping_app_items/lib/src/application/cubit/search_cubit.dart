import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:shopping_app_core/shopping_app_core.dart';

part 'search_state.dart';

//For large data (huge arrays) it could be a bloc with a restartable transformer
//from bloc_concurrency, so the bloc would process only the latest event
//and cancel previous event handlers
class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial());

  void updateDefaultLists(List<Category> categories, List<ShoppingItem> items) {
    final sortedCategories = List<Category>.from(categories)
      ..sort((a, b) => a.id!.compareTo(b.id!));

    final sortedItems = List<ShoppingItem>.from(items)
      ..sort((a, b) => a.position.compareTo(b.position));

    emit(state.copyWith(
      defaultCategories: categories,
      defaultItems: items,
      filteredCategories: sortedCategories,
      filteredItems: sortedItems,
      searchText: '',
    ));
  }

  void search(String searchText) {
    final categoriesSearched = state.defaultCategories
        .where((category) => category.name.contains(searchText))
        .toList();

    final itemsSearched = state.defaultItems
        .where((item) =>
            item.name.contains(searchText) ||
            categoriesSearched
                .where((category) => category.id == item.categoryId)
                .isNotEmpty)
        .toList();

    final itemsCategoriesIds = itemsSearched.map((item) => item.categoryId);
    for (final categoryId in itemsCategoriesIds) {
      if (categoriesSearched
          .where((category) => category.id == categoryId)
          .isEmpty) {
        categoriesSearched.add(state.defaultCategories
            .firstWhere((category) => category.id == categoryId));
      }
    }

    emit(state.copyWith(
      searchText: searchText,
      filteredCategories: categoriesSearched
        ..sort((a, b) => a.id!.compareTo(b.id!)),
      filteredItems: itemsSearched
        ..sort((a, b) => a.position.compareTo(b.position)),
    ));
  }
}
