part of 'shopping_list_actor_cubit.dart';

@immutable
class ShoppingListActorState {
  final Option<Either<GeneralFailure, Unit>> removeFailureOrSuccessOption;
  final Option<Either<GeneralFailure, Unit>> reorderFailureOrSuccessOption;
  final Option<Either<GeneralFailure, Unit>> favoriteFailureOrSuccessOption;
  const ShoppingListActorState({
    required this.removeFailureOrSuccessOption,
    required this.reorderFailureOrSuccessOption,
    required this.favoriteFailureOrSuccessOption,
  });

  factory ShoppingListActorState.initial() {
    return ShoppingListActorState(
      removeFailureOrSuccessOption: none(),
      reorderFailureOrSuccessOption: none(),
      favoriteFailureOrSuccessOption: none(),
    );
  }

  ShoppingListActorState copyWith({
    Option<Either<GeneralFailure, Unit>>? removeFailureOrSuccessOption,
    Option<Either<GeneralFailure, Unit>>? reorderFailureOrSuccessOption,
    Option<Either<GeneralFailure, Unit>>? favoriteFailureOrSuccessOption,
  }) {
    return ShoppingListActorState(
      removeFailureOrSuccessOption:
          removeFailureOrSuccessOption ?? this.removeFailureOrSuccessOption,
      reorderFailureOrSuccessOption:
          reorderFailureOrSuccessOption ?? this.reorderFailureOrSuccessOption,
      favoriteFailureOrSuccessOption:
          favoriteFailureOrSuccessOption ?? this.favoriteFailureOrSuccessOption,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShoppingListActorState &&
        other.removeFailureOrSuccessOption == removeFailureOrSuccessOption &&
        other.reorderFailureOrSuccessOption == reorderFailureOrSuccessOption &&
        other.favoriteFailureOrSuccessOption == favoriteFailureOrSuccessOption;
  }

  @override
  int get hashCode =>
      removeFailureOrSuccessOption.hashCode ^
      reorderFailureOrSuccessOption.hashCode ^
      favoriteFailureOrSuccessOption.hashCode;
}
