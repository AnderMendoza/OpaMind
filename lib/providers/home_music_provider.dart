import 'package:flutter/cupertino.dart';
import 'package:OpaMind/models/home_music.dart';
import 'package:OpaMind/models/home_music_response.dart';
import 'package:http/http.dart' as http;

import '../models/home_music_report.dart';
import '../models/home_music_report_response.dart';

class HmusicProvider extends ChangeNotifier {
  String _baseUrl = "opamind-api.herokuapp.com";

  List<Hmusic> listaHmusics = [];
  List<HmusicReport> listaHmusicReport = [];

  HmusicProvider() {
    print('Ingresando a HmusicProvider');
    this.getOnHmusicList();
    this.reportHmusic();
  }

  getOnHmusicList() async {
    var url = Uri.http(_baseUrl, '/api/hmusics', {});
    final response = await http.get(url);
    print(response.body);
    final hmusicResponse = HmusicResponse.fromJson(response.body);
    listaHmusics = hmusicResponse.hmusics;
    notifyListeners();
  }

  reportHmusic() async {
    var url = Uri.http(_baseUrl, 'api/reportes/HmusicReport');
    final response = await http.get(url);
    final hmusicReportResponse = HmusicReportResponse.fromJson(response.body);
    listaHmusicReport = hmusicReportResponse.hmusicReport;
    notifyListeners();
  }
}
