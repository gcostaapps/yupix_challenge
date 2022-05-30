import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/category/category.dart';
import '../repository/i_category_datasource.dart';
import 'category_dto.dart';

class CategoryDatasource implements ICategoryDatasource {
  final FirebaseFirestore firestore;

  CategoryDatasource(this.firestore);

  final categoriesCollection = 'categories';

  @override
  Future<Category> addCategory(Category category) async {
    final result = await firestore
        .collection(categoriesCollection)
        .add(CategoryDto.fromDomain(category).toMapWithoutId());

    return category.copyWith(id: result.id);
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    return firestore.collection(categoriesCollection).doc(categoryId).delete();
  }

  @override
  Stream<List<Category>> getAllCategories() {
    final result = firestore.collection(categoriesCollection).snapshots();
    return result.map((event) => event.docs
        .map((e) => CategoryDto.fromMap({
              'id': e.id,
              ...e.data(),
            }).toDomain())
        .toList());
  }
}
