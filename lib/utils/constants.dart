class AppConstants {
  static const String appName = 'حاسبة الحجوم والأوزان';
  static const String appSubtitle = 'Volume & Weight Calculator';

  // Material Densities (kg/m³)
  static const Map<String, double> materialDensities = {
    'Mazut': 0.85,
    'Oil': 0.90,
    'Water': 1.00,
    'Bitumen': 1.10,
    'Fuel': 0.96,
  };

  // Tank Categories
  static const List<String> tankCategories = [
    'Mazut',
    'Oil',
    'Water',
    'Bitumen',
    'Fuel'
  ];
}
