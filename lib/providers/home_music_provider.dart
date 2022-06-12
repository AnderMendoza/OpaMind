import 'package:flutter/cupertino.dart';
import 'package:OpaMind/models/home_music.dart';
import 'package:OpaMind/models/home_music_response.dart';
import 'package:http/http.dart' as http;

class HmusicProvider extends ChangeNotifier {
  String _baseUrl = "//agrega tu propia ip si quieres que funcione :D//:3999";

  List<Hmusic> listaHmusics = [];

  HmusicProvider() {
    print('Ingresando a HmusicProvider');
    this.getOnHmusicList();
  }

  getOnHmusicList() async {
    var url = Uri.http(_baseUrl, '/api/hmusics', {});
    final response = await http.get(url);
    print(response.body);
    final hmusicResponse = HmusicResponse.fromJson(response.body);
    listaHmusics = hmusicResponse.hmusics;
    notifyListeners();
  }
}
