import 'package:bmi_calculator/model/BMI_model.dart';
import 'package:bmi_calculator/widgets/custom_history_item.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  static int lastIndex = 0;
  static Map<int, BMIModel> tiles = {};
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
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("History"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height: ${HistoryPage.tiles[index]!.height} cm",
                        ),
                        Text(
                          "Weight: ${HistoryPage.tiles[index]!.weight} kg",
                        ),
                        Text("Age: ${HistoryPage.tiles[index]!.age} years"),
                        Text("Gender: ${HistoryPage.tiles[index]!.gender}"),
                        Text("BMI: ${HistoryPage.tiles[index]!.bmi}"),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text("Close"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: customHistoryItem(
              item: HistoryPage.tiles[index]!,
              index: index,
            ),
          ),
        );
      },
    );
  }
}
