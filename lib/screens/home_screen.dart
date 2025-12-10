import 'package:flutter/material.dart';
import '../utils/bmi_calculator.dart';
import '../routes.dart';
import '../widgets/height_slider.dart';
import '../widgets/counter_card.dart';
import '../widgets/gender_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height = 170;
  int _weight = 65;
  int _age = 25;
  String _gender = 'Male';

  void _calculate() {
    final calculator =
        BmiCalculator(heightCm: _height, weightKg: _weight.toDouble());
    final bmi = calculator.calculate();
    final cat = calculator.category(bmi);
    final interp = calculator.interpretation(bmi);

    Navigator.pushNamed(context, Routes.result, arguments: {
      'bmi': bmi,
      'category': cat,
      'interpretation': interp,
    });
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('BMI Calculator',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.info_outline)),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Expanded(
                    child: isWide ? _buildWideLayout() : _buildNarrowLayout(),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _calculate,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14))),
                      child: const Text('Hitung BMI',
                          style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      children: [
        // left column
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: GenderTile(
                    gender: 'Male',
                    selected: _gender == 'Male',
                    onTap: () => setState(() => _gender = 'Male'),
                  )),
                  const SizedBox(width: 12),
                  Expanded(
                      child: GenderTile(
                    gender: 'Female',
                    selected: _gender == 'Female',
                    onTap: () => setState(() => _gender = 'Female'),
                  )),
                ],
              ),
              const SizedBox(height: 12),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text('Height',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      HeightSlider(
                          height: _height,
                          onChanged: (v) => setState(() => _height = v)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),

        // right column
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: CounterCard(
                          title: 'Weight (kg)',
                          value: _weight,
                          onChanged: (v) => setState(() => _weight = v))),
                  const SizedBox(width: 12),
                  Expanded(
                      child: CounterCard(
                          title: 'Age',
                          value: _age,
                          onChanged: (v) => setState(() => _age = v))),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(child: _decorativeCard()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: GenderTile(
                gender: 'Male',
                selected: _gender == 'Male',
                onTap: () => setState(() => _gender = 'Male'),
              )),
              const SizedBox(width: 12),
              Expanded(
                  child: GenderTile(
                gender: 'Female',
                selected: _gender == 'Female',
                onTap: () => setState(() => _gender = 'Female'),
              )),
            ],
          ),
          const SizedBox(height: 12),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text('Height',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  HeightSlider(
                      height: _height,
                      onChanged: (v) => setState(() => _height = v)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                  child: CounterCard(
                      title: 'Weight (kg)',
                      value: _weight,
                      onChanged: (v) => setState(() => _weight = v))),
              const SizedBox(width: 12),
              Expanded(
                  child: CounterCard(
                      title: 'Age',
                      value: _age,
                      onChanged: (v) => setState(() => _age = v))),
            ],
          ),
          const SizedBox(height: 12),
          _decorativeCard(),
        ],
      ),
    );
  }

  Widget _decorativeCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Tips Kesehatan',
                style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Text(
                '• Minum cukup air setiap hari\n• Konsumsi sayur dan protein seimbang\n• Aktif bergerak minimal 30 menit/hari'),
          ],
        ),
      ),
    );
  }
}
