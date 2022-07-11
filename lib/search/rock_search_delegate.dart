import 'package:OpaMind/models/rock.dart';
import 'package:flutter/material.dart';

class RockSearchDelegate extends SearchDelegate<Rock> {
  final List<Rock> listaRocks;

  RockSearchDelegate(this.listaRocks);

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
              Rock(
                  id: '',
                  rockId: 0,
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
        ? listaRocks
        : listaRocks
            .where((rock) =>
                rock.banda.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardRock(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardRock(Rock rockFiltrado, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading:
              CircleAvatar(backgroundImage: NetworkImage(rockFiltrado.portada)),
          title: Text(rockFiltrado.cancion),
          subtitle: Text(rockFiltrado.banda),
          onTap: () {
            Navigator.pushNamed(context, 'reproductor_rock',
                arguments: rockFiltrado);
          },
        )
      ],
    ),
  );
}
