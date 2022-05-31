import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_core/src/domain/category/category.dart';
import 'package:shopping_app_core/src/infrastructure/category/datasource/category_datasource.dart';

void main() {
  late CategoryDatasource categoryDatasource;
  late FakeFirebaseFirestore firestore;

  final category = Category(
    name: 'Test',
    color: Colors.red.shade500,
  );

  setUp(() async {
    firestore = FakeFirebaseFirestore();
    categoryDatasource = CategoryDatasource(firestore);
  });

  group('Category datasource', () {
    test('should get all categories', () async {
      final savedCategory = await categoryDatasource.addCategory(category);
      final categories = await categoryDatasource.getAllCategories();

      expect(categories.length, 1);
      expect(categories.first, equals(savedCategory));
    });

    test('should add the category and return the value saved with it\'s id',
        () async {
      final newCategory = await categoryDatasource.addCategory(category);

      expect(newCategory.id, isNotNull);
    });

    test('should delete a saved category', () async {
      final savedCategory = await categoryDatasource.addCategory(category);
      final categories = await categoryDatasource.getAllCategories();
      expect(categories.length, 1);
      await categoryDatasource.deleteCategory(savedCategory.id!);
      final newCategories = await categoryDatasource.getAllCategories();
      expect(newCategories.length, 0);
    });
  });
}
