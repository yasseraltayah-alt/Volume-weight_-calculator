import 'dart:math';
import '../models/tank.dart';
import '../models/calculation_result.dart';

class CalculatorService {
  // Calculate filled volume for vertical cylinder
  static double calculateVerticalCylinderFilledVolume(
    double diameter,
    double height,
    double emptyHeight,
  ) {
    if (emptyHeight < 0 || emptyHeight > height) {
      return 0;
    }
    final filledHeight = height - emptyHeight;
    final radius = diameter / 2;
    return pi * radius * radius * filledHeight;
  }

  // Calculate filled volume for horizontal cylinder
  static double calculateHorizontalCylinderFilledVolume(
    double diameter,
    double length,
    double emptyDiameter,
  ) {
    if (emptyDiameter < 0 || emptyDiameter > diameter) {
      return 0;
    }
    final radius = diameter / 2;
    final h = radius - (emptyDiameter / 2); // Height of liquid from bottom

    if (h <= 0) return 0;
    if (h >= diameter) return pi * radius * radius * length;

    // Segment area calculation
    final theta = 2 * acos((radius - h) / radius);
    final segmentArea = (radius * radius * (theta - sin(theta))) / 2;

    return segmentArea * length;
  }

  // Calculate filled volume for rectangular tank
  static double calculateRectangularFilledVolume(
    double length,
    double width,
    double height,
    double emptyHeight,
  ) {
    if (emptyHeight < 0 || emptyHeight > height) {
      return 0;
    }
    final filledHeight = height - emptyHeight;
    return length * width * filledHeight;
  }

  // Main calculation function
  static CalculationResult calculate({
    required Tank tank,
    required double emptyMeasurement,
    required String measurementType, // 'height' or 'diameter'
  }) {
    double volumeM3 = 0;
    double filledPercentage = 0;
    double filledHeight = 0;

    if (tank.shape == 'vertical_cylinder') {
      volumeM3 = calculateVerticalCylinderFilledVolume(
        tank.diameter,
        tank.height,
        emptyMeasurement,
      );
      filledHeight = tank.height - emptyMeasurement;
      filledPercentage = (filledHeight / tank.height) * 100;
    } else if (tank.shape == 'horizontal_cylinder') {
      volumeM3 = calculateHorizontalCylinderFilledVolume(
        tank.diameter,
        tank.length,
        emptyMeasurement,
      );
      filledPercentage = ((tank.diameter - emptyMeasurement) / tank.diameter) * 100;
      filledHeight = tank.diameter - emptyMeasurement;
    } else if (tank.shape == 'rectangular') {
      volumeM3 = calculateRectangularFilledVolume(
        tank.length2,
        tank.width,
        tank.depth,
        emptyMeasurement,
      );
      filledHeight = tank.depth - emptyMeasurement;
      filledPercentage = (filledHeight / tank.depth) * 100;
    }

    // Convert to liters
    final volumeLiters = volumeM3 * 1000;

    // Calculate weight
    final density = tank.getMaterialDensity();
    final weightKg = volumeM3 * density * 1000;
    final weightTons = weightKg / 1000;

    return CalculationResult(
      tankId: tank.id,
      tankName: tank.name,
      materialCategory: tank.category,
      emptyHeight: emptyMeasurement,
      filledHeight: filledHeight,
      filledPercentage: filledPercentage.clamp(0, 100),
      volumeM3: volumeM3,
      volumeLiters: volumeLiters,
      weightKg: weightKg,
      weightTons: weightTons,
      calculatedAt: DateTime.now(),
    );
  }
}
