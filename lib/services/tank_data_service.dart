import '../models/tank.dart';

class TankDataService {
  static List<Tank> getAllTanks() {
    return [
      // Mazut Tanks
      Tank(
        id: 'mazut_1',
        name: 'خزان مازوت الكازية الأحمر',
        category: 'Mazut',
        shape: 'horizontal_cylinder',
        diameter: 3.4,
        length: 12,
        description: 'أسطواني أفقي - طول 12 م - قطر 3.4 م',
        icon: '🟠',
      ),
      Tank(
        id: 'mazut_2',
        name: 'خزان مازوت الكازية الفضي',
        category: 'Mazut',
        shape: 'horizontal_cylinder',
        diameter: 3.1,
        length: 7.4,
        description: 'أسطواني أفقي - طول 7.4 م - قطر 3.1 م',
        icon: '🟠',
      ),
      Tank(
        id: 'mazut_3',
        name: 'خزان مازوت غسيل الدارة',
        category: 'Mazut',
        shape: 'vertical_cylinder',
        diameter: 3,
        height: 3,
        description: 'أسطواني عمودي - ارتفاع 3 م - قطر 3 م',
        icon: '🟠',
      ),
      Tank(
        id: 'mazut_4',
        name: 'خزان مازوت الغلاية',
        category: 'Mazut',
        shape: 'vertical_cylinder',
        diameter: 3,
        height: 3,
        description: 'أسطواني عمودي - ارتفاع 3 م - قطر 3 م',
        icon: '🟠',
      ),
      Tank(
        id: 'mazut_5',
        name: 'خزان مازوت الفرن',
        category: 'Mazut',
        shape: 'vertical_cylinder',
        diameter: 3,
        height: 3,
        description: 'أسطواني عمودي - ارتفاع 3 م - قطر 3 م',
        icon: '🟠',
      ),
      Tank(
        id: 'mazut_6',
        name: 'خزان مازوت كور الجورة الشمالية',
        category: 'Mazut',
        shape: 'vertical_cylinder',
        diameter: 1,
        height: 1.25,
        description: 'أسطواني عمودي - ارتفاع 1.25 م - قطر 1 م',
        icon: '🟠',
      ),
      Tank(
        id: 'mazut_7',
        name: 'خزان مازوت كور جورة التسخين الأولية',
        category: 'Mazut',
        shape: 'vertical_cylinder',
        diameter: 1.7,
        height: 2,
        description: 'أسطواني عمودي - ارتفاع 2 م - قطر 1.7 م',
        icon: '🟠',
      ),
      Tank(
        id: 'mazut_8',
        name: 'خزان مازوت كور جورة تسخين البيتومين',
        category: 'Mazut',
        shape: 'vertical_cylinder',
        diameter: 2.4,
        height: 3.1,
        description: 'أسطواني عمودي - ارتفاع 3.1 م - قطر 2.4 م',
        icon: '🟠',
      ),
      Tank(
        id: 'mazut_9',
        name: 'خزان مازوت المولدة الأول',
        category: 'Mazut',
        shape: 'vertical_cylinder',
        diameter: 1.5,
        height: 2.15,
        description: 'أسطواني عمودي - ارتفاع 2.15 م - قطر 1.5 م',
        icon: '🟠',
      ),
      Tank(
        id: 'mazut_10',
        name: 'خزان مازوت المولدة الثاني',
        category: 'Mazut',
        shape: 'vertical_cylinder',
        diameter: 1.4,
        height: 3,
        description: 'أسطواني عمودي - ارتفاع 3 م - قطر 1.4 م',
        icon: '🟠',
      ),
      // Oil Tanks
      Tank(
        id: 'oil_1',
        name: 'خزان الزيت الأحمر',
        category: 'Oil',
        shape: 'horizontal_cylinder',
        diameter: 3.15,
        length: 12.8,
        description: 'أسطواني أفقي - قطر 3.15 م - طول 12.8 م',
        icon: '🟡',
      ),
      Tank(
        id: 'oil_2',
        name: 'خزان الزيت الفضي',
        category: 'Oil',
        shape: 'horizontal_cylinder',
        diameter: 2.9,
        length: 9,
        description: 'أسطواني أفقي - قطر 2.9 م - طول 9 م',
        icon: '🟡',
      ),
      Tank(
        id: 'oil_3',
        name: 'خزان الزيت الأسود',
        category: 'Oil',
        shape: 'horizontal_cylinder',
        diameter: 2.37,
        length: 7.5,
        description: 'أسطواني أفقي - قطر 2.37 م - طول 7.5 م',
        icon: '🟡',
      ),
      Tank(
        id: 'oil_4',
        name: 'خزان الزيت 3',
        category: 'Oil',
        shape: 'horizontal_cylinder',
        diameter: 2.35,
        length: 4.5,
        description: 'أسطواني أفقي - قطر 2.35 م - طول 4.5 م',
        icon: '🟡',
      ),
      Tank(
        id: 'oil_5',
        name: 'خزان الزيت 4',
        category: 'Oil',
        shape: 'horizontal_cylinder',
        diameter: 2,
        length: 5,
        description: 'أسطواني أفقي - قطر 2 م - طول 5 م',
        icon: '🟡',
      ),
      Tank(
        id: 'oil_6',
        name: 'خزان الزيت 5',
        category: 'Oil',
        shape: 'horizontal_cylinder',
        diameter: 1.9,
        length: 4.5,
        description: 'أسطواني أفقي - قطر 1.9 م - طول 4.5 م',
        icon: '🟡',
      ),
      Tank(
        id: 'oil_7',
        name: 'خزان الزيت العمودي',
        category: 'Oil',
        shape: 'vertical_cylinder',
        diameter: 2.4,
        height: 3,
        description: 'أسطواني عمودي - قطر 2.4 م - ارتفاع 3 م',
        icon: '🟡',
      ),
      // Bitumen & Fuel Tanks
      Tank(
        id: 'bitumen_1',
        name: 'جورة البيتومين',
        category: 'Bitumen',
        shape: 'rectangular',
        length2: 20,
        width: 10,
        depth: 2.65,
        description: 'متوازي مستطيلات - 20×10×2.65 م',
        icon: '⚫',
      ),
      Tank(
        id: 'fuel_1',
        name: 'جورة الفيول',
        category: 'Fuel',
        shape: 'rectangular',
        length2: 30,
        width: 15,
        depth: 2.8,
        description: 'متوازي مستطيلات - 30×15×2.8 م',
        icon: '⚫',
      ),
      Tank(
        id: 'mc0_1',
        name: 'الجورة الشمالية MC0',
        category: 'Bitumen',
        shape: 'rectangular',
        length2: 20,
        width: 10,
        depth: 2.6,
        description: 'متوازي مستطيلات - 20×10×2.6 م',
        icon: '⚫',
      ),
      // Water Tanks
      Tank(
        id: 'water_1',
        name: 'جورة المسبح',
        category: 'Water',
        shape: 'rectangular',
        length2: 8.2,
        width: 4,
        depth: 3.3,
        description: 'متوازي مستطيلات - 8.2×4×3.3 م',
        icon: '🔵',
      ),
      Tank(
        id: 'water_2',
        name: 'تنك ماء 1 الغلاية',
        category: 'Water',
        shape: 'rectangular',
        length2: 12.2,
        width: 3,
        depth: 1.5,
        description: 'متوازي مستطيلات - 12.2×3×1.5 م',
        icon: '🔵',
      ),
      Tank(
        id: 'water_3',
        name: 'تنك ماء 2',
        category: 'Water',
        shape: 'rectangular',
        length2: 12.2,
        width: 3,
        depth: 1.5,
        description: 'متوازي مستطيلات - 12.2×3×1.5 م',
        icon: '🔵',
      ),
      Tank(
        id: 'water_4',
        name: 'تنك ماء 3',
        category: 'Water',
        shape: 'rectangular',
        length2: 12.2,
        width: 3,
        depth: 1.5,
        description: 'متوازي مستطيلات - 12.2×3×1.5 م',
        icon: '🔵',
      ),
      Tank(
        id: 'water_5',
        name: 'تنك ماء الفاكيوم',
        category: 'Water',
        shape: 'rectangular',
        length2: 6,
        width: 2,
        depth: 1,
        description: 'متوازي مستطيلات - 6×2×1 م',
        icon: '🔵',
      ),
      Tank(
        id: 'water_6',
        name: 'مخزان ماء الغلاية',
        category: 'Water',
        shape: 'vertical_cylinder',
        diameter: 2.7,
        height: 5.25,
        description: 'أسطواني عمودي - قطر 2.7 م - ارتفاع 5.25 م',
        icon: '🔵',
      ),
    ];
  }

  static List<Tank> getTanksByCategory(String category) {
    return getAllTanks().where((tank) => tank.category == category).toList();
  }

  static List<String> getCategories() {
    return ['Mazut', 'Oil', 'Water', 'Bitumen', 'Fuel'];
  }

  static String getCategoryIcon(String category) {
    switch (category) {
      case 'Mazut':
        return '🟠';
      case 'Oil':
        return '🟡';
      case 'Water':
        return '🔵';
      case 'Bitumen':
      case 'Fuel':
        return '⚫';
      default:
        return '📦';
    }
  }

  static String getCategoryNameAr(String category) {
    switch (category) {
      case 'Mazut':
        return 'المازوت';
      case 'Oil':
        return 'الزيت';
      case 'Water':
        return 'الماء';
      case 'Bitumen':
        return 'البيتومين';
      case 'Fuel':
        return 'الفيول';
      default:
        return category;
    }
  }
}
