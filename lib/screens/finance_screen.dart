import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer_menu.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'tipo': 'Receber', 'valor': 'R\$ 500'},
      {'tipo': 'Pagar', 'valor': 'R\$ 200'},
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Financeiro'),
      drawer: const DrawerMenu(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, i) {
          final it = items[i];
          return ListTile(
            leading: Icon(it['tipo'] == 'Receber' ? Icons.arrow_downward : Icons.arrow_upward,
                color: it['tipo'] == 'Receber' ? Colors.green : Colors.red),
            title: Text(it['tipo'].toString()),
            subtitle: Text(it['valor'].toString()),
          );
        },
      ),
    );
  }
}
