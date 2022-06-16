

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            header(
              username: 'mely.ksthvjk',
              backgroundAsset: 'assets/oficial.jpg',
              userAsset: 'assets/fotoperfil.jpeg',
            ),
            Connections(
              Favoritas: 10,
              Seguidores: 58,
              Artistas: 125,
            ),
            Description(
            text: 'Me encanta OPAMIND mantiene en orden mis playlits, las puedo escuchar en cualquier momento, puedo elegir el genero que mas me gusta, tambien puedo añadirlas y reservalas a su estreno, me gusta el diseño y espacio de la app, sin duda la mejor. Lorem ipsum dolor sit amet consectetur adipiscing elit potenti mi vulputate nullam, interdum quam pretium fermentum eu hac nulla augue vivamus vehicula. Lacus molestie leo pretium nisi turpis ut nullam at dis nisl, aliquet est morbi class ullamcorper mauris a habitant natoque. Vehicula leo ultrices ante ad in bibendum libero fringilla luctus netus placerat ac non, purus eget cras interdum vestibulum per ullamcorper tristique penatibus cum class ut.', 
            ),

          ],
        ),
    );
  }
  
}

class Description extends StatelessWidget {
  final String text;
  const Description({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(this.text, 
        style: TextStyle(
         fontSize: 12,
        ),
      ),
    );
  }
}

class Connections extends StatelessWidget {
  final int Favoritas, Seguidores, Artistas;
  
  const Connections({
    Key? key,
    required this.Favoritas,
    required this.Seguidores,
    required this.Artistas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(59, 115, 62, 146),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Connection(text: 'Favoritas', number: this.Favoritas),
          Connection(text: 'Seguidores', number: this.Seguidores),
          Connection(text: 'Artistas', number: this.Artistas),
        ],

      ),
    );
  }
}

class Connection extends StatelessWidget {
  final String text;
  final int number;

  const Connection({
    Key? key,
    required this.text,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: Color.fromARGB(230, 177, 10, 228),
    );
    return Column(
      children: <Widget>[
        Text(this.text.toUpperCase(),
         style: style.copyWith(fontSize: 11),
        ),
        Text('${this.number}', 
        style: style.copyWith(fontSize: 18),
      ),
      ],
    );
  }
}

class header extends StatelessWidget {
  final double height;
  final String backgroundAsset;
  final String userAsset;
  final String username;

  const header({
    Key? key,
    this.height = 200,
    required this.backgroundAsset,
    required this.userAsset,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(this.backgroundAsset),
          fit: BoxFit.cover
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          UserPhoto(
            assetImage: this.userAsset, 
            size: 100,
          ),
          Text(
            '@${this.username}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class UserPhoto extends StatelessWidget {
  final String assetImage;
  final double size;
 
  const UserPhoto({
    Key? key,
    required this.assetImage,
    this.size = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(this.assetImage),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
      ),
      margin: EdgeInsets.only(bottom: 5),
    );
  }
}

