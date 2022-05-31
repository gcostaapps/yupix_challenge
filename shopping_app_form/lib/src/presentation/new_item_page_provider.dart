import 'package:dependencies_core/dependencies_core.dart';
import 'package:flutter/material.dart';

import '../infrastructure/services/image_picker_service.dart';

class NewItemPageProvider extends StatelessWidget {
  const NewItemPageProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IImagePickerService>(
      create: (context) => ImagePickerService(),
      child: child,
    );
  }
}
