import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/client.dart';
import '../providers/client_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer_menu.dart';

class ClientFormScreen extends StatefulWidget {
  const ClientFormScreen({super.key});

  @override
  State<ClientFormScreen> createState() => _ClientFormScreenState();
}

class _ClientFormScreenState extends State<ClientFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  void _saveClient() {
    if (_formKey.currentState!.validate()) {
      final newClient = Client(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
      );

      Provider.of<ClientProvider>(context, listen: false).addClient(newClient);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cliente cadastrado com sucesso!')),
      );

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final clients = Provider.of<ClientProvider>(context).clients;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Cadastro de Cliente'),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Formulário
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Informe o nome' : null,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value == null || !value.contains('@')
                            ? 'Informe um e-mail válido'
                            : null,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Telefone'),
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        value == null || value.length < 8
                            ? 'Informe um telefone válido'
                            : null,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _saveClient,
                    icon: const Icon(Icons.save),
                    label: const Text('Salvar Cliente'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Lista de clientes cadastrados
            Expanded(
              child: clients.isEmpty
                  ? const Center(
                      child: Text('Nenhum cliente cadastrado.'),
                    )
                  : ListView.builder(
                      itemCount: clients.length,
                      itemBuilder: (context, index) {
                        final client = clients[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(client.name),
                            subtitle: Text('${client.email}\n${client.phone}'),
                            isThreeLine: true,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
