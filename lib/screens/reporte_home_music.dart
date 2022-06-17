import 'package:OpaMind/models/home_music_report.dart';
import 'package:OpaMind/providers/home_music_provider.dart';
import 'package:OpaMind/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteHmusicScreen extends StatefulWidget {
  ReporteHmusicScreen({Key? key}) : super(key: key);

  @override
  State<ReporteHmusicScreen> createState() => _ReporteHmusicScreenState();
}

class _ReporteHmusicScreenState extends State<ReporteHmusicScreen> {
  @override
  Widget build(BuildContext context) {
    final hmusicProvider = Provider.of<HmusicProvider>(context);
    final List<HmusicReport> listaHmusicReport =
        hmusicProvider.listaHmusicReport;

    List<charts.Series<HmusicReport, String>> serie = [
      charts.Series(
          id: "HmusicProducto",
          data: listaHmusicReport,
          domainFn: (HmusicReport serie, _) => serie.id,
          measureFn: (HmusicReport serie, _) => serie.count,
          colorFn: (HmusicReport serie, _) =>
              charts.ColorUtil.fromDartColor(Colors.blueGrey)),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 76, 149),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 54, 99),
        title: const Text('Reporte de las Canciones de Home Music'),
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
                  Text('Reporte de canciones por cantantes'),
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
