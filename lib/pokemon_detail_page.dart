import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_example_api/data/model/pokemon_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

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
        title: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/png/pokemon.png'),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    onChanged: (v) {
                      // showSearch(
                      //   context: context,
                      //   delegate: PokemonSearchDelegate(
                      //       pokemonListFuture!), // Pass the list of Pokémon
                      // );
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
          ),
        ),
        toolbarHeight: 200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "#${widget.pok.num}",
                  style:
                      TextStyle(color: const Color(0xffF993FB), fontSize: 16),
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
            Container(
              padding: EdgeInsets.only(
                top: 60,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        // width: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 205,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffFC7CFF),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Transform.scale(
                          scale:
                              2.0, // Adjust the scale factor as needed (2.0 for 2x magnification)
                          child: CachedNetworkImage(
                            imageUrl: widget.pok.img,
                            fit: BoxFit
                                .contain, // This ensures the image maintains its aspect ratio
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
