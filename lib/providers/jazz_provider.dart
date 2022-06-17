import 'package:OpaMind/models/jazz_report.dart';
import 'package:OpaMind/models/jazz_report_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:OpaMind/models/jazz.dart';
import 'package:OpaMind/models/jazz_response.dart';
import 'package:http/http.dart' as http;

class JazzProvider extends ChangeNotifier {
  String _baseUrl = "192.168.1.11:3999";

  List<Jazz> listaJazzs = [];
  List<JazzReport> listaJazzReport = [];

  JazzProvider() {
    print('Ingresando a JazzProvider');
    this.getOnJazzList();
    this.reporteJazz();
  }

  getOnJazzList() async {
    var url = Uri.http(_baseUrl, '/api/jazzs', {});
    final response = await http.get(url);
    print(response.body);
    final jazzResponse = JazzResponse.fromJson(response.body);
    listaJazzs = jazzResponse.jazzs;
    notifyListeners();
  }

  reporteJazz() async {
    var url = Uri.http(_baseUrl, 'api/reportes/JazzReport');
    final response = await http.get(url);
    final jazzReportResponse = JazzReportResponse.fromJson(response.body);
    listaJazzReport = jazzReportResponse.jazzReport;
    notifyListeners();
  }
}
