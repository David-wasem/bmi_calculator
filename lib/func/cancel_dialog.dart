import 'package:flutter/material.dart';

void cancelDialog(BuildContext context, int flag, Widget widget) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Logout"),
        content: Text("Do you sure to Logout?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => widget),
              );
            },
            child: Text("Yes"),
          ),
          ElevatedButton(
            onPressed: () {
              if (flag == 1) {
                Navigator.pop(context);
              } else if (flag == 2) {
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            child: Text("Cancel"),
          ),
        ],
        backgroundColor: Colors.white,
      );
    },
  );
}
