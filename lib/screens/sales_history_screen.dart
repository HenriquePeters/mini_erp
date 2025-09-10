import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer_menu.dart';

class SalesHistoryScreen extends StatelessWidget {
  const SalesHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sales = [
      {'cliente': 'Henrique', 'valor': 'R\$ 200'},
      {'cliente': 'Maria', 'valor': 'R\$ 350'},
      {'cliente': 'João', 'valor': 'R\$ 350'},
      {'cliente': 'Leticia', 'valor': 'R\$ 350'},
      {'cliente': 'Ian', 'valor': 'R\$ 200'},
      {'cliente': 'Gabriella', 'valor': 'R\$ 350'},
      {'cliente': 'Pedro', 'valor': 'R\$ 200'},
      {'cliente': 'Lucas', 'valor': 'R\$ 200'},
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Histórico de Vendas'),
      drawer: const DrawerMenu(),
      body: ListView.builder(
        itemCount: sales.length,
        itemBuilder: (_, i) {
          final s = sales[i];
          return ListTile(
            leading: const Icon(Icons.receipt_long),
            title: Text('Cliente: ${s['cliente']}'),
            subtitle: Text('Valor: ${s['valor']}'),
          );
        },
      ),
    );
  }
}
