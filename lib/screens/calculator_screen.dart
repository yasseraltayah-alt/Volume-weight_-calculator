import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/tank.dart';
import '../providers/tank_provider.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/calculation_result_view.dart';

class CalculatorScreen extends StatefulWidget {
  final Tank tank;

  const CalculatorScreen({Key? key, required this.tank}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  late TextEditingController _emptyHeightController;
  bool _hasCalculated = false;

  @override
  void initState() {
    super.initState();
    _emptyHeightController = TextEditingController();
  }

  @override
  void dispose() {
    _emptyHeightController.dispose();
    super.dispose();
  }

  void _calculate() {
    final value = double.tryParse(_emptyHeightController.text);
    if (value == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء إدخال قيمة صحيحة')),
      );
      return;
    }

    final maxValue = widget.tank.shape == 'horizontal_cylinder'
        ? widget.tank.diameter
        : widget.tank.shape == 'vertical_cylinder'
            ? widget.tank.height
            : widget.tank.depth;

    if (value < 0 || value > maxValue) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('القيمة يجب أن تكون بين 0 و $maxValue'),
        ),
      );
      return;
    }

    context.read<TankProvider>().calculateForTank(widget.tank, value);
    setState(() => _hasCalculated = true);
  }

  void _copyResults() {
    final result = context.read<TankProvider>().results[widget.tank.id];
    if (result != null) {
      final text = '''${result.tankName}

الحجم: ${result.volumeM3.toStringAsFixed(3)} م³
الحجم: ${result.volumeLiters.toStringAsFixed(2)} لتر
الوزن: ${result.weightKg.toStringAsFixed(2)} كغ
الوزن: ${result.weightTons.toStringAsFixed(3)} طن
نسبة الملء: ${result.filledPercentage.toStringAsFixed(1)}%''';
      
      // Copy to clipboard would be implemented here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم نسخ النتائج')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxValue = widget.tank.shape == 'horizontal_cylinder'
        ? widget.tank.diameter
        : widget.tank.shape == 'vertical_cylinder'
            ? widget.tank.height
            : widget.tank.depth;

    final measurementLabel = widget.tank.shape == 'horizontal_cylinder'
        ? 'ارتفاع الفراغ (القطر الفاضي)'
        : 'ارتفاع الفراغ';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tank.name),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'معلومات الخزان',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('النوع', widget.tank.description),
                    _buildInfoRow(
                      'السعة الكلية',
                      '${widget.tank.calculateTotalVolume().toStringAsFixed(3)} م³',
                    ),
                    _buildInfoRow('المادة', widget.tank.category),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'إدخال البيانات',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    CustomInputField(
                      label: measurementLabel,
                      hint: 'أدخل القيمة',
                      controller: _emptyHeightController,
                      unit: 'م',
                      maxValue: maxValue,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _calculate,
                        icon: const Icon(Icons.calculate),
                        label: const Text('حساب'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_hasCalculated)
              Consumer<TankProvider>(
                builder: (context, provider, _) {
                  final result = provider.results[widget.tank.id];
                  if (result == null) return const SizedBox();

                  return Column(
                    children: [
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'النتائج',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CalculationResultView(result: result),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _copyResults,
                          icon: const Icon(Icons.copy),
                          label: const Text('نسخ النتائج'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
