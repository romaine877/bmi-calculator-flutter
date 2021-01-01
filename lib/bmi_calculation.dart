import 'dart:math';

class BmiCalculator {
  BmiCalculator({this.height, this.weight});
  final int weight;
  final int height;

  double _bmi;

  String getResult() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultText() {
    if (_bmi >= 25) {
      return "OVERWEIGHT";
    } else if (_bmi > 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "NYAM TOO MUCH";
    } else if (_bmi > 18.5) {
      return "YOU GOOD";
    } else {
      return "NYAM MORE FOOD";
    }
  }
}
