double calcBMI(double height, double weight) {
  double heightInMeters = height / 100;
  double result = weight / (heightInMeters * heightInMeters);
  return double.parse(result.toStringAsFixed(2));
}

String getBMICategory(double bmi) {
  if (bmi < 18.5) {
    return 'Underweight';
  } else if (bmi < 25) {
    return 'Normal weight';
  } else if (bmi < 30) {
    return 'Overweight';
  } else {
    return 'Obesity';
  }
}
