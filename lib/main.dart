import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_example_api/data/model/pokemon_model.dart';
import 'package:pokemon_example_api/data/network/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: PokemonApiProvider().fetchPokemon(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data.pokemon.length,
                        itemBuilder: (BuildContext context, int index) {
                          Pokemon data = snapshot.data.pokemon[index];
                          return Container(
                            child: Column(
                              children: [
                                // SizedBox(
                                //   height: 220,
                                // ),
                                CachedNetworkImage(imageUrl: data.img),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Text("error");
                    }
                    ;
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
