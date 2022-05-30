import 'package:flutter_test/flutter_test.dart';
import 'package:dependencies_core/dependencies_core.dart';
import 'package:shopping_app_core/src/domain/general_failure.dart';
import 'package:shopping_app_core/src/domain/shopping_item/shopping_item.dart';
import 'package:shopping_app_core/src/infrastructure/shopping_item/repository/i_shopping_item_datasource.dart';
import 'package:shopping_app_core/src/infrastructure/shopping_item/repository/shopping_item_repository.dart';

class MockShoppingItemDatasource extends Mock
    implements IShoppingItemDatasource {}

void main() {
  late MockShoppingItemDatasource mockShoppingItemDatasource;
  late ShoppingItemRepository shoppingItemRepository;

  const shoppingItem = ShoppingItem(
    imageUrl: 'https://example.com',
    categoryId: '1',
    imageName: 'teste',
    isFavorite: false,
    name: 'Test',
    position: 0,
  );
  const shoppingItemSaved = ShoppingItem(
    id: '1',
    imageUrl: 'https://example.com',
    categoryId: '1',
    imageName: 'teste',
    isFavorite: false,
    name: 'Test',
    position: 0,
  );

  final exception = Exception('Error');

  setUpAll(() {
    mockShoppingItemDatasource = MockShoppingItemDatasource();
    shoppingItemRepository = ShoppingItemRepository(mockShoppingItemDatasource);
  });

  group('ShoppingItem repository', () {
    group('addShoppingItem', () {
      test('should return Right(ShoppingItem) when item is added sucessfully',
          () async {
        when(() => mockShoppingItemDatasource.addShoppingItem(shoppingItem))
            .thenAnswer((_) => Future.value(shoppingItemSaved));

        final result =
            await shoppingItemRepository.addShoppingItem(shoppingItem);
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockShoppingItemDatasource.addShoppingItem(shoppingItem))
            .called(1);
        verifyNoMoreInteractions(mockShoppingItemDatasource);
        expect(result.isRight(), true);
        expect(resultOption, equals(shoppingItemSaved));
      });

      test(
          'should return Left(GeneralFailure(ErrorData error)) when database throws an error',
          () async {
        when(() => mockShoppingItemDatasource.addShoppingItem(shoppingItem))
            .thenThrow(exception);

        final result =
            await shoppingItemRepository.addShoppingItem(shoppingItem);
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockShoppingItemDatasource.addShoppingItem(shoppingItem))
            .called(1);
        verifyNoMoreInteractions(mockShoppingItemDatasource);
        expect(result.isLeft(), true);
        expect(resultOption, isInstanceOf<GeneralFailure>());
        expect((resultOption as GeneralFailure).error.message,
            equals('addShoppingItem'));
      });
    });

    group('deleteShoppingItem', () {
      test('should return Right(Unit) when shoppingItem is removed sucessfully',
          () async {
        when(() => mockShoppingItemDatasource.deleteShoppingItem('1'))
            .thenAnswer((_) => Future.value());

        final result = await shoppingItemRepository.deleteShoppingItem('1');
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockShoppingItemDatasource.deleteShoppingItem('1'))
            .called(1);
        verifyNoMoreInteractions(mockShoppingItemDatasource);
        expect(result.isRight(), true);
        expect(resultOption, equals(unit));
      });

      test(
          'should return Left(GeneralFailure(ErrorData error)) when database throws an error',
          () async {
        when(() => mockShoppingItemDatasource.deleteShoppingItem('1'))
            .thenThrow(exception);

        final result = await shoppingItemRepository.deleteShoppingItem('1');
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockShoppingItemDatasource.deleteShoppingItem('1'))
            .called(1);
        verifyNoMoreInteractions(mockShoppingItemDatasource);
        expect(result.isLeft(), true);
        expect(resultOption, isInstanceOf<GeneralFailure>());
        expect((resultOption as GeneralFailure).error.message,
            equals('deleteShoppingItem'));
      });
    });

    group('deleteShoppingItems', () {
      test(
          'should return Right(Unit) when list of shoppingItem is removed sucessfully',
          () async {
        when(() => mockShoppingItemDatasource.deleteShoppingItems(['1', '2']))
            .thenAnswer((_) => Future.value());

        final result =
            await shoppingItemRepository.deleteShoppingItems(['1', '2']);
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockShoppingItemDatasource.deleteShoppingItems(['1', '2']))
            .called(1);
        verifyNoMoreInteractions(mockShoppingItemDatasource);
        expect(result.isRight(), true);
        expect(resultOption, equals(unit));
      });

      test(
          'should return Left(GeneralFailure(ErrorData error)) when database throws an error',
          () async {
        when(() => mockShoppingItemDatasource.deleteShoppingItems(['1', '2']))
            .thenThrow(exception);

        final result =
            await shoppingItemRepository.deleteShoppingItems(['1', '2']);
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockShoppingItemDatasource.deleteShoppingItems(['1', '2']))
            .called(1);
        verifyNoMoreInteractions(mockShoppingItemDatasource);
        expect(result.isLeft(), true);
        expect(resultOption, isInstanceOf<GeneralFailure>());
        expect((resultOption as GeneralFailure).error.message,
            equals('deleteShoppingItems'));
      });
    });

    group('getAllShopingItems', () {
      test(
          'should return Right(Stream<ShoppingItem>) when list of shoppingItem is retrieved sucessfully',
          () async {
        when(() => mockShoppingItemDatasource.getAllShopingItems())
            .thenAnswer((_) => Stream.value([shoppingItemSaved]));

        final result = shoppingItemRepository.getAllShopingItems();
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockShoppingItemDatasource.getAllShopingItems()).called(1);
        verifyNoMoreInteractions(mockShoppingItemDatasource);
        expect(result.isRight(), true);
        expect(resultOption, emits(equals([shoppingItemSaved])));
      });

      test(
          'should return Left(GeneralFailure(ErrorData error)) when database throws an error',
          () async {
        when(() => mockShoppingItemDatasource.getAllShopingItems())
            .thenThrow(exception);

        final result = shoppingItemRepository.getAllShopingItems();
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockShoppingItemDatasource.getAllShopingItems()).called(1);
        verifyNoMoreInteractions(mockShoppingItemDatasource);
        expect(result.isLeft(), true);
        expect(resultOption, isInstanceOf<GeneralFailure>());
        expect((resultOption as GeneralFailure).error.message,
            equals('getAllShopingItems'));
      });
    });

    group('updateShoppingItem', () {
      test('should return Right(Unit) when shoppingItem is updated sucessfully',
          () async {
        when(() => mockShoppingItemDatasource.updateShoppingItem(
            shoppingItemSaved)).thenAnswer((_) => Future.value());

        final result =
            await shoppingItemRepository.updateShoppingItem(shoppingItemSaved);
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockShoppingItemDatasource
            .updateShoppingItem(shoppingItemSaved)).called(1);
        verifyNoMoreInteractions(mockShoppingItemDatasource);
        expect(result.isRight(), true);
        expect(resultOption, equals(unit));
      });

      test(
          'should return Left(GeneralFailure(ErrorData error)) when database throws an error',
          () async {
        when(() => mockShoppingItemDatasource
            .updateShoppingItem(shoppingItemSaved)).thenThrow(exception);

        final result =
            await shoppingItemRepository.updateShoppingItem(shoppingItemSaved);
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockShoppingItemDatasource
            .updateShoppingItem(shoppingItemSaved)).called(1);
        verifyNoMoreInteractions(mockShoppingItemDatasource);
        expect(result.isLeft(), true);
        expect(resultOption, isInstanceOf<GeneralFailure>());
        expect((resultOption as GeneralFailure).error.message,
            equals('updateShoppingItem'));
      });
    });
  });
}
