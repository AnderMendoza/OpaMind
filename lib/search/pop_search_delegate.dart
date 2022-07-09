import 'package:OpaMind/models/pop.dart';
import 'package:flutter/material.dart';

class PopSearchDelegate extends SearchDelegate<Pop> {
  final List<Pop> listaPops;

  PopSearchDelegate(this.listaPops);

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
          close(
              context,
              Pop(
                  id: '',
                  popId: 0,
                  portada: '',
                  cancion: '',
                  banda: '',
                  url: ''));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaPops
        : listaPops
            .where(
                (pop) => pop.banda.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardPop(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardPop(Pop popFiltrado, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading:
              CircleAvatar(backgroundImage: NetworkImage(popFiltrado.portada)),
          title: Text(popFiltrado.cancion),
          subtitle: Text(popFiltrado.banda),
          onTap: () {
            Navigator.pushNamed(context, 'reproductor_pop',
                arguments: popFiltrado);
          },
        )
      ],
    ),
  );
}
