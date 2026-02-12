import 'package:bmi_calculator/widgets/show_data.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final String email;
  static double? bmi;
  const ProfilePage({super.key, required this.username, required this.email});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            // Top purple section
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                color: Colors.deepPurple[300],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(170),
                  bottomRight: Radius.circular(170),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              // Data section
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: double.infinity, height: 240),
                  showData(
                    "First Name",
                    widget.username.split("@")[0],
                    Icons.person,
                  ),
                  showData("Email", widget.email, Icons.email),
                  showData(
                    "Last BMI",
                    ProfilePage.bmi?.toStringAsFixed(2) ?? "No BMI yet",
                    Icons.monitor_weight,
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      SnackBar sn = SnackBar(
                        content: Text("Try again later"),
                        duration: Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(sn);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 231, 95, 86),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: Text("Delete Account"),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Align(
            // circle avatar
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 133, 133, 133),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 150, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
