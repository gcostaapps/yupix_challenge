import 'package:flutter/material.dart';

import '../theme/theme.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    Key? key,
    this.hint,
    this.controller,
    this.onChanged,
    this.iconData,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  final String? hint;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final IconData? iconData;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: AppColors(context.isLightMode).textColor500,
      ),
    );
    return TextField(
      decoration: InputDecoration(
        fillColor: AppColors(context.isLightMode).textColor600,
        filled: true,
        prefixIcon: iconData != null ? Icon(iconData!) : null,
        hintText: hint,
        hintStyle: context.textTheme.bodyText2,
        enabledBorder: border,
        border: border,
      ),
      controller: controller,
      keyboardType: inputType,
      onChanged: onChanged,
    );
  }
}
