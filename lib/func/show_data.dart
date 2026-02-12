import 'package:flutter/material.dart';

Widget showData(String label, String value, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.deepPurple[300]!),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple[300]!),
        title: Text(label),
        subtitle: SelectableText(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    ),
  );
}

/**
 * TextField(
      readOnly: true,
      decoration: InputDecoration(
        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        labelText: label,
        hintText: value,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
 */
