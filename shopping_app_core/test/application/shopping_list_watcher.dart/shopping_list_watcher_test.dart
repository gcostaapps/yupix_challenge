import 'package:dependencies_core/dependencies_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

class MockCategoryRepository extends Mock implements ICategoryRepository {}

class MockShoppingItemRepository extends Mock
    implements IShoppingItemRepository {}

void main() {
  late MockCategoryRepository mockCategoryRepository;
  late MockShoppingItemRepository mockShoppingItemRepository;
  late ShoppingListWatcherCubit watcherCubit;

  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    mockShoppingItemRepository = MockShoppingItemRepository();
    watcherCubit = ShoppingListWatcherCubit(
      mockCategoryRepository,
      mockShoppingItemRepository,
    );
  });

  tearDown(() {
    watcherCubit.close();
  });

  group('ShoppingListWatcher Cubit', () {
    test('initial state should be ShoppingListWatcherInitial', () {
      expect(watcherCubit.state, const ShoppingListWatcherState.initial());
    });

    group('loadItemsAndCategories', () {
      blocTest<ShoppingListWatcherCubit, ShoppingListWatcherState>(
        'should emit [WatcherLoading, WatcherLoaded] when items were retrieved successfully',
        build: () => watcherCubit,
        act: (cubit) {
          when(() => mockCategoryRepository.getAllCategories())
              .thenAnswer((_) => Right(Stream.value([])));

          when(() => mockShoppingItemRepository.getAllShopingItems())
              .thenAnswer((_) => Right(Stream.value([])));

          cubit.loadItemsAndCategories();
        },
        expect: () => [
          isA<WatcherLoading>(),
          isA<WatcherLoaded>(),
        ],
        verify: (_) {
          verify(() => mockCategoryRepository.getAllCategories()).called(1);
          verify(() => mockShoppingItemRepository.getAllShopingItems())
              .called(1);
          verifyNoMoreInteractions(mockCategoryRepository);
          verifyNoMoreInteractions(mockShoppingItemRepository);
        },
      );
    });

    blocTest<ShoppingListWatcherCubit, ShoppingListWatcherState>(
      'should emit [WatcherLoading, WatcherFailed] when category repository throws failure',
      build: () => watcherCubit,
      act: (cubit) {
        when(() => mockCategoryRepository.getAllCategories())
            .thenAnswer((_) => Left(GeneralFailure(ErrorData(''))));

        when(() => mockShoppingItemRepository.getAllShopingItems())
            .thenAnswer((_) => Right(Stream.value([])));

        cubit.loadItemsAndCategories();
      },
      expect: () => [
        isA<WatcherLoading>(),
        isA<WatcherFailed>(),
      ],
      verify: (_) {
        verify(() => mockCategoryRepository.getAllCategories()).called(1);
        verify(() => mockShoppingItemRepository.getAllShopingItems()).called(1);
        verifyNoMoreInteractions(mockCategoryRepository);
        verifyNoMoreInteractions(mockShoppingItemRepository);
      },
    );

    blocTest<ShoppingListWatcherCubit, ShoppingListWatcherState>(
      'should emit [WatcherLoading, WatcherFailed] when shopping items repository throws failure',
      build: () => watcherCubit,
      act: (cubit) {
        when(() => mockCategoryRepository.getAllCategories())
            .thenAnswer((_) => Right(Stream.value([])));

        when(() => mockShoppingItemRepository.getAllShopingItems())
            .thenAnswer((_) => Left(GeneralFailure(ErrorData(''))));

        cubit.loadItemsAndCategories();
      },
      expect: () => [
        isA<WatcherLoading>(),
        isA<WatcherFailed>(),
      ],
      verify: (_) {
        verify(() => mockCategoryRepository.getAllCategories()).called(1);
        verify(() => mockShoppingItemRepository.getAllShopingItems()).called(1);
        verifyNoMoreInteractions(mockCategoryRepository);
        verifyNoMoreInteractions(mockShoppingItemRepository);
      },
    );
  });
}
