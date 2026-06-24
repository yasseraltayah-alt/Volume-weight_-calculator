import 'package:intl/intl.dart';

class Formatters {
  static String formatVolume(double volumeM3) {
    return '${volumeM3.toStringAsFixed(3)} m³';
  }

  static String formatLiters(double liters) {
    return '${liters.toStringAsFixed(2)} L';
  }

  static String formatWeight(double weightKg) {
    return '${weightKg.toStringAsFixed(2)} kg';
  }

  static String formatTons(double tons) {
    return '${tons.toStringAsFixed(3)} T';
  }

  static String formatPercentage(double percentage) {
    return '${percentage.toStringAsFixed(1)}%';
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
  }

  static String formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
