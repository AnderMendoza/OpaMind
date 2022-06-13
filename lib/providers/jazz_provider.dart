import 'package:flutter/cupertino.dart';
import 'package:OpaMind/models/jazz.dart';
import 'package:OpaMind/models/jazz_response.dart';
import 'package:http/http.dart' as http;

class JazzProvider extends ChangeNotifier {

  String _baseUrl = "192.168.1.10:3999";

  List<Jazz> listaJazzs = [];

  JazzProvider() {
    print('Ingresando a JazzProvider');
    this.getOnJazzList();
  }

  getOnJazzList() async {
    var url = Uri.http(_baseUrl, '/api/jazzs', {});
    final response = await http.get(url);
    print(response.body);
    final jazzResponse = JazzResponse.fromJson(response.body);
    listaJazzs = jazzResponse.jazzs;
    notifyListeners();
  }
}