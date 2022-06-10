import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projet_pokemon/models/pokemon.dart';
import 'package:projet_pokemon/repositories/pokemon_repository.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final PokemonRepository _pokemonRepository = PokemonRepository();
  Timer? _timer;
  List<Pokemon> _pokemons = [];
  @override

  void initState(){
    super.initState();
    _pokemonRepository.fetchPokemon('?offset=0&limit=1126');
  }
  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon list'), 
      ),
      body: Column(
        children:[
          TextField(
            onChanged: (value) {
              if (value.length >= 3) {
                _timer?.cancel();
                _timer = Timer(const Duration(milliseconds: 500), () {
                  _pokemonRepository.fetchPokemon(value).then((result) {
                    setState(() {
                      // _pokemons = result;
                    });
                  }, onError: (e, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Une erreur est survenue')));
                  });
                });
              }
            },
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: "Nom du pokemon"),
          ),
        ],
      ),
    );
  }
}
