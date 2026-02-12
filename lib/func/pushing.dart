import 'package:bmi_calculator/ui/history.dart';

void pushing(Map<String,dynamic> tile) {
  HistoryPage.tiles[HistoryPage.lastIndex] = tile;
  HistoryPage.lastIndex++;
}
