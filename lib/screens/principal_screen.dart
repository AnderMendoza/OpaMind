

import 'package:flutter/material.dart';

import '../widgets/menu_lateral.dart';

class PrincipalScreen extends StatefulWidget{

  @override
  createState() => _PrincipalScreen();
}

class _PrincipalScreen extends State<PrincipalScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Principal'),
        ),
        drawer: const MenuLateral() ,
        body: Center(
          child: Text('Principal'),
        ),
    );
  }
  
}