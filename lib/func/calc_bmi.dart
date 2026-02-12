import 'package:flutter/material.dart';

double calcBMI(int height, int weight) {
  double heightInMeters = height / 100;
  double result = weight / (heightInMeters * heightInMeters);
  return double.parse(result.toStringAsFixed(2));
}

Map<String,Color> getBMICategory(double bmi) {
  if (bmi < 18.5) {
    return {'Underweight':Colors.blue};
  } else if (bmi < 25) {
    return {'Normal weight':Colors.green};
  } else if (bmi < 30) {
    return {'Overweight':Colors.orange};
  } else {
    return {'Obesity':Colors.red};
  }
}
