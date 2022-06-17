import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/opamin logo.jpeg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_principal');
            },
          ),
          ListTile(
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_perfil');
            },
          ),
          ListTile(
            title: const Text('Playlist'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_playlist');
            },
          ),
          ListTile(
            title: const Text('Rock'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_rocks');
            },
          ),
          ListTile(
            title: const Text('Pop'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_pops');
            },
          ),
          ListTile(
            title: const Text('Jazz'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_jazzs');
            },
          ),
          ListTile(
            title: const Text('Techno'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_technos');
            },
          ),
          ListTile(
            title: const Text('Reportes'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_reporte');
            },
          ),
          ListTile(
            title: const Text('Reportes Home Music'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_reporte_home_music');
            },
          ),
          ListTile(
            title: const Text('Reportes Rock'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_reporterock');
            },
          ),
          ListTile(
            title: const Text('Reportes Jazz'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_reportejazz');
            },
          ),
          Divider(),
          ListTile(
            title: const Text('Cerrar Sesión'),
            onTap: () {
              Navigator.pushNamed(context, 'ruta_login');
            },
          ),
        ],
      ),
    );
  }
}
