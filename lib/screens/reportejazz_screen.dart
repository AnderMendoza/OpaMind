import 'package:OpaMind/models/jazz_report.dart';
import 'package:OpaMind/providers/jazz_provider.dart';
import 'package:OpaMind/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReporteJazzScreen extends StatefulWidget {
  ReporteJazzScreen({Key? key}) : super(key: key);

  @override
  State<ReporteJazzScreen> createState() => _ReporteJazzScreenState();
}

class _ReporteJazzScreenState extends State<ReporteJazzScreen> {
  @override
  Widget build(BuildContext context) {
    final jazzProvider = Provider.of<JazzProvider>(context);
    final List<JazzReport> listaJazzReport = jazzProvider.listaJazzReport;

    List<charts.Series<JazzReport, String>> serie = [
      charts.Series(
        id:"JazzProducto",
        data: listaJazzReport,
        domainFn: (JazzReport serie,_)=>serie.id,
        measureFn: (JazzReport serie,_)=>serie.count,
        colorFn: (JazzReport serie,_)=> charts.ColorUtil.fromDartColor(Colors.blueGrey)
      ),
    ];



    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 76, 149),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 54, 99),
        title: const Text('Reporte de las Canciones de Jazz'),
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