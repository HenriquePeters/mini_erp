import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer_menu.dart';

class ProductFormScreen extends StatelessWidget {
  const ProductFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cadastro de Produto'),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Nome do Produto')),
            const SizedBox(height: 12),
            TextField(decoration: const InputDecoration(labelText: 'Preço')),
            const SizedBox(height: 12),
            TextField(decoration: const InputDecoration(labelText: 'Quantidade em Estoque')),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
