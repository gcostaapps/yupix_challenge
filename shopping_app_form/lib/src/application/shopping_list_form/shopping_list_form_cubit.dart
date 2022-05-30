import 'dart:io';

import 'package:dependencies_core/dependencies_core.dart';
import 'package:flutter/painting.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

import 'package:design_system/design_system.dart';

part 'shopping_list_form_state.dart';

class ShoppingListFormCubit extends Cubit<ShoppingListFormState> {
  ShoppingListFormCubit(
    this.imagePickerService,
    this.storageService,
    this.categoryRepository,
    this.shoppingItemRepository,
  ) : super(ShoppingListFormItem.initial());

  final IImagePickerService imagePickerService;
  final IStorageService storageService;
  final ICategoryRepository categoryRepository;
  final IShoppingItemRepository shoppingItemRepository;

  void changeToCategoryForm() =>
      emit(ShoppingListFormCategory.initial(AppBaseColors.blue));

  void changeCategoryColor(Color color) =>
      emit((state as ShoppingListFormCategory).copyWith(color: color));

  void changeCategoryName(String name) =>
      emit((state as ShoppingListFormCategory).copyWith(
        name: name,
        isValidForm: name.trim().isNotEmpty,
      ));

  Future<void> saveCategory() async {
    final categoryState = (state as ShoppingListFormCategory);
    emit(categoryState.copyWith(saveFailureOrSuccessOption: none()));
    if (categoryState.isValidForm) {
      final resultOrFailure = await categoryRepository.addCategory(Category(
        name: categoryState.name!,
        color: categoryState.color,
      ));

      final result = resultOrFailure.fold((l) => l, (r) => r);

      if (resultOrFailure.isLeft()) {
        emit(categoryState.copyWith(
          saveFailureOrSuccessOption: some(Left(result as GeneralFailure)),
        ));
        return;
      }

      emit(ShoppingListFormCategory.initial(AppBaseColors.blue).copyWith(
        saveFailureOrSuccessOption: some(Right(result as Category)),
      ));
    }
  }

  void changeToItemForm() => emit(ShoppingListFormItem.initial());

  void changeItemName(String name) {
    emit((state as ShoppingListFormItem).copyWith(name: name));
    checkItemFormValid();
  }

  void changeItemCategory(Category category) {
    emit((state as ShoppingListFormItem).copyWith(category: category));
    checkItemFormValid();
  }

  Future<void> getItemImage() async {
    emit((state as ShoppingListFormItem).copyWith(filePickFailure: none()));
    final resultOrFailure = await imagePickerService.pickImage();
    final result = resultOrFailure.fold((l) => l, (r) => r);

    if (resultOrFailure.isLeft()) {
      emit((state as ShoppingListFormItem).copyWith(
        filePickFailure: some(result as GeneralFailure),
      ));
      return;
    }
    if (resultOrFailure.isRight() && result != null) {
      emit((state as ShoppingListFormItem).copyWith(file: result as File));
      checkItemFormValid();
    }
  }

  Future<void> saveShoppingItem(int itemPosition) async {
    final itemState = (state as ShoppingListFormItem);
    if (itemState.isValidForm) {
      emit(itemState.copyWith(
        filePickFailure: none(),
        saveFailureOrSuccessOption: none(),
        fileUploadFailure: none(),
      ));

      final fileMap = await _uploadFile();
      if (fileMap == null) return;

      final resultOrFailure = await shoppingItemRepository.addShoppingItem(
        ShoppingItem(
          name: itemState.name!,
          categoryId: itemState.category!.id!,
          imageUrl: fileMap.values.first,
          imageName: fileMap.keys.first,
          isFavorite: false,
          position: itemPosition,
        ),
      );
      final result = resultOrFailure.fold((l) => l, (r) => r);

      if (resultOrFailure.isLeft()) {
        emit(itemState.copyWith(
          fileUploadFailure: some(result as GeneralFailure),
        ));
      }

      emit(ShoppingListFormItem.initial().copyWith(
        saveFailureOrSuccessOption: some(Right(result as ShoppingItem)),
      ));
    }
  }

  Future<Map<String, String>?> _uploadFile() async {
    final itemState = (state as ShoppingListFormItem);
    emit(itemState.copyWith(fileUploadFailure: none()));
    final resultOrFailure = await storageService.saveFile(itemState.file!);
    final result = resultOrFailure.fold((l) => l, (r) => r);

    if (resultOrFailure.isLeft()) {
      emit(itemState.copyWith(
        fileUploadFailure: some(result as GeneralFailure),
      ));
      return null;
    }
    return result as Map<String, String>;
  }

  void checkItemFormValid() {
    final itemState = state as ShoppingListFormItem;
    final isValid = itemState.category != null &&
        itemState.name != null &&
        itemState.name!.trim().isNotEmpty &&
        itemState.file != null;
    emit(itemState.copyWith(isValidForm: isValid));
  }
}
