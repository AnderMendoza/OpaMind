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
          close(context,
              Rock(id: '', rockId: 0, portada: '', cancion: '', banda: ''));
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView();
  }
}
