import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_core/src/domain/category/category.dart';
import 'package:shopping_app_core/src/infrastructure/category/datasource/category_dto.dart';

void main() {
  final category = Category(id: '1', name: 'Test', color: Colors.red.shade500);
  final categoryDto =
      CategoryDto(id: '1', name: 'Test', color: Colors.red.shade500.value);

  group('CategoryDto', () {
    test('should convert a category to categoryDto with correct values', () {
      expect(CategoryDto.fromDomain(category), equals(categoryDto));
    });

    test('should convert to a category with correct values', () {
      expect(categoryDto.toDomain(), equals(category));
    });
  });
}
