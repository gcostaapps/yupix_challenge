import 'package:flutter/material.dart';

class EmptyCategory extends StatelessWidget {
  const EmptyCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: const Text('Oops, no items here...'),
    );
  }
}
