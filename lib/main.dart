import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_provider.dart';
import 'providers/client_provider.dart'; 

import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/product_form_screen.dart';
import 'screens/stock_list_screen.dart';
import 'screens/client_form_screen.dart';
import 'screens/sales_screen.dart';
import 'screens/sales_history_screen.dart';
import 'screens/finance_screen.dart';
import 'screens/reports_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => ClientProvider()),
      ],
      child: const MiniERPApp(),
    ),
  );
}

class MiniERPApp extends StatelessWidget {
  const MiniERPApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Mini ERP',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/dashboard': (_) => const DashboardScreen(),
        '/product-form': (_) => const ProductFormScreen(),
        '/stock': (_) => const StockListScreen(),
        '/client-form': (_) => const ClientFormScreen(),
        '/sales': (_) => const SalesScreen(),
        '/sales-history': (_) => const SalesHistoryScreen(),
        '/finance': (_) => const FinanceScreen(),
        '/reports': (_) => const ReportsScreen(),
        '/settings': (_) => const SettingsScreen(),
      },
    );
  }
}
