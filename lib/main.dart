import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_example_api/data/model/pokemon_model.dart';
import 'package:pokemon_example_api/data/network/api.dart';
import 'package:pokemon_example_api/ui/detail_pok/pokemon_detail_page.dart';
import 'package:pokemon_example_api/ui/detail_pok/search_pok/search_pokemon.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //  List<Pokemon>? pokemonListFuture;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
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
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return FutureBuilder(
                    future: PokemonApiProvider().fetchPokemon(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        Pokemon data = snapshot.data.pokemon[index];
                        
                        return Container(
                          padding: const EdgeInsets.all(16),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 175,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    height: 115,
                                    width: 175,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffFC7CFF),
                                    ),
                                  ),
                                ],
                              ),
                              ZoomTapAnimation(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Pokemondetail(pok: data),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: CachedNetworkImage(
                                        imageUrl: data.img,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      height: 30,
                                      width: 125,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xff676767),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "#${data.num}",
                                            style: const TextStyle(
                                              color: Color(0xffF993FB),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              data.name,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const Text("error");
                      }
                    },
                  );
                },
                childCount: 151, // Replace with the desired count
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  final List<Pokemon> pokemonList;

  MyCustomWidget({required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    // Use the pokemonList data here as needed
    return Container();
  }
}
