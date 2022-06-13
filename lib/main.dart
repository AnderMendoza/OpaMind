import 'package:OpaMind/screens/home_music_screen.dart';
import 'package:OpaMind/providers/home_music_provider.dart';
import 'package:flutter/material.dart';
import 'package:OpaMind/screens/login_screen.dart';
import 'package:OpaMind/screens/principal_screen.dart';
import 'package:OpaMind/screens/reproductor.dart';
import 'package:provider/provider.dart';
import 'package:OpaMind/screens/rock_screen.dart';
import 'package:OpaMind/providers/rock_provider.dart';
import 'package:OpaMind/screens/pop_screen.dart';
import 'package:OpaMind/providers/pop_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS APP',
      initialRoute: 'ruta_login',
      routes: {
        'ruta_login': (_) => LoginScreen(),
        'ruta_register': (_) => RegisterScreen(),
        'ruta_principal': (_) => PrincipalScreen(),
        'ruta_productos': (_) => ProductoScreen(),
        'ruta_productos_form': (_) => ProductoFormScreen(),
      },
    );
    */
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RockProvider()),
        ChangeNotifierProvider(create: (_) => PopProvider()),
        ChangeNotifierProvider(create: (_) => HmusicProvider()),
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
        },
      ),
    );
  }
}
