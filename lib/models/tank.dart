class Tank {
  final String id;
  final String name;
  final String category; // Mazut, Oil, Water, Bitumen
  final String shape; // Horizontal, Vertical, Rectangular
  final double diameter; // For cylindrical tanks
  final double length; // For horizontal tanks
  final double height; // For vertical tanks
  final double width; // For rectangular tanks
  final double depth; // For rectangular tanks
  final double length2; // For rectangular tanks (second length)
  final String description;
  final String icon;

  Tank({
    required this.id,
    required this.name,
    required this.category,
    required this.shape,
    this.diameter = 0,
    this.length = 0,
    this.height = 0,
    this.width = 0,
    this.depth = 0,
    this.length2 = 0,
    required this.description,
    required this.icon,
  });

  // Calculate total volume based on shape
  double calculateTotalVolume() {
    if (shape == 'vertical_cylinder') {
      // Volume = π * r² * h
      final radius = diameter / 2;
      return 3.14159 * radius * radius * height;
    } else if (shape == 'horizontal_cylinder') {
      // For horizontal cylinder: approximated calculation
      final radius = diameter / 2;
      return 3.14159 * radius * radius * length;
    } else if (shape == 'rectangular') {
      // Volume = length * width * height
      return length2 * width * depth;
    }
    return 0;
  }

  // Get material density
  double getMaterialDensity() {
    switch (category.toLowerCase()) {
      case 'mazut':
        return 0.85;
      case 'oil':
        return 0.90;
      case 'water':
        return 1.00;
      case 'bitumen':
        return 1.10;
      case 'fuel':
        return 0.96;
      default:
        return 1.0;
    }
  }
}
