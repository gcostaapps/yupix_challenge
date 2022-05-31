part of 'search_cubit.dart';

@immutable
class SearchState {
  final List<Category> defaultCategories;
  final List<ShoppingItem> defaultItems;

  final List<Category> filteredCategories;
  final List<ShoppingItem> filteredItems;

  final String searchText;
  const SearchState({
    required this.defaultCategories,
    required this.defaultItems,
    required this.filteredCategories,
    required this.filteredItems,
    required this.searchText,
  });

  factory SearchState.initial() => const SearchState(
        defaultCategories: [],
        defaultItems: [],
        filteredCategories: [],
        filteredItems: [],
        searchText: '',
      );

  SearchState copyWith({
    List<Category>? defaultCategories,
    List<ShoppingItem>? defaultItems,
    List<Category>? filteredCategories,
    List<ShoppingItem>? filteredItems,
    String? searchText,
  }) {
    return SearchState(
      defaultCategories: defaultCategories ?? this.defaultCategories,
      defaultItems: defaultItems ?? this.defaultItems,
      filteredCategories: filteredCategories ?? this.filteredCategories,
      filteredItems: filteredItems ?? this.filteredItems,
      searchText: searchText ?? this.searchText,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchState &&
        listEquals(other.defaultCategories, defaultCategories) &&
        listEquals(other.defaultItems, defaultItems) &&
        listEquals(other.filteredCategories, filteredCategories) &&
        listEquals(other.filteredItems, filteredItems) &&
        other.searchText == searchText;
  }

  @override
  int get hashCode {
    return defaultCategories.hashCode ^
        defaultItems.hashCode ^
        filteredCategories.hashCode ^
        filteredItems.hashCode ^
        searchText.hashCode;
  }
}
