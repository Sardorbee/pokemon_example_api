import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokemon_example_api/data/model/pokemon_model.dart';
import 'package:pokemon_example_api/ui/detail_pok/pokemon_detail_page.dart';

class PokemonSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: Text('Search is not implemented yet.'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: fetchPokemonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading data.'),
          );
        } else {
          final List<Pokemon> pokemonList = snapshot.data!;
          final List<Pokemon> suggestionList = query.isEmpty
              ? pokemonList
              : pokemonList
                  .where((pokemon) => pokemon.name
                      .toLowerCase()
                      .startsWith(query.toLowerCase()))
                  .toList();

          return ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(suggestionList[index].img),
                title: Text(suggestionList[index].name),
                onTap: () {
                  close(context, suggestionList[index].name);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Pokemondetail(pok: suggestionList[index]),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }

  Future<List<Pokemon>> fetchPokemonData() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['pokemon'];
      return data.map((json) => Pokemon.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
