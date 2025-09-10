import 'package:flutter/material.dart';
import '../models/client.dart';

class ClientProvider extends ChangeNotifier {
  final List<Client> _clients = [];

  List<Client> get clients => _clients;

  void addClient(Client client) {
    _clients.add(client);
    notifyListeners();
  }
}
