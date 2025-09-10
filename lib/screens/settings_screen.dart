import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer_menu.dart';
import '../theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Configurações'),
      drawer: const DrawerMenu(),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Tema Escuro'),
            secondary: const Icon(Icons.brightness_6),
            value: themeProvider.isDarkMode,
            onChanged: (val) {
              themeProvider.toggleTheme(val);
            },
          ),
          const ListTile(
            leading: Icon(Icons.lock),
            title: Text('Segurança'),
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('Sobre o app'),
          ),
        ],
      ),
    );
  }
}
