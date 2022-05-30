import '../../../domain/category/category.dart';

abstract class ICategoryDatasource {
  Future<Category> addCategory(Category category);
  Future<void> deleteCategory(String categoryId);
  Stream<List<Category>> getAllCategories();
}
