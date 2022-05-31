import 'package:dependencies_core/dependencies_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_core/src/domain/category/category.dart';
import 'package:shopping_app_core/src/domain/general_failure.dart';
import 'package:shopping_app_core/src/infrastructure/category/repository/category_repository.dart';
import 'package:shopping_app_core/src/infrastructure/category/repository/i_category_datasource.dart';

class MockCategoryDatasource extends Mock implements ICategoryDatasource {}

void main() {
  late MockCategoryDatasource mockCategoryDatasource;
  late CategoryRepository categoryRepository;

  final category = Category(name: 'Test', color: Colors.red);
  final categorySaved = Category(id: '1', name: 'Test', color: Colors.red);

  final exception = Exception('Error');

  setUpAll(() {
    mockCategoryDatasource = MockCategoryDatasource();
    categoryRepository = CategoryRepository(mockCategoryDatasource);
  });

  group('Category repository', () {
    group('addCategory', () {
      test('should return Right(Category) when category is added sucessfully',
          () async {
        when(() => mockCategoryDatasource.addCategory(category))
            .thenAnswer((_) => Future.value(categorySaved));

        final result = await categoryRepository.addCategory(category);
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockCategoryDatasource.addCategory(category)).called(1);
        verifyNoMoreInteractions(mockCategoryDatasource);
        expect(result.isRight(), true);
        expect(resultOption, equals(categorySaved));
      });

      test(
          'should return Left(GeneralFailure(ErrorData error)) when database throws an error',
          () async {
        when(() => mockCategoryDatasource.addCategory(category))
            .thenThrow(exception);

        final result = await categoryRepository.addCategory(category);
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockCategoryDatasource.addCategory(category)).called(1);
        verifyNoMoreInteractions(mockCategoryDatasource);
        expect(result.isLeft(), true);
        expect(resultOption, isInstanceOf<GeneralFailure>());
        expect((resultOption as GeneralFailure).error.message,
            equals('addCategory'));
      });
    });

    group('deleteCategory', () {
      test('should return Right(Unit) when category is deleted sucessfully',
          () async {
        when(() => mockCategoryDatasource.deleteCategory('1'))
            .thenAnswer((_) => Future.value());

        final result = await categoryRepository.deleteCategory('1');
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockCategoryDatasource.deleteCategory('1')).called(1);
        verifyNoMoreInteractions(mockCategoryDatasource);
        expect(result.isRight(), true);
        expect(resultOption, equals(unit));
      });

      test(
          'should return Left(GeneralFailure(ErrorData error)) when database throws an error',
          () async {
        when(() => mockCategoryDatasource.deleteCategory('1'))
            .thenThrow(exception);

        final result = await categoryRepository.deleteCategory('1');
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockCategoryDatasource.deleteCategory('1')).called(1);
        verifyNoMoreInteractions(mockCategoryDatasource);
        expect(result.isLeft(), true);
        expect(resultOption, isInstanceOf<GeneralFailure>());
        expect((resultOption as GeneralFailure).error.message,
            equals('deleteCategory'));
      });
    });

    group('getAllCategories', () {
      test(
          'should return Right(List<Category>) when categories is retrieved sucessfully',
          () async {
        when(() => mockCategoryDatasource.getAllCategories())
            .thenAnswer((_) => Future.value([categorySaved]));

        final result = await categoryRepository.getAllCategories();
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockCategoryDatasource.getAllCategories()).called(1);
        verifyNoMoreInteractions(mockCategoryDatasource);
        expect(result.isRight(), true);
        expect(resultOption, equals([categorySaved]));
      });

      test(
          'should return Left(GeneralFailure(ErrorData error)) when database throws an error',
          () async {
        when(() => mockCategoryDatasource.getAllCategories())
            .thenThrow(exception);

        final result = await categoryRepository.getAllCategories();
        final resultOption = result.fold((l) => l, (r) => r);

        verify(() => mockCategoryDatasource.getAllCategories()).called(1);
        verifyNoMoreInteractions(mockCategoryDatasource);
        expect(result.isLeft(), true);
        expect(resultOption, isInstanceOf<GeneralFailure>());
        expect((resultOption as GeneralFailure).error.message,
            equals('getAllCategories'));
      });
    });
  });
}
