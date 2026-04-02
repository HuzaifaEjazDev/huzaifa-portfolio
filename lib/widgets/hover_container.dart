import 'package:flutter/material.dart';

class HoverContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool translateY;

  const HoverContainer({
    super.key,
    required this.child,
    this.onTap,
    this.translateY = false,
  });

  @override
  State<HoverContainer> createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()
            ..scale(_isHovered ? 1.02 : 1.0)
            ..translate(0.0, (_isHovered && widget.translateY) ? -8.0 : 0.0),
          child: widget.child,
        ),
      ),
    );
  }
}
