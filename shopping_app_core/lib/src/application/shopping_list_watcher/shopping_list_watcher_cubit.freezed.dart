// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shopping_list_watcher_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShoppingListWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Category> categories, List<ShoppingItem> items)
        loaded,
    required TResult Function(String error) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<ShoppingItem> items)?
        loaded,
    TResult Function(String error)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<ShoppingItem> items)?
        loaded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatcherInitial value) initial,
    required TResult Function(WatcherLoading value) loading,
    required TResult Function(WatcherLoaded value) loaded,
    required TResult Function(WatcherFailed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WatcherInitial value)? initial,
    TResult Function(WatcherLoading value)? loading,
    TResult Function(WatcherLoaded value)? loaded,
    TResult Function(WatcherFailed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatcherInitial value)? initial,
    TResult Function(WatcherLoading value)? loading,
    TResult Function(WatcherLoaded value)? loaded,
    TResult Function(WatcherFailed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListWatcherStateCopyWith<$Res> {
  factory $ShoppingListWatcherStateCopyWith(ShoppingListWatcherState value,
          $Res Function(ShoppingListWatcherState) then) =
      _$ShoppingListWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShoppingListWatcherStateCopyWithImpl<$Res>
    implements $ShoppingListWatcherStateCopyWith<$Res> {
  _$ShoppingListWatcherStateCopyWithImpl(this._value, this._then);

  final ShoppingListWatcherState _value;
  // ignore: unused_field
  final $Res Function(ShoppingListWatcherState) _then;
}

/// @nodoc
abstract class _$$WatcherInitialCopyWith<$Res> {
  factory _$$WatcherInitialCopyWith(
          _$WatcherInitial value, $Res Function(_$WatcherInitial) then) =
      __$$WatcherInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WatcherInitialCopyWithImpl<$Res>
    extends _$ShoppingListWatcherStateCopyWithImpl<$Res>
    implements _$$WatcherInitialCopyWith<$Res> {
  __$$WatcherInitialCopyWithImpl(
      _$WatcherInitial _value, $Res Function(_$WatcherInitial) _then)
      : super(_value, (v) => _then(v as _$WatcherInitial));

  @override
  _$WatcherInitial get _value => super._value as _$WatcherInitial;
}

/// @nodoc

class _$WatcherInitial implements WatcherInitial {
  const _$WatcherInitial();

  @override
  String toString() {
    return 'ShoppingListWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WatcherInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Category> categories, List<ShoppingItem> items)
        loaded,
    required TResult Function(String error) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<ShoppingItem> items)?
        loaded,
    TResult Function(String error)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<ShoppingItem> items)?
        loaded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatcherInitial value) initial,
    required TResult Function(WatcherLoading value) loading,
    required TResult Function(WatcherLoaded value) loaded,
    required TResult Function(WatcherFailed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WatcherInitial value)? initial,
    TResult Function(WatcherLoading value)? loading,
    TResult Function(WatcherLoaded value)? loaded,
    TResult Function(WatcherFailed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatcherInitial value)? initial,
    TResult Function(WatcherLoading value)? loading,
    TResult Function(WatcherLoaded value)? loaded,
    TResult Function(WatcherFailed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class WatcherInitial implements ShoppingListWatcherState {
  const factory WatcherInitial() = _$WatcherInitial;
}

/// @nodoc
abstract class _$$WatcherLoadingCopyWith<$Res> {
  factory _$$WatcherLoadingCopyWith(
          _$WatcherLoading value, $Res Function(_$WatcherLoading) then) =
      __$$WatcherLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WatcherLoadingCopyWithImpl<$Res>
    extends _$ShoppingListWatcherStateCopyWithImpl<$Res>
    implements _$$WatcherLoadingCopyWith<$Res> {
  __$$WatcherLoadingCopyWithImpl(
      _$WatcherLoading _value, $Res Function(_$WatcherLoading) _then)
      : super(_value, (v) => _then(v as _$WatcherLoading));

  @override
  _$WatcherLoading get _value => super._value as _$WatcherLoading;
}

/// @nodoc

class _$WatcherLoading implements WatcherLoading {
  const _$WatcherLoading();

  @override
  String toString() {
    return 'ShoppingListWatcherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WatcherLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Category> categories, List<ShoppingItem> items)
        loaded,
    required TResult Function(String error) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<ShoppingItem> items)?
        loaded,
    TResult Function(String error)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<ShoppingItem> items)?
        loaded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatcherInitial value) initial,
    required TResult Function(WatcherLoading value) loading,
    required TResult Function(WatcherLoaded value) loaded,
    required TResult Function(WatcherFailed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WatcherInitial value)? initial,
    TResult Function(WatcherLoading value)? loading,
    TResult Function(WatcherLoaded value)? loaded,
    TResult Function(WatcherFailed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatcherInitial value)? initial,
    TResult Function(WatcherLoading value)? loading,
    TResult Function(WatcherLoaded value)? loaded,
    TResult Function(WatcherFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class WatcherLoading implements ShoppingListWatcherState {
  const factory WatcherLoading() = _$WatcherLoading;
}

/// @nodoc
abstract class _$$WatcherLoadedCopyWith<$Res> {
  factory _$$WatcherLoadedCopyWith(
          _$WatcherLoaded value, $Res Function(_$WatcherLoaded) then) =
      __$$WatcherLoadedCopyWithImpl<$Res>;
  $Res call({List<Category> categories, List<ShoppingItem> items});
}

/// @nodoc
class __$$WatcherLoadedCopyWithImpl<$Res>
    extends _$ShoppingListWatcherStateCopyWithImpl<$Res>
    implements _$$WatcherLoadedCopyWith<$Res> {
  __$$WatcherLoadedCopyWithImpl(
      _$WatcherLoaded _value, $Res Function(_$WatcherLoaded) _then)
      : super(_value, (v) => _then(v as _$WatcherLoaded));

  @override
  _$WatcherLoaded get _value => super._value as _$WatcherLoaded;

  @override
  $Res call({
    Object? categories = freezed,
    Object? items = freezed,
  }) {
    return _then(_$WatcherLoaded(
      categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItem>,
    ));
  }
}

/// @nodoc

class _$WatcherLoaded implements WatcherLoaded {
  const _$WatcherLoaded(
      final List<Category> categories, final List<ShoppingItem> items)
      : _categories = categories,
        _items = items;

  final List<Category> _categories;
  @override
  List<Category> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<ShoppingItem> _items;
  @override
  List<ShoppingItem> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ShoppingListWatcherState.loaded(categories: $categories, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatcherLoaded &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$WatcherLoadedCopyWith<_$WatcherLoaded> get copyWith =>
      __$$WatcherLoadedCopyWithImpl<_$WatcherLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Category> categories, List<ShoppingItem> items)
        loaded,
    required TResult Function(String error) failed,
  }) {
    return loaded(categories, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<ShoppingItem> items)?
        loaded,
    TResult Function(String error)? failed,
  }) {
    return loaded?.call(categories, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<ShoppingItem> items)?
        loaded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(categories, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatcherInitial value) initial,
    required TResult Function(WatcherLoading value) loading,
    required TResult Function(WatcherLoaded value) loaded,
    required TResult Function(WatcherFailed value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WatcherInitial value)? initial,
    TResult Function(WatcherLoading value)? loading,
    TResult Function(WatcherLoaded value)? loaded,
    TResult Function(WatcherFailed value)? failed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatcherInitial value)? initial,
    TResult Function(WatcherLoading value)? loading,
    TResult Function(WatcherLoaded value)? loaded,
    TResult Function(WatcherFailed value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class WatcherLoaded implements ShoppingListWatcherState {
  const factory WatcherLoaded(
          final List<Category> categories, final List<ShoppingItem> items) =
      _$WatcherLoaded;

  List<Category> get categories => throw _privateConstructorUsedError;
  List<ShoppingItem> get items => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$WatcherLoadedCopyWith<_$WatcherLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WatcherFailedCopyWith<$Res> {
  factory _$$WatcherFailedCopyWith(
          _$WatcherFailed value, $Res Function(_$WatcherFailed) then) =
      __$$WatcherFailedCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$WatcherFailedCopyWithImpl<$Res>
    extends _$ShoppingListWatcherStateCopyWithImpl<$Res>
    implements _$$WatcherFailedCopyWith<$Res> {
  __$$WatcherFailedCopyWithImpl(
      _$WatcherFailed _value, $Res Function(_$WatcherFailed) _then)
      : super(_value, (v) => _then(v as _$WatcherFailed));

  @override
  _$WatcherFailed get _value => super._value as _$WatcherFailed;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$WatcherFailed(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WatcherFailed implements WatcherFailed {
  const _$WatcherFailed(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ShoppingListWatcherState.failed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatcherFailed &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$WatcherFailedCopyWith<_$WatcherFailed> get copyWith =>
      __$$WatcherFailedCopyWithImpl<_$WatcherFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Category> categories, List<ShoppingItem> items)
        loaded,
    required TResult Function(String error) failed,
  }) {
    return failed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<ShoppingItem> items)?
        loaded,
    TResult Function(String error)? failed,
  }) {
    return failed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<ShoppingItem> items)?
        loaded,
    TResult Function(String error)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatcherInitial value) initial,
    required TResult Function(WatcherLoading value) loading,
    required TResult Function(WatcherLoaded value) loaded,
    required TResult Function(WatcherFailed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WatcherInitial value)? initial,
    TResult Function(WatcherLoading value)? loading,
    TResult Function(WatcherLoaded value)? loaded,
    TResult Function(WatcherFailed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatcherInitial value)? initial,
    TResult Function(WatcherLoading value)? loading,
    TResult Function(WatcherLoaded value)? loaded,
    TResult Function(WatcherFailed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class WatcherFailed implements ShoppingListWatcherState {
  const factory WatcherFailed(final String error) = _$WatcherFailed;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$WatcherFailedCopyWith<_$WatcherFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
