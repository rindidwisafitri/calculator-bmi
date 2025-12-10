import 'package:flutter/material.dart';

class GenderTile extends StatelessWidget {
  final String gender;
  final bool selected;
  final VoidCallback onTap;

  const GenderTile(
      {super.key,
      required this.gender,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color =
        selected ? Theme.of(context).colorScheme.primary : Colors.white;
    final textColor = selected ? Colors.white : Colors.black87;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: selected
              ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.08), blurRadius: 10)
                ]
              : null,
        ),
        child: Column(
          children: [
            Icon(gender == 'Male' ? Icons.male : Icons.female,
                size: 48, color: textColor),
            const SizedBox(height: 8),
            Text(gender,
                style:
                    TextStyle(color: textColor, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
