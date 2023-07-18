
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_example_api/ui/detail_pok/pokemon_detail_page.dart';

import '../../../data/model/pokemon_model.dart';

class PokemonSearchDelegate extends SearchDelegate<Pokemon> {
  final List<Pokemon> pokemonList; // Pass the list of Pokémon from the main page

  PokemonSearchDelegate(this.pokemonList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    // Customize the theme of the search bar
    final theme = Theme.of(context);
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: Colors.deepPurple, // Customize the search bar color
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // Add actions to the app bar (e.g., clear search query button)
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the app bar (e.g., back button)
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, pokemonList.first);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Build search results based on the query
    final results = pokemonList
        .where((pokemon) => pokemon.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildSearchResults(context, results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Build search suggestions based on the query (not implemented in this example)
    return Container();
  }

  Widget _buildSearchResults(BuildContext context, List<Pokemon> results) {
    if (results.isEmpty) {
      return Center(
        child: Text('No results found.'),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final pokemon = results[index];

        return ListTile(
          leading: CachedNetworkImage(
            imageUrl: pokemon.img,
          ),
          title: Text(pokemon.name),
          onTap: () {
            // When a search result is tapped, navigate to the details page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Pokemondetail(pok: pokemon),
              ),
            );
          },
        );
      },
    );
  }
}
