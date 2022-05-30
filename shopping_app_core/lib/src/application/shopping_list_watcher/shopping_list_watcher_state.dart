part of 'shopping_list_watcher_cubit.dart';

@freezed
class ShoppingListWatcherState with _$ShoppingListWatcherState {
  const factory ShoppingListWatcherState.initial() = WatcherInitial;
  const factory ShoppingListWatcherState.loading() = WatcherLoading;
  const factory ShoppingListWatcherState.loaded(
    List<Category> categories,
    List<ShoppingItem> items,
  ) = WatcherLoaded;
  const factory ShoppingListWatcherState.failed(String error) = WatcherFailed;
}
