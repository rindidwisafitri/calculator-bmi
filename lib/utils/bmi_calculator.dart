class BmiCalculator {
  final double heightCm;
  final double weightKg;

  BmiCalculator({required this.heightCm, required this.weightKg});

  double calculate() {
    final heightM = heightCm / 100.0;
    final bmi = weightKg / (heightM * heightM);
    return double.parse(bmi.toStringAsFixed(1));
  }

  String category(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  String interpretation(double bmi) {
    if (bmi < 18.5)
      return 'Kamu kurang berat badan — makan makanan bergizi dan konsultasi bila perlu.';
    if (bmi < 25) return 'Berat badanmu ideal — pertahankan pola hidup sehat!';
    if (bmi < 30)
      return 'Sedikit kelebihan berat — aktifkan olahraga dan atur pola makan.';
    return 'Tingkat obesitas — pertimbangkan konsultasi profesional.';
  }
}
