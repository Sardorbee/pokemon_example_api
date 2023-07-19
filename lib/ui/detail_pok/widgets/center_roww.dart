import 'package:flutter/material.dart';
import 'package:pokemon_example_api/data/model/pokemon_model.dart';
import 'package:pokemon_example_api/ui/utils/colorlist.dart';

class CenterRow extends StatelessWidget {
  Pokemon pokemon;
  CenterRow({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...List.generate(pokemon.type.length, (index) {
              final data = pokemon.type[index];
              Color? typeColor = typeColors[data];
              if (typeColor == null) {
                // Handle the case where the type is not found in the map
                typeColor = Colors.grey;
              }
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: typeColor,
                ),
                margin: const EdgeInsets.all(5),
                width: 185,
                child: Container(
                  height: 20,
                  width: 150,
                  child: Center(
                    child: Text(data),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
