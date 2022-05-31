import 'package:dependencies_core/dependencies_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

class MockCategoryRepository extends Mock implements ICategoryRepository {}

class MockShoppingItemRepository extends Mock
    implements IShoppingItemRepository {}

class MockShoppingListWatcherCubit extends Mock
    implements ShoppingListWatcherCubit {}

class MockStorageService extends Mock implements IStorageService {}

void main() {
  late MockCategoryRepository mockCategoryRepository;
  late MockShoppingItemRepository mockShoppingItemRepository;
  late MockShoppingListWatcherCubit mockShoppingListWatcherCubit;
  late MockStorageService mockStorageService;
  late ShoppingListActorCubit actorCubit;

  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    mockShoppingItemRepository = MockShoppingItemRepository();
    mockShoppingListWatcherCubit = MockShoppingListWatcherCubit();
    mockStorageService = MockStorageService();
    actorCubit = ShoppingListActorCubit(
      mockStorageService,
      mockCategoryRepository,
      mockShoppingItemRepository,
      mockShoppingListWatcherCubit,
    );
  });

  tearDown(() {
    actorCubit.close();
  });

  const shoppingItem = ShoppingItem(
    name: 'name',
    imageUrl: 'imageUrl',
    imageName: 'imageName',
    isFavorite: false,
    position: 0,
    categoryId: 'categoryId',
  );

  final resetState = ShoppingListActorState(
    reorderFailureOrSuccessOption: none(),
    favoriteFailureOrSuccessOption: none(),
    removeFailureOrSuccessOption: none(),
  );

  final reorderSuccessState = ShoppingListActorState(
    reorderFailureOrSuccessOption: some(right(unit)),
    favoriteFailureOrSuccessOption: none(),
    removeFailureOrSuccessOption: none(),
  );

  group('ShoppingListActor Cubit', () {
    test('initial state should be ShoppingListActorInitial', () {
      expect(actorCubit.state, ShoppingListActorState.initial());
    });

    group('reorderShoppingItem', () {
      blocTest<ShoppingListActorCubit, ShoppingListActorState>(
        'should reset failures and emit reorder success state option if items were reordered successfully',
        build: () => actorCubit,
        setUp: () {
          when(() =>
                  mockShoppingItemRepository.updateShoppingItem(shoppingItem))
              .thenAnswer((_) => Future.value(const Right(unit)));
        },
        act: (cubit) => cubit.reorderShoppingItem(shoppingItem),
        expect: () => [resetState, reorderSuccessState],
        verify: (_) {
          verify(() =>
                  mockShoppingItemRepository.updateShoppingItem(shoppingItem))
              .called(1);
          verifyNoMoreInteractions(mockShoppingItemRepository);
        },
      );
    });
  });
}
