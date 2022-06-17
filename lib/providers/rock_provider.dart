import 'package:flutter/cupertino.dart';
import 'package:OpaMind/models/rock_report.dart';
import 'package:OpaMind/models/rock_report_response.dart';
import 'package:OpaMind/models/rock.dart';
import 'package:OpaMind/models/rock_response.dart';
import 'package:http/http.dart' as http;

class RockProvider extends ChangeNotifier {
  String _baseUrl = "192.168.1.10:3999";

  List<Rock> listaRocks = [];
  List<RockReport> listaRockReport = [];

  RockProvider() {
    print('Ingresando a RockProvider');
    this.getOnRockList();
    this.reporteRock();
  }

  getOnRockList() async {
    var url = Uri.http(_baseUrl, '/api/rocks', {});
    final response = await http.get(url);
    print(response.body);
    final rockResponse = RockResponse.fromJson(response.body);
    listaRocks = rockResponse.rocks;
    notifyListeners();
  }

  reporteRock() async {
    var url =Uri.http(_baseUrl, 'api/reportes/RockReport');
    final response = await http.get(url);
    final rockReportResponse = RockReportResponse.fromJson(response.body);
    listaRockReport = rockReportResponse.rockReport;
    notifyListeners();
  }
}
