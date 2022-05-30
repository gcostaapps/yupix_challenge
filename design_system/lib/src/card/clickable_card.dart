import 'package:flutter/material.dart';

class ClickableCard extends StatefulWidget {
  const ClickableCard({
    Key? key,
    this.borderRadius,
    this.onTap,
    this.shadowColor,
    required this.child,
  }) : super(key: key);

  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final Color? shadowColor;

  final Widget child;

  @override
  State<ClickableCard> createState() => _ClickableCardState();
}

class _ClickableCardState extends State<ClickableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final shadowColorWithOpacity = widget.shadowColor != null
        ? widget.shadowColor!.withOpacity(
            theme.brightness == Brightness.light ? 0.3 : 0.05,
          )
        : null;

    if (widget.onTap == null) {
      return Card(
        color: widget.onTap != null
            ? widget.shadowColor ?? theme.cardColor
            : theme.disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              widget.borderRadius ?? const BorderRadius.all(Radius.circular(4)),
        ),
        elevation: 20,
        shadowColor: shadowColorWithOpacity,
        child: widget.child,
      );
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => _controller.forward(),
        onTapUp: (_) => _controller.reverse(),
        onTapCancel: () => _controller.reverse(),
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: 1 - 0.03 * _controller.value,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: widget.borderRadius ??
                      const BorderRadius.all(Radius.circular(4)),
                ),
                elevation: 16 - 8 * _controller.value,
                shadowColor: shadowColorWithOpacity,
                child: child,
              ),
            );
          },
          child: widget.child,
        ),
      ),
    );
  }
}
