import 'package:OpaMind/models/pop_report.dart';
import 'package:OpaMind/providers/pop_provider.dart';
import 'package:OpaMind/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteScreen extends StatefulWidget {
  ReporteScreen({Key? key}) : super(key: key);

  @override
  State<ReporteScreen> createState() => _ReporteScreenState();
}

class _ReporteScreenState extends State<ReporteScreen> {
  @override
  Widget build(BuildContext context) {
    final popProvider = Provider.of<PopProvider>(context);
    final List<PopReport> listaPopReport = popProvider.listaPopReport;

    List<charts.Series<PopReport, String>> serie = [
      charts.Series(
          id: "PopProducto",
          data: listaPopReport,
          domainFn: (PopReport serie, _) => serie.id,
          measureFn: (PopReport serie, _) => serie.count,
          colorFn: (PopReport serie, _) =>
              charts.ColorUtil.fromDartColor(Colors.blueGrey)),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 76, 149),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 54, 99),
        title: const Text('Reporte Pop'),
        centerTitle: true,
      ),
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
                  Expanded(child: charts.BarChart(serie, animate: true))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
