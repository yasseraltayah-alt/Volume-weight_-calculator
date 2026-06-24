class Material {
  final String id;
  final String name;
  final String category; // Mazut, Oil, Water, Bitumen
  final double density; // kg/m³
  final String color;

  Material({
    required this.id,
    required this.name,
    required this.category,
    required this.density,
    required this.color,
  });
}
