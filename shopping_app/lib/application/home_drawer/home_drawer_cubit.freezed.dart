// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_drawer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeDrawerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() products,
    required TResult Function() favorites,
    required TResult Function() newItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? products,
    TResult Function()? favorites,
    TResult Function()? newItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? products,
    TResult Function()? favorites,
    TResult Function()? newItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Products value) products,
    required TResult Function(Favorites value) favorites,
    required TResult Function(NewItem value) newItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Products value)? products,
    TResult Function(Favorites value)? favorites,
    TResult Function(NewItem value)? newItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Products value)? products,
    TResult Function(Favorites value)? favorites,
    TResult Function(NewItem value)? newItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDrawerStateCopyWith<$Res> {
  factory $HomeDrawerStateCopyWith(
          HomeDrawerState value, $Res Function(HomeDrawerState) then) =
      _$HomeDrawerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeDrawerStateCopyWithImpl<$Res>
    implements $HomeDrawerStateCopyWith<$Res> {
  _$HomeDrawerStateCopyWithImpl(this._value, this._then);

  final HomeDrawerState _value;
  // ignore: unused_field
  final $Res Function(HomeDrawerState) _then;
}

/// @nodoc
abstract class _$$ProductsCopyWith<$Res> {
  factory _$$ProductsCopyWith(
          _$Products value, $Res Function(_$Products) then) =
      __$$ProductsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductsCopyWithImpl<$Res> extends _$HomeDrawerStateCopyWithImpl<$Res>
    implements _$$ProductsCopyWith<$Res> {
  __$$ProductsCopyWithImpl(_$Products _value, $Res Function(_$Products) _then)
      : super(_value, (v) => _then(v as _$Products));

  @override
  _$Products get _value => super._value as _$Products;
}

/// @nodoc

class _$Products implements Products {
  const _$Products();

  @override
  String toString() {
    return 'HomeDrawerState.products()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Products);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() products,
    required TResult Function() favorites,
    required TResult Function() newItem,
  }) {
    return products();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? products,
    TResult Function()? favorites,
    TResult Function()? newItem,
  }) {
    return products?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? products,
    TResult Function()? favorites,
    TResult Function()? newItem,
    required TResult orElse(),
  }) {
    if (products != null) {
      return products();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Products value) products,
    required TResult Function(Favorites value) favorites,
    required TResult Function(NewItem value) newItem,
  }) {
    return products(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Products value)? products,
    TResult Function(Favorites value)? favorites,
    TResult Function(NewItem value)? newItem,
  }) {
    return products?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Products value)? products,
    TResult Function(Favorites value)? favorites,
    TResult Function(NewItem value)? newItem,
    required TResult orElse(),
  }) {
    if (products != null) {
      return products(this);
    }
    return orElse();
  }
}

abstract class Products implements HomeDrawerState {
  const factory Products() = _$Products;
}

/// @nodoc
abstract class _$$FavoritesCopyWith<$Res> {
  factory _$$FavoritesCopyWith(
          _$Favorites value, $Res Function(_$Favorites) then) =
      __$$FavoritesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoritesCopyWithImpl<$Res>
    extends _$HomeDrawerStateCopyWithImpl<$Res>
    implements _$$FavoritesCopyWith<$Res> {
  __$$FavoritesCopyWithImpl(
      _$Favorites _value, $Res Function(_$Favorites) _then)
      : super(_value, (v) => _then(v as _$Favorites));

  @override
  _$Favorites get _value => super._value as _$Favorites;
}

/// @nodoc

class _$Favorites implements Favorites {
  const _$Favorites();

  @override
  String toString() {
    return 'HomeDrawerState.favorites()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Favorites);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() products,
    required TResult Function() favorites,
    required TResult Function() newItem,
  }) {
    return favorites();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? products,
    TResult Function()? favorites,
    TResult Function()? newItem,
  }) {
    return favorites?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? products,
    TResult Function()? favorites,
    TResult Function()? newItem,
    required TResult orElse(),
  }) {
    if (favorites != null) {
      return favorites();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Products value) products,
    required TResult Function(Favorites value) favorites,
    required TResult Function(NewItem value) newItem,
  }) {
    return favorites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Products value)? products,
    TResult Function(Favorites value)? favorites,
    TResult Function(NewItem value)? newItem,
  }) {
    return favorites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Products value)? products,
    TResult Function(Favorites value)? favorites,
    TResult Function(NewItem value)? newItem,
    required TResult orElse(),
  }) {
    if (favorites != null) {
      return favorites(this);
    }
    return orElse();
  }
}

abstract class Favorites implements HomeDrawerState {
  const factory Favorites() = _$Favorites;
}

/// @nodoc
abstract class _$$NewItemCopyWith<$Res> {
  factory _$$NewItemCopyWith(_$NewItem value, $Res Function(_$NewItem) then) =
      __$$NewItemCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewItemCopyWithImpl<$Res> extends _$HomeDrawerStateCopyWithImpl<$Res>
    implements _$$NewItemCopyWith<$Res> {
  __$$NewItemCopyWithImpl(_$NewItem _value, $Res Function(_$NewItem) _then)
      : super(_value, (v) => _then(v as _$NewItem));

  @override
  _$NewItem get _value => super._value as _$NewItem;
}

/// @nodoc

class _$NewItem implements NewItem {
  const _$NewItem();

  @override
  String toString() {
    return 'HomeDrawerState.newItem()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewItem);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() products,
    required TResult Function() favorites,
    required TResult Function() newItem,
  }) {
    return newItem();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? products,
    TResult Function()? favorites,
    TResult Function()? newItem,
  }) {
    return newItem?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? products,
    TResult Function()? favorites,
    TResult Function()? newItem,
    required TResult orElse(),
  }) {
    if (newItem != null) {
      return newItem();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Products value) products,
    required TResult Function(Favorites value) favorites,
    required TResult Function(NewItem value) newItem,
  }) {
    return newItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Products value)? products,
    TResult Function(Favorites value)? favorites,
    TResult Function(NewItem value)? newItem,
  }) {
    return newItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Products value)? products,
    TResult Function(Favorites value)? favorites,
    TResult Function(NewItem value)? newItem,
    required TResult orElse(),
  }) {
    if (newItem != null) {
      return newItem(this);
    }
    return orElse();
  }
}

abstract class NewItem implements HomeDrawerState {
  const factory NewItem() = _$NewItem;
}
