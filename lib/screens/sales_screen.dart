import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer_menu.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = ['Saco de Batata', 'Saco de Beterraba', 'Saco de Alho'];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Nova Venda'),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField(
              items: products.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
              onChanged: (_) {},
              decoration: const InputDecoration(labelText: 'Produto'),
            ),
            const SizedBox(height: 12),
            TextField(decoration: const InputDecoration(labelText: 'Quantidade')),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Finalizar Venda'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
