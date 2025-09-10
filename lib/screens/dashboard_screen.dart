import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/kpi_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Dashboard'),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          children: const [
            KpiCard(title: 'Vendas Hoje', value: 'R\$ 56.250', icon: Icons.attach_money),
            KpiCard(title: 'Clientes', value: '350', icon: Icons.people),
            KpiCard(title: 'Produtos', value: '120', icon: Icons.inventory),
            KpiCard(title: 'A Receber', value: 'R\$ 8.350', icon: Icons.account_balance_wallet),
          ],
        ),
      ),
    );
  }
}
