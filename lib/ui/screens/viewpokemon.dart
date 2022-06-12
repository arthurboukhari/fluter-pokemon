import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projet_pokemon/models/pokemon.dart';
import 'package:projet_pokemon/repositories/pokemon_repository.dart';

class ViewPokemon extends StatefulWidget {
  const ViewPokemon({Key? key}) : super(key: key);
  @override
  State<ViewPokemon> createState() => _viewPokemonState();
}

class _viewPokemonState extends State<ViewPokemon> {
  Widget build(BuildContext context) {
    Pokemon _pokemon = ModalRoute.of(context)?.settings.arguments as Pokemon;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon view'), 
      ),
      body: Column(
        children:[
          Text(
            _pokemon.name
          ),
          Image
          (
            image:  NetworkImage(_pokemon.skin),
            height: 100,
            width: 100,
          ),
        
          Text(
            "Shiny" + _pokemon.name +'!'
          ),
          Image
          (
            image:  NetworkImage(_pokemon.skin_shiny),
            height: 100,
            width: 100,
          ),
          Text(
            "Stats" + _pokemon.name +'!'
          ),
          Image
          (
            image:  NetworkImage(_pokemon.skin_shiny),
            height: 100,
            width: 100,
          ),
          
        ],
      ),
    );
  }
}
