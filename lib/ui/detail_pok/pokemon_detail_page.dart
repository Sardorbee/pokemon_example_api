import 'package:flutter/material.dart';
import 'package:pokemon_example_api/data/model/pokemon_model.dart';
import 'package:pokemon_example_api/ui/detail_pok/widgets/center_roww.dart';
import 'package:pokemon_example_api/ui/detail_pok/widgets/expanded_bottom.dart';
import 'package:pokemon_example_api/ui/detail_pok/widgets/pok_img.dart';
import 'package:pokemon_example_api/ui/search_pok/search_pokemon.dart';

// ignore: must_be_immutable
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
      appBar: AppBar(
        title: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/png/pokemon.png'),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 400,
              child: TextField(
                onTap: () {
                  showSearch(
                            context: context,
                            delegate:
                                PokemonSearchDelegate(), // Pass the list of Pokémon
                          );
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 135,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "#${widget.pok.num}",
                  style:
                      const TextStyle(color: Color(0xffF993FB), fontSize: 16),
                ),
                Flexible(
                  child: Text(
                    widget.pok.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          PokImg(pokemon: widget.pok),
          const SizedBox(
            height: 5,
          ),
          CenterRow(pokemon: widget.pok,),
          const SizedBox(
            height: 5,
          ),
          ExBottom(
            pokemonn: widget.pok,
          ),
        ],
      ),
    );
  }
}
