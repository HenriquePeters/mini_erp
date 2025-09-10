import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer_menu.dart';

class StockListScreen extends StatelessWidget {
  const StockListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'nome': 'Saco de Batata', 'qtd': 10},
      {'nome': 'Saco de Beterraba', 'qtd': 25},
      {'nome': 'Saco de Alho', 'qtd': 5},
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Estoque'),
      drawer: const DrawerMenu(),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, i) {
          final p = products[i];
          return ListTile(
            leading: const Icon(Icons.inventory),
            title: Text(p['nome'].toString()),
            subtitle: Text('Quantidade: ${p['qtd']}'),
          );
        },
      ),
    );
  }
}
