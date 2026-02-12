import 'package:bmi_calculator/func/calc_bmi.dart';
import 'package:bmi_calculator/model/BMI_model.dart';
import 'package:flutter/material.dart';

Widget customHistoryItem({
  required BMIModel item,
  required int index,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.deepPurple[100],
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
      ],
    ),
    child: ListTile(
      leading: CircleAvatar(child: Text((index + 1).toString())),
      title: Text("BMI : ${item.bmi}"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Date : ${item.date!.year}/${item.date!.month}/${item.date!.day}"),
          Text(
            "Time : ${format24To12(item.date!.hour)}:${item.date!.minute}:${item.date!.second}",
          ),
        ],
      ),
      trailing: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: getBMICategory(item.bmi!).values.first,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(getBMICategory(item.bmi!).keys.first),
      ),
    ),
  );
}

int format24To12(int hour) {
  if (hour > 12) {
    return hour - 12;
  }
  return hour;
}
