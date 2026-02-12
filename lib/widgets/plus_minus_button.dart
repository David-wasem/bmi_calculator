import 'package:flutter/material.dart';

class PlusMinusButton extends StatelessWidget {
  const PlusMinusButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 32),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.deepPurple[400]),
        overlayColor: WidgetStatePropertyAll(Colors.deepPurple[200]),
      ),
    );
  }
}
