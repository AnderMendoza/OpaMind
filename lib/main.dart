import 'package:OpaMind/screens/home_music_screen.dart';
import 'package:OpaMind/providers/home_music_provider.dart';
import 'package:OpaMind/screens/reporte_home_music.dart';
import 'package:OpaMind/screens/reporte_screen.dart';
import 'package:OpaMind/screens/reporterock_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:OpaMind/screens/login2_screen.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

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
          'ruta_login': (_) => Login2Screen(),
          'ruta_principal': (_) => HmusicScreen(),
          'ruta_rocks': (_) => RockScreen(),
          'ruta_pops': (_) => PopScreen(),
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Login2Screen();
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
