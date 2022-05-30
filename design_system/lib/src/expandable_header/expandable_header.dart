import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ExpandableHeader extends StatefulWidget {
  const ExpandableHeader({
    Key? key,
    required this.text,
    required this.length,
    required this.color,
    required this.child,
    required this.isExpanded,
    required this.onExpandedChanged,
  }) : super(key: key);

  final String text;
  final int length;
  final MaterialColor color;
  final Widget child;
  final bool isExpanded;
  final ValueChanged<bool> onExpandedChanged;

  @override
  State<ExpandableHeader> createState() => _ExpandableHeaderState();
}

class _ExpandableHeaderState extends State<ExpandableHeader>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _arrowAnimation;

  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _arrowAnimation = Tween<double>(begin: 0, end: -0.5).animate(_controller);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isExpanded) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double headerHeight = 56;
    const double childPadding = 16;

    final color = context.isLightMode ? widget.color : widget.color.shade300;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: color.withOpacity(0.2)),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            child: isExpanded
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(
                      childPadding,
                      headerHeight + childPadding,
                      childPadding,
                      childPadding,
                    ),
                    child: widget.child,
                  )
                : const SizedBox(
                    height: headerHeight,
                    width: double.infinity,
                  ),
          ),
        ),
        GestureDetector(
          onTap: () {
            isExpanded ? _controller.reverse() : _controller.forward();
            widget.onExpandedChanged(!isExpanded);
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            height: headerHeight,
            decoration: BoxDecoration(
              gradient: AppBaseColors.getLinearGradient(color),
              boxShadow: AppColors(context.isLightMode).getShadow(color),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          widget.text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.bodyText1!.copyWith(
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '(${widget.length})',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodyText1!.copyWith(
                          color: context.colorScheme.onPrimary.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                RotationTransition(
                  turns: _arrowAnimation,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
