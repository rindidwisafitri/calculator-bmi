import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String title;
  final int value;
  final ValueChanged<int> onChanged;

  const CounterCard({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(value.toString(),
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => onChanged(value - 1),
                    icon: const Icon(Icons.remove_circle_outline)),
                const SizedBox(width: 8),
                IconButton(
                    onPressed: () => onChanged(value + 1),
                    icon: const Icon(Icons.add_circle_outline)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
