import 'package:flutter/material.dart';
import '../models/calculation_result.dart';

class CalculationResultView extends StatelessWidget {
  final CalculationResult result;

  const CalculationResultView({Key? key, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            result.tankName,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 24,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'نسبة الملء: ${result.filledPercentage.toStringAsFixed(1)}%',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: result.filledPercentage / 100,
              minHeight: 12,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                result.filledPercentage > 75
                    ? Colors.green
                    : result.filledPercentage > 50
                        ? Colors.orange
                        : Colors.red,
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildResultCard(
            context,
            'الحجم',
            [
              _ResultItem(
                label: 'المتر المكعب',
                value: '${result.volumeM3.toStringAsFixed(3)} م³',
                icon: '📦',
              ),
              _ResultItem(
                label: 'اللتر',
                value: '${result.volumeLiters.toStringAsFixed(2)} L',
                icon: '🚰',
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildResultCard(
            context,
            'الوزن',
            [
              _ResultItem(
                label: 'الكيلوغرام',
                value: '${result.weightKg.toStringAsFixed(2)} kg',
                icon: '⚖️',
              ),
              _ResultItem(
                label: 'الطن المتري',
                value: '${result.weightTons.toStringAsFixed(3)} T',
                icon: '🏗️',
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'المعلومات التفصيلية',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 16,
                ),
          ),
          const SizedBox(height: 12),
          _buildDetailRow(
            context,
            'ارتفاع الفراغ',
            '${result.emptyHeight.toStringAsFixed(2)} م',
          ),
          _buildDetailRow(
            context,
            'ارتفاع المادة',
            '${result.filledHeight.toStringAsFixed(2)} م',
          ),
          _buildDetailRow(
            context,
            'وقت الحساب',
            '${result.calculatedAt.hour}:${result.calculatedAt.minute.toString().padLeft(2, '0')}',
          ),
        ],
      ),
    );
  }

  Widget _buildResultCard(BuildContext context, String title,
      List<_ResultItem> items) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 16,
                  ),
            ),
            const SizedBox(height: 12),
            ...items.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(item.icon, style: const TextStyle(fontSize: 20)),
                          const SizedBox(width: 8),
                          Text(item.label),
                        ],
                      ),
                      Text(
                        item.value,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

class _ResultItem {
  final String label;
  final String value;
  final String icon;

  _ResultItem({
    required this.label,
    required this.value,
    required this.icon,
  });
}
