import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_example_api/data/model/pokemon_model.dart';

class PokImg extends StatelessWidget {
  Pokemon pokemon;
   PokImg({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              padding: const EdgeInsets.only(
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
                            imageUrl: pokemon.img,
                            fit: BoxFit
                                .contain, // This ensures the image maintains its aspect ratio
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
