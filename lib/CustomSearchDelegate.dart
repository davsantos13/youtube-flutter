import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
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
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, '');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).then((value) {
      close(context, query);
    });
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> sugestoes = List();
    if (query.isNotEmpty){
      sugestoes = [
        'Android', 'Android navegação', 'IOS', 'Jogos'
      ].where(
        (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      return ListView.builder(
        itemCount: sugestoes.length,
        itemBuilder: (context, index) {

          return ListTile(
            title: Text(sugestoes[index]),
            onTap: (){
              close(context, sugestoes[index]);
            }
          );
        },
      );
    } else {
      return Center(
        child: Text('Nada a exibir'),
      );
    }
  }
}
