import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;
  double bmi;
  CalculatorBrain(this.height, this.weight);

  String bmiResult() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String bmiStatus() {
    if (bmi >= 25) {
      return "Overweight";
    } else if (bmi > 18.5) {
      return "Normal";
    } else
      return "UnderWeight";
  }
}
