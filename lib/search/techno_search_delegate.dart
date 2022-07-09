import 'package:OpaMind/models/techno.dart';
import 'package:flutter/material.dart';

class TechnoSearchDelegate extends SearchDelegate<Techno> {
  final List<Techno> listaTechnos;

  TechnoSearchDelegate(this.listaTechnos);

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
              Techno(
                  id: '', technosId: 0, portada: '', cancion: '', banda: ''));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaTechnos
        : listaTechnos
            .where((techno) =>
                techno.banda.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardTechno(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardTechno(Techno technoFiltrado, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(technoFiltrado.portada)),
          title: Text(technoFiltrado.cancion),
          subtitle: Text(technoFiltrado.banda),
          onTap: () {
            Navigator.pushNamed(context, 'reproductor_techno',
                arguments: technoFiltrado);
          },
        )
      ],
    ),
  );
}
