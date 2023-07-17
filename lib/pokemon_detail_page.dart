import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_example_api/data/model/pokemon_model.dart';

class Pokemondetail extends StatefulWidget {
  Pokemon pok;
  Pokemondetail({super.key, required this.pok});

  @override
  State<Pokemondetail> createState() => _PokemondetailState();
}

class _PokemondetailState extends State<Pokemondetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [CachedNetworkImage(imageUrl: widget.pok.img)],
      ),
    );
  }
}
