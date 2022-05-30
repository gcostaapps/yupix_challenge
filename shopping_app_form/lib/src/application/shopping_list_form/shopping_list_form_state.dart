part of 'shopping_list_form_cubit.dart';

@immutable
abstract class ShoppingListFormState {
  const ShoppingListFormState();
}

@immutable
class ShoppingListFormCategory extends ShoppingListFormState {
  final String? name;
  final Color color;
  final bool isValidForm;
  final Option<Either<GeneralFailure, Category>> saveFailureOrSuccessOption;

  const ShoppingListFormCategory({
    this.name,
    required this.color,
    this.isValidForm = false,
    required this.saveFailureOrSuccessOption,
  });

  factory ShoppingListFormCategory.initial(Color color) =>
      ShoppingListFormCategory(
        color: color,
        saveFailureOrSuccessOption: none(),
      );

  ShoppingListFormCategory copyWith({
    String? name,
    Color? color,
    bool? isValidForm,
    Option<Either<GeneralFailure, Category>>? saveFailureOrSuccessOption,
  }) {
    return ShoppingListFormCategory(
      name: name ?? this.name,
      color: color ?? this.color,
      isValidForm: isValidForm ?? this.isValidForm,
      saveFailureOrSuccessOption:
          saveFailureOrSuccessOption ?? this.saveFailureOrSuccessOption,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShoppingListFormCategory &&
        other.name == name &&
        other.color == color &&
        other.isValidForm == isValidForm &&
        other.saveFailureOrSuccessOption == saveFailureOrSuccessOption;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        color.hashCode ^
        isValidForm.hashCode ^
        saveFailureOrSuccessOption.hashCode;
  }
}

class ShoppingListFormItem extends ShoppingListFormState {
  final String? name;
  final String? imageUrl;
  final String? imageName;
  final Category? category;
  final File? file;
  final Option<GeneralFailure> filePickFailure;
  final Option<GeneralFailure> fileUploadFailure;
  final Option<Either<GeneralFailure, ShoppingItem>> saveFailureOrSuccessOption;
  final bool isValidForm;

  const ShoppingListFormItem({
    this.name,
    this.imageUrl,
    this.imageName,
    this.category,
    this.file,
    required this.filePickFailure,
    required this.fileUploadFailure,
    required this.saveFailureOrSuccessOption,
    this.isValidForm = false,
  });

  factory ShoppingListFormItem.initial() => ShoppingListFormItem(
        filePickFailure: none(),
        fileUploadFailure: none(),
        saveFailureOrSuccessOption: none(),
      );

  ShoppingListFormItem copyWith({
    String? name,
    String? imageUrl,
    String? imageName,
    Category? category,
    File? file,
    Option<GeneralFailure>? filePickFailure,
    Option<GeneralFailure>? fileUploadFailure,
    Option<Either<GeneralFailure, ShoppingItem>>? saveFailureOrSuccessOption,
    bool? isValidForm,
  }) {
    return ShoppingListFormItem(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      imageName: imageName ?? this.imageName,
      category: category ?? this.category,
      file: file ?? this.file,
      filePickFailure: filePickFailure ?? this.filePickFailure,
      fileUploadFailure: fileUploadFailure ?? this.fileUploadFailure,
      saveFailureOrSuccessOption:
          saveFailureOrSuccessOption ?? this.saveFailureOrSuccessOption,
      isValidForm: isValidForm ?? this.isValidForm,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShoppingListFormItem &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.imageName == imageName &&
        other.category == category &&
        other.file == file &&
        other.filePickFailure == filePickFailure &&
        other.fileUploadFailure == fileUploadFailure &&
        other.saveFailureOrSuccessOption == saveFailureOrSuccessOption &&
        other.isValidForm == isValidForm;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        imageUrl.hashCode ^
        imageName.hashCode ^
        category.hashCode ^
        file.hashCode ^
        filePickFailure.hashCode ^
        fileUploadFailure.hashCode ^
        saveFailureOrSuccessOption.hashCode ^
        isValidForm.hashCode;
  }
}
