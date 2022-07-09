import 'package:OpaMind/search/rock_search_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:OpaMind/providers/rock_provider.dart';
import 'package:OpaMind/widgets/menu_lateral.dart';
import 'package:OpaMind/models/rock.dart';
import 'package:provider/provider.dart';

class RockScreen extends StatefulWidget {
  @override
  createState() => _RockScreen();
}

class _RockScreen extends State<RockScreen> {
  @override
  Widget build(BuildContext context) {
    final rockProvider = Provider.of<RockProvider>(context);
    final List<Rock> listaRocks = rockProvider.listaRocks;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 76, 149),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 54, 99),
        title: Text('Rock'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: RockSearchDelegate(listaRocks));
            },
          )
        ],
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: ListView.builder(
          itemCount: listaRocks.length,
          itemBuilder: (context, index) {
            return Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    width: double.infinity,
                    height: 75,
                    decoration: _cardBorders(),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          child: ListTile(
                            onTap: (() {
                              Navigator.pushReplacementNamed(
                                  context, 'reproductor_rock');
                            }),
                            title: Text(listaRocks[index].cancion,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,
                                    color: Color.fromARGB(255, 255, 255, 255))),
                            subtitle: Text(
                              listaRocks[index].banda,
                              style: TextStyle(
                                color: Color.fromARGB(255, 151, 151, 151),
                                fontSize: 15,
                              ),
                            ),
                            leading: Image.network(listaRocks[index].portada,
                                height: 100, width: 80),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(255, 151, 151, 151),
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 80,
        height: 100,
        child: FadeInImage(
          placeholder: AssetImage('assets/jar gif.gif'),
          image: NetworkImage(''),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Color.fromARGB(255, 50, 54, 99),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
        ]);
