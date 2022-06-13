

import 'package:OpaMind/models/pop_report.dart';
import 'package:OpaMind/models/pop_report_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:OpaMind/models/pop.dart';
import 'package:OpaMind/models/pop_response.dart';
import 'package:http/http.dart' as http;

class PopProvider extends ChangeNotifier {

  String _baseUrl = "192.168.18.7:3999";

  List<Pop> listaPops = [];
  List<PopReport> listaPopReport = [];


  PopProvider(){
    print('Ingresando a PopProvider');
    this.getOnPopList();
    this.reportePop();
  }

  getOnPopList() async {
    var url = Uri.http(_baseUrl, '/api/pops', {});
    final response = await http.get(url);
    print(response.body);
    final popResponse = PopResponse.fromJson(response.body);
    listaPops = popResponse.pops;
    notifyListeners();
  }

  reportePop() async {
    var url =Uri.http(_baseUrl, 'api/reportes/PopReport');
    final response = await http.get(url);
    final popReportResponse = PopReportResponse.fromJson(response.body);
    listaPopReport = popReportResponse.popReport;
    notifyListeners();
  }
}