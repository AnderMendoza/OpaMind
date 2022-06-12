import 'package:flutter/cupertino.dart';
import 'package:OpaMind/models/pop.dart';
import 'package:OpaMind/models/pop_response.dart';
import 'package:http/http.dart' as http;

class PopProvider extends ChangeNotifier {
  String _baseUrl =
      "192.168.1.8:3999"; //agrega tu propia ip si quieres que funcione :D

  List<Pop> listaPops = [];

  PopProvider() {
    print('Ingresando a PopProvider');
    this.getOnPopList();
  }

  getOnPopList() async {
    var url = Uri.http(_baseUrl, '/api/pops', {});
    final response = await http.get(url);
    print(response.body);
    final popResponse = PopResponse.fromJson(response.body);
    listaPops = popResponse.pops;
    notifyListeners();
  }
}
