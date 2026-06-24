import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tank_provider.dart';
import '../services/tank_data_service.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TankProvider>(
      builder: (context, provider, _) {
        final summary = provider.getSummaryByCategory();
        final totalWeight = provider.getTotalWeight();
        final totalVolume = provider.getTotalVolume();
        final results = provider.resultsList;

        return Scaffold(
          appBar: AppBar(
            title: const Text('الملخص والإجمالي'),
            elevation: 0,
            actions: [
              if (results.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.delete_sweep),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('تأكيد الحذف'),
                        content: const Text(
                          'هل تريد حذف جميع النتائج؟',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('إلغاء'),
                          ),
                          TextButton(
                            onPressed: () {
                              provider.clearAllResults();
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'حذف',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
          body: results.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.inbox_outlined,
                        size: 64,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'لا توجد نتائج محسوبة',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'قم بحساب حجم ووزن المواد لعرضها هنا',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Total Summary Card
                      Card(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الإجمالي العام',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              const SizedBox(height: 16),
                              _buildTotalRow(
                                'الحجم الكلي',
                                '${totalVolume.toStringAsFixed(3)} م³',
                                Colors.white,
                              ),
                              const SizedBox(height: 8),
                              _buildTotalRow(
                                'الوزن الكلي',
                                '${totalWeight.toStringAsFixed(3)} طن',
                                Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Category Summary
                      Text(
                        'الملخص حسب المادة',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 12),
                      ...summary.entries.map((entry) {
                        final icon = TankDataService.getCategoryIcon(entry.key);
                        final nameAr =
                            TankDataService.getCategoryNameAr(entry.key);

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      icon,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          nameAr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '${entry.value.toStringAsFixed(3)} طن',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      const SizedBox(height: 24),
                      // Results Table
                      Text(
                        'تفاصيل الحسابات',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 12),
                      _buildResultsTable(context, results),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildTotalRow(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildResultsTable(BuildContext context, results) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('الخزان')),
          DataColumn(label: Text('الحجم (م³)')),
          DataColumn(label: Text('الوزن (طن)')),
          DataColumn(label: Text('الملء %')),
        ],
        rows: results
            .map(
              (result) => DataRow(
                cells: [
                  DataCell(
                    SizedBox(
                      width: 120,
                      child: Text(
                        result.tankName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(result.volumeM3.toStringAsFixed(3)),
                  ),
                  DataCell(
                    Text(result.weightTons.toStringAsFixed(3)),
                  ),
                  DataCell(
                    Text(
                      '${result.filledPercentage.toStringAsFixed(1)}%',
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
