import 'package:bmi_calculator/widgets/custom_history_item.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  static int lastIndex = 0;
  static Map<int, Map<String, dynamic>> tiles = {};
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: HistoryPage.tiles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: customHistoryItem(
            item: HistoryPage.tiles[index]!,
            index: index,
          ),
        );
      },
    );
  }
}
