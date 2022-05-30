import 'package:flutter/material.dart';

import '../../design_system.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.isWarning = false,
    this.confirmIcon = Icons.check,
    this.maxWidth = 800,
  }) : super(key: key);

  final String title;
  final String message;
  final Function(BuildContext) onConfirm;
  final bool isWarning;
  final IconData confirmIcon;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Material(
        child: SizedBox(
          key: const ValueKey('CustomDialog'),
          width: MediaQuery.of(context).size.width - 32 >= maxWidth
              ? maxWidth
              : MediaQuery.of(context).size.width - 32,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: context.textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isWarning
                          ? context.colorScheme.error
                          : context.colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Icon(
                              Icons.close,
                              color: context.colorScheme.onBackground,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          key: const ValueKey('CustomDialogConfirmButton'),
                          onTap: () => onConfirm(context),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Icon(
                              isWarning
                                  ? Icons.delete_outline_rounded
                                  : confirmIcon,
                              color: isWarning
                                  ? context.colorScheme.error
                                  : context.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
