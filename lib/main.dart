import 'package:OpaMind/screens/home_music_screen.dart';
import 'package:OpaMind/providers/home_music_provider.dart';
import 'package:OpaMind/screens/reporte_home_music.dart';
import 'package:OpaMind/screens/reporte_screen.dart';
import 'package:OpaMind/screens/reporterock_screen.dart';
import 'package:flutter/material.dart';
import 'package:OpaMind/screens/login_screen.dart';
import 'package:OpaMind/screens/principal_screen.dart';
import 'package:OpaMind/screens/reproductor.dart';
import 'package:provider/provider.dart';
import 'package:OpaMind/screens/rock_screen.dart';
import 'package:OpaMind/providers/rock_provider.dart';
import 'package:OpaMind/screens/pop_screen.dart';
import 'package:OpaMind/providers/pop_provider.dart';
import 'package:OpaMind/screens/jazz_screen.dart';
import 'package:OpaMind/providers/jazz_provider.dart';
import 'package:OpaMind/screens/techno_screen.dart';
import 'package:OpaMind/providers/techno_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RockProvider()),
        ChangeNotifierProvider(create: (_) => PopProvider()),
        ChangeNotifierProvider(create: (_) => HmusicProvider()),
        ChangeNotifierProvider(create: (_) => JazzProvider()),
        ChangeNotifierProvider(create: (_) => TechnoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'POS APP',
        initialRoute: 'ruta_login', // POR DEFECTO LLAMA A LA RUTA LOGIN
        routes: {
          'ruta_login': (_) => LoginScreen(), // INTEGRANTE 1
          'ruta_principal': (_) => HmusicScreen(), // INTEGRANTE 2
          'ruta_rocks': (_) => RockScreen(), // INTEGRANTE 3
          'ruta_pops': (_) => PopScreen(), // INTEGRANTE 3
          'reproductor': (_) => Reproductor(),
          'ruta_jazzs': (_) => JazzScreen(),
          'ruta_technos': (_) => TechnoScreen(),
          'ruta_perfil': (_) => PrincipalScreen(),
          "ruta_reporte": (_) => ReporteScreen(),
          "ruta_reporterock": (_) => ReporteRockScreen(),
          "ruta_reporte_home_music": (_) => ReporteHmusicScreen(),
        },
      ),
    );
  }
}
