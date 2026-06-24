import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tank_provider.dart';
import '../services/tank_data_service.dart';
import '../widgets/tank_card.dart';
import 'summary_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TankProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('حاسبة الحجوم والأوزان'),
            elevation: 0,
            actions: [
              if (provider.results.isNotEmpty)
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.summary),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SummaryScreen(),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Text(
                          '${provider.results.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          body: Column(
            children: [
              // Category Filter
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  children: TankDataService.getCategories().map((category) {
                    final isSelected =
                        provider.selectedCategory == category;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 8,
                      ),
                      child: FilterChip(
                        label: Text(
                          '${TankDataService.getCategoryIcon(category)} ${category}',
                        ),
                        selected: isSelected,
                        onSelected: (_) {
                          provider.setSelectedCategory(category);
                        },
                        backgroundColor: Colors.grey[200],
                        selectedColor:
                            Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                    );
                  }).toList(),
                ),
              ),
              // Tanks List
              Expanded(
                child: ListView.builder(
                  itemCount: provider.filteredTanks.length,
                  itemBuilder: (context, index) {
                    final tank = provider.filteredTanks[index];
                    return TankCard(tank: tank);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
