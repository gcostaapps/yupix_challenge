part of 'home_drawer_cubit.dart';

@freezed
class HomeDrawerState with _$HomeDrawerState {
  const factory HomeDrawerState.products() = Products;
  const factory HomeDrawerState.favorites() = Favorites;
  const factory HomeDrawerState.newItem() = NewItem;
}
