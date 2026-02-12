class BMIModel {
  final int? height;
  final int? weight;
  final int? age;
  final String? gender;
  final double? bmi;
  final DateTime? date;

  BMIModel({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.bmi,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'weight': weight,
      'age': age,
      'gender': gender,
      'bmi': bmi,
      'date': date,
    };
  }

  factory BMIModel.fromJson(Map<String, dynamic> json) {
    return BMIModel(
      height: json['height'],
      weight: json['weight'],
      age: json['age'],
      gender: json['gender'],
      bmi: json['bmi'],
      date: json['date'],
    );
  }
}
