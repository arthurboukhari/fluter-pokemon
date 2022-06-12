import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projet_pokemon/models/pokemon.dart';
import 'package:projet_pokemon/repositories/pokemon_repository.dart';
import 'package:projet_pokemon/ui/screens/viewpokemon.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final PokemonRepository _pokemonRepository = PokemonRepository();
  final TextEditingController _nameEditingController = TextEditingController();

  List<Pokemon> _pokemons = [];
  Timer? _timer;
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
            controller: _nameEditingController,
            onChanged: (value) {
              if (value.length >= 3) {
                _timer?.cancel();
                _timer = Timer(const Duration(milliseconds: 500), () {
                  _pokemonRepository.fetchPokemon(value).then((result) {
                    setState(() {
                      _pokemons = result;
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
              labelText: "Nom du pokemon"
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _pokemons.length,
              itemBuilder: (context, index) {
                final Pokemon pokemon = _pokemons[index];
                return ListTile(
                  onTap: () => Navigator.pushNamed(context, "/viewPokemon", arguments: pokemon),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(pokemon.skin),
                  ),
                  title: Text(
                    '${pokemon.name}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    pokemon.types.forEach((value)=>
                      '${value.name}',
                    )
                  ),
                );
              }
            )
          )
        ],
      ),
    );
  }
}
