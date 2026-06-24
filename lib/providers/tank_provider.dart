import 'package:flutter/material.dart';
import '../models/tank.dart';
import '../models/calculation_result.dart';
import '../services/tank_data_service.dart';
import '../services/calculator_service.dart';

class TankProvider with ChangeNotifier {
  List<Tank> _allTanks = [];
  Map<String, CalculationResult> _results = {};
  String _selectedCategory = 'Mazut';

  TankProvider() {
    _allTanks = TankDataService.getAllTanks();
  }

  List<Tank> get allTanks => _allTanks;

  List<Tank> get filteredTanks {
    return _allTanks
        .where((tank) => tank.category == _selectedCategory)
        .toList();
  }

  String get selectedCategory => _selectedCategory;

  Map<String, CalculationResult> get results => _results;

  List<CalculationResult> get resultsList => _results.values.toList();

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void calculateForTank(Tank tank, double emptyMeasurement) {
    final result = CalculatorService.calculate(
      tank: tank,
      emptyMeasurement: emptyMeasurement,
      measurementType: tank.shape == 'horizontal_cylinder' ? 'diameter' : 'height',
    );
    _results[tank.id] = result;
    notifyListeners();
  }

  void removeResult(String tankId) {
    _results.remove(tankId);
    notifyListeners();
  }

  void clearAllResults() {
    _results.clear();
    notifyListeners();
  }

  Map<String, double> getSummaryByCategory() {
    final summary = <String, double>{};
    for (var result in _results.values) {
      if (!summary.containsKey(result.materialCategory)) {
        summary[result.materialCategory] = 0;
      }
      summary[result.materialCategory] = summary[result.materialCategory]! + result.weightTons;
    }
    return summary;
  }

  double getTotalWeight() {
    return _results.values.fold(0, (sum, result) => sum + result.weightTons);
  }

  double getTotalVolume() {
    return _results.values.fold(0, (sum, result) => sum + result.volumeM3);
  }
}
