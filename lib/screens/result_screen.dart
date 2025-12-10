import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final double bmi = args['bmi'];
    final String category = args['category'];
    final String interpretation = args['interpretation'];

    Color badgeColor;
    if (bmi < 18.5)
      badgeColor = Colors.orange;
    else if (bmi < 25)
      badgeColor = Colors.green;
    else if (bmi < 30)
      badgeColor = Colors.amber;
    else
      badgeColor = Colors.red;

    return Scaffold(
      appBar: AppBar(title: const Text('Hasil BMI')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 28, horizontal: 20),
                      child: Column(
                        children: [
                          Text(category,
                              style: TextStyle(
                                  color: badgeColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(height: 8),
                          Text(bmi.toStringAsFixed(1),
                              style: const TextStyle(
                                  fontSize: 64, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 12),
                          Text(interpretation, textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.chevron_left),
                    label: const Text('Kembali'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
