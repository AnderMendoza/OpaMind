import 'package:OpaMind/models/home_music.dart';
import 'package:flutter/material.dart';

class HmusicSearchDelegate extends SearchDelegate<Hmusic> {
  final List<Hmusic> listaHmusics;

  HmusicSearchDelegate(this.listaHmusics);

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
              Hmusic(
                  id: '',
                  hmusicId: 0,
                  title: '',
                  singer: '',
                  url: '',
                  coverUrl: ''));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaHmusics
        : listaHmusics
            .where((hmusic) =>
                hmusic.title.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardHmusic(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardHmusic(Hmusic hmusicFiltrado, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(hmusicFiltrado.coverUrl)),
          title: Text(hmusicFiltrado.title),
          subtitle: Text(hmusicFiltrado.singer),
          onTap: () {
            Navigator.pushNamed(context, 'reproductor_hmusic',
                arguments: hmusicFiltrado);
          },
        )
      ],
    ),
  );
}
