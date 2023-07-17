
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_example_api/data/model/pokemon_model.dart';

class PokemonApiProvider {
  final String apiUrl = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"; // Replace with the actual API URL

  Future<PokemonModel> fetchPokemon() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return PokemonModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch Pokemon');
    }
  }
}


