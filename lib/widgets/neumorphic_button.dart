import 'package:flutter/material.dart';

class NeumorphicButton extends StatelessWidget {
  final Widget child;
  final double size;
  final VoidCallback onTap;

  const NeumorphicButton({
    super.key,
    required this.child,
    this.size = 60,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color baseColor = Theme.of(context).colorScheme.background;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            // shadow kiri atas
            BoxShadow(
              color: Colors.white.withOpacity(0.9),
              offset: const Offset(-4, -4),
              blurRadius: 8,
            ),
            // shadow kanan bawah
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(4, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
