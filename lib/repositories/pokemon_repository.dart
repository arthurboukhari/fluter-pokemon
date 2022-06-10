import 'dart:convert';
import 'package:http/http.dart';
import '../models/pokemon.dart';

class PokemonRepository {
  Future<void> fetchPokemon(String query) async {
    final Response response = await get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$query'));
    print(jsonDecode(response.body));
  }
}
