import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer_menu.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  String selectedYear = '2023';

  // Simulação de dados por ano
  final Map<String, List<double>> salesData = {
    '2022': [10, 12, 8, 14, 11, 9],
    '2023': [12, 15, 8, 18, 10, 14],
    '2024': [14, 10, 16, 12, 15, 19],
  };

  final Map<String, Map<String, double>> financeData = {
    '2022': {'Vendas': 35, 'Custos': 40, 'Lucro': 25},
    '2023': {'Vendas': 40, 'Custos': 30, 'Lucro': 30},
    '2024': {'Vendas': 45, 'Custos': 25, 'Lucro': 30},
  };

  @override
  Widget build(BuildContext context) {
    final months = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun'];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Relatórios'),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Dropdown de seleção de ano
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filtros:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: selectedYear,
                  items: ['2022', '2023', '2024']
                      .map((year) => DropdownMenuItem(
                            value: year,
                            child: Text(year),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedYear = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              'Vendas por mês',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Gráfico de barras
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() < months.length) {
                            return Text(months[value.toInt()]);
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(
                    salesData[selectedYear]!.length,
                    (i) => BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: salesData[selectedYear]![i],
                          color: Colors.indigo,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Resumo Financeiro',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Gráfico de pizza
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: financeData[selectedYear]!.entries.map((entry) {
                    final color = entry.key == 'Vendas'
                        ? Colors.green
                        : entry.key == 'Custos'
                            ? Colors.red
                            : Colors.blue;
                    return PieChartSectionData(
                      value: entry.value,
                      title: entry.key,
                      color: color,
                      radius: 60,
                      titleStyle: const TextStyle(color: Colors.white),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
