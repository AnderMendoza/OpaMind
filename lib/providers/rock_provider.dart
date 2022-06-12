import 'package:flutter/cupertino.dart';
import 'package:OpaMind/models/rock.dart';
import 'package:OpaMind/models/rock_response.dart';
import 'package:http/http.dart' as http;

class RockProvider extends ChangeNotifier {
  String _baseUrl =
      "192.168.1.8:3999"; //agrega tu propia ip si quieres que funcione :D

  List<Rock> listaRocks = [];

  RockProvider() {
    print('Ingresando a ProductoProvider');
    this.getOnRockList();
  }

  getOnRockList() async {
    var url = Uri.http(_baseUrl, '/api/rocks', {});
    final response = await http.get(url);
    print(response.body);
    final rockResponse = RockResponse.fromJson(response.body);
    listaRocks = rockResponse.rocks;
    notifyListeners();
  }
}
