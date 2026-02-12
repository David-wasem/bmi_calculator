import 'package:bmi_calculator/model/BMI_model.dart';
import 'package:bmi_calculator/ui/history.dart';

void pushing(BMIModel tile) {
  HistoryPage.tiles[HistoryPage.lastIndex] = tile;
  HistoryPage.lastIndex++;
}
