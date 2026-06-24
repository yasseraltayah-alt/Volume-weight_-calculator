class CalculationResult {
  final String tankId;
  final String tankName;
  final String materialCategory;
  final double emptyHeight; // Height of empty space
  final double filledHeight; // Height of filled space
  final double filledPercentage;
  final double volumeM3; // m³
  final double volumeLiters; // Liters
  final double weightKg; // kg
  final double weightTons; // metric tons
  final DateTime calculatedAt;

  CalculationResult({
    required this.tankId,
    required this.tankName,
    required this.materialCategory,
    required this.emptyHeight,
    required this.filledHeight,
    required this.filledPercentage,
    required this.volumeM3,
    required this.volumeLiters,
    required this.weightKg,
    required this.weightTons,
    required this.calculatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'tankId': tankId,
      'tankName': tankName,
      'materialCategory': materialCategory,
      'emptyHeight': emptyHeight,
      'filledHeight': filledHeight,
      'filledPercentage': filledPercentage,
      'volumeM3': volumeM3,
      'volumeLiters': volumeLiters,
      'weightKg': weightKg,
      'weightTons': weightTons,
      'calculatedAt': calculatedAt.toIso8601String(),
    };
  }
}
