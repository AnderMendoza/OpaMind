import 'package:OpaMind/models/jazz.dart';
import 'package:flutter/material.dart';

class JazzSearchDelegate extends SearchDelegate<Jazz> {
  final List<Jazz> listaJazzs;

  JazzSearchDelegate(this.listaJazzs);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context,
              Jazz(id: '', jazzId: 0, portada: '', cancion: '', banda: ''));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaJazzs
        : listaJazzs
            .where((jazz) =>
                jazz.banda.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardJazz(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardJazz(Jazz jazzFiltrado, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading:
              CircleAvatar(backgroundImage: NetworkImage(jazzFiltrado.portada)),
          title: Text(jazzFiltrado.cancion),
          subtitle: Text(jazzFiltrado.banda),
          onTap: () {
            Navigator.pushNamed(context, 'reproductor_jazz',
                arguments: jazzFiltrado);
          },
        )
      ],
    ),
  );
}
