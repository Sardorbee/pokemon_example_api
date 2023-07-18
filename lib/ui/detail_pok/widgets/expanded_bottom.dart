import 'package:flutter/material.dart';
import 'package:pokemon_example_api/data/model/pokemon_model.dart';
import 'package:pokemon_example_api/ui/utils/colorlist.dart';

class ExBottom extends StatelessWidget {
  Pokemon pokemonn;
   ExBottom({super.key, required this.pokemonn});

  @override
  Expanded build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              25,
            ),
            topRight: Radius.circular(
              25,
            ),
          ),
          color: Color(0xffFA5AFD),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Text(
                      pokemonn.height.toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(
                            160,
                            255,
                            255,
                            255,
                          ),
                          fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Candy",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      pokemonn.candy,
                      style: const TextStyle(
                          color: Color.fromARGB(
                            160,
                            255,
                            255,
                            255,
                          ),
                          fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Weaknessess",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    ...List.generate(pokemonn.weaknesses.length, (index) {
                      final dataa = pokemonn.weaknesses[index];
                      Color? typeColor = typeColors[dataa];
                      return Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: typeColor),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            dataa,
                            style: const TextStyle(
                                color: Color.fromARGB(
                                  160,
                                  255,
                                  255,
                                  255,
                                ),
                                fontSize: 18),
                          ),
                        ],
                      );
                    })
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Weight",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      pokemonn.weight.toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(
                            160,
                            255,
                            255,
                            255,
                          ),
                          fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Spawn chance",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "${pokemonn.spawnChance.toString()}%",
                      style: const TextStyle(
                          color: Color.fromARGB(
                            160,
                            255,
                            255,
                            255,
                          ),
                          fontSize: 18),
                    ),
                    const Text(
                      '',
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
              ],
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Egg",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        pokemonn.egg,
                        style: const TextStyle(
                            color: Color.fromARGB(
                              160,
                              255,
                              255,
                              255,
                            ),
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Container(
                    child: Image.asset('assets/png/2.png'),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
