import 'package:flutter/material.dart';

import '../theme/app_typography.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.subtitle2,
    );
  }
}
