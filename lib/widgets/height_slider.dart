import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;
  const HeightSlider(
      {super.key, required this.height, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${height.toStringAsFixed(0)} cm',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        Slider(
          value: height,
          min: 100,
          max: 220,
          divisions: 120,
          label: '${height.toStringAsFixed(0)} cm',
          onChanged: onChanged,
        )
      ],
    );
  }
}
