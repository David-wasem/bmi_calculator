import 'package:bmi_calculator/func/calc_bmi.dart';
import 'package:bmi_calculator/func/pushing.dart';
import 'package:bmi_calculator/ui/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedGender;
  double? age;
  double? bmi;
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'male';
                      });
                    },
                    child: Container(
                      width: 170,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selectedGender == 'male'
                            ? Colors.deepPurple[400]
                            : Colors.deepPurple[200],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Male",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: selectedGender == 'male'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            Icon(Icons.male, color: Colors.white, size: 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'female';
                      });
                    },
                    child: Container(
                      width: 170,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selectedGender == 'female'
                            ? Colors.deepPurple[400]
                            : Colors.deepPurple[200],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Female",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: selectedGender == 'female'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            Icon(Icons.female, color: Colors.white, size: 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.deepPurple[200]!),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Age",
                      style: TextStyle(
                        color: Color.fromARGB(255, 59, 59, 59),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      (age ?? 18).round().toString(),
                      style: TextStyle(
                        color: Colors.deepPurple[200],
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        inactiveTrackColor: Color(0xff8d8e98),
                        activeTrackColor: Color.fromARGB(255, 59, 59, 59),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 20.0,
                        ),
                        thumbColor: Color.fromARGB(255, 59, 59, 59),
                        overlayColor: Color.fromARGB(41, 209, 209, 209),
                      ),
                      child: Slider(
                        value: age ?? 18,
                        min: 1,
                        max: 100,
                        onChanged: (double newValue) {
                          setState(() {
                            age = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.deepPurple[200]!),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.height,
                            color: const Color.fromARGB(255, 59, 59, 59),
                            size: 40,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Height (cm)",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 59, 59, 59),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter height";
                              }
                              final height = int.tryParse(value);
                              if (height == null || height <= 0) {
                                return "Height must be greater than 0";
                              }
                              return null;
                            },
                            controller: heightController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 59, 59, 59),
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              hintText: "0",
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 59, 59, 59),
                                fontSize: 32,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.deepPurple[200]!),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.scale,
                            color: const Color.fromARGB(255, 59, 59, 59),
                            size: 40,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Weight (kg)",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 59, 59, 59),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter weight";
                              }
                              final weight = int.tryParse(value);
                              if (weight == null || weight <= 0) {
                                return "Weight must be greater than 0";
                              }
                              return null;
                            },
                            controller: weightController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 59, 59, 59),
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              hintText: "0",
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 59, 59, 59),
                                fontSize: 32,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (selectedGender == null) {
                    SnackBar sn = SnackBar(
                      content: Text("Please select gender"),
                      duration: Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(sn);
                  } else {
                    bmi = calcBMI(
                      double.parse(heightController.text),
                      double.parse(weightController.text),
                    );
                    setState(() {
                      ProfilePage.bmi = bmi;
                    });
                    pushing({
                      'bmi': bmi,
                      'date': DateTime.now(),
                      'gender': selectedGender!,
                    });
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("BMI Result"),
                          content: Text("BMI: $bmi"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // close keyboard first
                                Navigator.pop(context);
                                FocusScope.of(context).unfocus();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[400],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Calculate"),
            ),
          ],
        ),
      ),
    );
  }
}
