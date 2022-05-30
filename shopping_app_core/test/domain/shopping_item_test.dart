import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

void main() {
  group('ShoppingItem asserts', () {
    test('should not allow favorite without favotiedAt date', () {
      expect(
        () {
          ShoppingItem(
            id: '1',
            imageUrl: 'https://example.com',
            imageName: 'teste',
            categoryId: '1',
            isFavorite: true,
            name: 'Test',
            position: 0,
          );
        },
        throwsAssertionError,
      );
    });
  });
}
