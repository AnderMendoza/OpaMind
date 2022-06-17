import 'package:OpaMind/models/rock_report.dart';
import 'package:OpaMind/providers/rock_provider.dart';
import 'package:OpaMind/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteRockScreen extends StatefulWidget {
  ReporteRockScreen({Key? key}) : super(key: key);

  @override
  State<ReporteRockScreen> createState() => _ReporteRockScreenState();
}

class _ReporteRockScreenState extends State<ReporteRockScreen> {
  @override
  Widget build(BuildContext context) {
    final rockProvider = Provider.of<RockProvider>(context);
    final List<RockReport> listaRockReport = rockProvider.listaRockReport;

    List<charts.Series<RockReport, String>> serie = [
      charts.Series(
        id:"RockProducto",
        data: listaRockReport,
        domainFn: (RockReport serie,_)=>serie.id,
        measureFn: (RockReport serie,_)=>serie.count,
        colorFn: (RockReport serie,_)=> charts.ColorUtil.fromDartColor(Colors.blueGrey)
      ),
    ];



    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 76, 149),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 54, 99),
        title: const Text('Reporte de las Canciones de Rock'),
        centerTitle: true,),
      drawer: MenuLateral(),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text('Reporte de canciones por bandas'),
                  Expanded(
                    child: charts.BarChart(serie, animate: true)
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}