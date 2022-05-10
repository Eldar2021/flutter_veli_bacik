import 'package:flutter/material.dart';

const list = <String>['Almaz', 'Nargul', 'Eldiyar', 'Saltanat', 'Akylai'];

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return list.map((e) => Text(e)).toList();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('buildSuggestions');
  }
}
