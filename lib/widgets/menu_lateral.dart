


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
              fit:BoxFit.cover
              )
            ),
          ),
          ListTile(
            title: const Text('Principal'),
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
