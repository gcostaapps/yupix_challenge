import 'package:dependencies_core/dependencies_core.dart';

import '../general_failure.dart';
import 'category.dart';

abstract class ICategoryRepository {
  Future<Either<GeneralFailure, Category>> addCategory(Category category);
  Future<Either<GeneralFailure, Unit>> deleteCategory(String categoryId);
  Future<Either<GeneralFailure, List<Category>>> getAllCategories();
}
