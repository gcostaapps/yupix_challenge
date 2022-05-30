import 'dart:io';

import 'package:dependencies_core/dependencies_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../domain/error_data.dart';
import '../../domain/general_failure.dart';

abstract class IStorageService {
  Future<Either<GeneralFailure, Map<String, String>>> saveFile(File file);
  Future<Either<GeneralFailure, Unit>> deleteFile(String fileName);
}

class FirebaseStorageService implements IStorageService {
  FirebaseStorage firebaseStorage;

  FirebaseStorageService(this.firebaseStorage);

  @override
  Future<Either<GeneralFailure, Unit>> deleteFile(String fileName) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final fileRef = storageRef.child('files/$fileName');
      await fileRef.delete();
      return const Right(unit);
    } catch (e, stack) {
      return Left(GeneralFailure(ErrorData('deleteFile', e, stack)));
    }
  }

  @override
  Future<Either<GeneralFailure, Map<String, String>>> saveFile(
      File file) async {
    try {
      final name = file.path.substring(file.path.lastIndexOf('/') + 1);
      final timestamp = DateTime.now().microsecondsSinceEpoch;
      final fileName = '$timestamp-$name';
      final storageRef = FirebaseStorage.instance.ref();
      final fileRef = storageRef.child('files/$fileName');
      await fileRef.putFile(file);
      final url = await fileRef.getDownloadURL();
      return Right({fileName: url});
    } catch (e, stack) {
      return Left(GeneralFailure(ErrorData('saveFile', e, stack)));
    }
  }
}

class DesktopStorageService implements IStorageService {
  @override
  Future<Either<GeneralFailure, Unit>> deleteFile(String filePath) async {
    return Left(GeneralFailure(ErrorData('deleteFile', 'error')));
  }

  @override
  Future<Either<GeneralFailure, Map<String, String>>> saveFile(
      File file) async {
    return Left(GeneralFailure(ErrorData('saveFile', 'error')));
  }
}
