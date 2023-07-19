import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_example_api/data/model/pokemon_model.dart';
import 'package:pokemon_example_api/data/network/api.dart';
import 'package:pokemon_example_api/ui/detail_pok/pokemon_detail_page.dart';
import 'package:pokemon_example_api/ui/home/home_page.dart';
import 'package:pokemon_example_api/ui/search_pok/search_pokemon.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
