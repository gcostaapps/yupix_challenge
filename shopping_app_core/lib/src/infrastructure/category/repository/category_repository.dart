import 'package:dependencies_core/dependencies_core.dart';

import '../../../domain/category/category.dart';
import '../../../domain/category/i_category_repository.dart';
import '../../../domain/error_data.dart';
import '../../../domain/general_failure.dart';
import 'i_category_datasource.dart';

class CategoryRepository implements ICategoryRepository {
  final ICategoryDatasource categoryDatasource;

  CategoryRepository(this.categoryDatasource);

  @override
  Future<Either<GeneralFailure, Category>> addCategory(
      Category category) async {
    try {
      final savedCategory = await categoryDatasource.addCategory(category);
      return Right(savedCategory);
    } catch (e, stack) {
      return Left(GeneralFailure(ErrorData('addCategory', e, stack)));
    }
  }

  @override
  Future<Either<GeneralFailure, Unit>> deleteCategory(String categoryId) async {
    try {
      await categoryDatasource.deleteCategory(categoryId);
      return const Right(unit);
    } catch (e, stack) {
      return Left(GeneralFailure(ErrorData('deleteCategory', e, stack)));
    }
  }

  @override
  Future<Either<GeneralFailure, List<Category>>> getAllCategories() async {
    try {
      final categories = await categoryDatasource.getAllCategories();
      return Right(categories);
    } catch (e, stack) {
      return Left(GeneralFailure(ErrorData('getAllCategories', e, stack)));
    }
  }
}
