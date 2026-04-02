import 'package:flutter/material.dart';

class BackgroundOrbs extends StatelessWidget {
  const BackgroundOrbs({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Primary Blue Orb
        Positioned(
          top: -200,
          left: -200,
          child: _orbContainer(
            color: const Color(0xFF02569B).withValues(alpha: 0.25),
            size: 600,
          ),
        ),
        
        // Purple-ish Orb
        Positioned(
          bottom: -150,
          right: -100,
          child: _orbContainer(
            color: const Color(0xFF7C3AED).withValues(alpha: 0.2),
            size: 500,
          ),
        ),
        
        // Cyan-ish Orb
        Positioned(
          top: 200,
          right: -150,
          child: _orbContainer(
            color: const Color(0xFF06B6D4).withValues(alpha: 0.18),
            size: 400,
          ),
        ),
      ],
    );
  }

  Widget _orbContainer({required Color color, required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color,
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
