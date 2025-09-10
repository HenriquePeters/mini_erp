import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Text('Sua Empresa AQUI',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () => Navigator.pushReplacementNamed(context, '/dashboard'),
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Estoque'),
            onTap: () => Navigator.pushReplacementNamed(context, '/stock'),
          ),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Clientes'),
            onTap: () => Navigator.pushReplacementNamed(context, '/client-form'),
          ),
          ListTile(
            leading: const Icon(Icons.point_of_sale),
            title: const Text('Vendas'),
            onTap: () => Navigator.pushReplacementNamed(context, '/sales'),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Histórico de Vendas'),
            onTap: () => Navigator.pushReplacementNamed(context, '/sales-history'),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Financeiro'),
            onTap: () => Navigator.pushReplacementNamed(context, '/finance'),
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text('Relatórios'),
            onTap: () => Navigator.pushReplacementNamed(context, '/reports'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () => Navigator.pushReplacementNamed(context, '/settings'),
          ),
        ],
      ),
    );
  }
}
