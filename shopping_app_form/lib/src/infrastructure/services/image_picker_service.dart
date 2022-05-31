import 'dart:io';

import 'package:dependencies_core/dependencies_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shopping_app_core/shopping_app_core.dart';

abstract class IImagePickerService {
  Future<Either<GeneralFailure, File?>> pickImage();
}

class ImagePickerService implements IImagePickerService {
  @override
  Future<Either<GeneralFailure, File?>> pickImage() async {
    try {
      final FilePickerResult? image = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        withReadStream: false,
        withData: true,
      );
      if (image != null) {
        return Right(File(image.files.first.path!));
      }
      return const Right(null);
    } catch (e, stack) {
      return Left(GeneralFailure(ErrorData('pickImage', e, stack)));
    }
  }
}
