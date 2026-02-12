import 'package:bmi_calculator/func/cancel_dialog.dart';
import 'package:bmi_calculator/ui/history.dart';
import 'package:bmi_calculator/ui/home.dart';
import 'package:bmi_calculator/ui/login.dart';
import 'package:bmi_calculator/ui/profile.dart';
import 'package:flutter/material.dart';

class AppShellPage extends StatefulWidget {
  final String username;
  final String email;
  const AppShellPage({
    super.key,
    this.username = "Davidwasem8",
    this.email = "davidwasem8@gmail.com",
  });

  @override
  State<AppShellPage> createState() => _AppShellPageState();
}

class _AppShellPageState extends State<AppShellPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(),
      HistoryPage(),
      ProfilePage(username: widget.username, email: widget.email),
    ];
    final List<String> titles = ["BMI Calculator", "History", "Profile"];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(color: Colors.white, offset: Offset(0, 1), blurRadius: 4),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[300],
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.logout, color: Colors.black),
              onPressed: () {
                cancelDialog(context, 1, LoginPage());
              },
            ),
          ),
        ],
      ),
      body: pages[currentIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.username),
              accountEmail: Text(widget.email),
              currentAccountPicture: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/logo.png"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                currentIndex = 0;
                setState(() {});
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("History"),
              onTap: () {
                currentIndex = 1;
                setState(() {});
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                currentIndex = 2;
                setState(() {});
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                cancelDialog(context, 2, LoginPage());
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.deepPurple[300],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
