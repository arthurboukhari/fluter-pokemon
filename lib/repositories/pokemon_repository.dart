import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import '../models/pokemon.dart';

class PokemonRepository {
  Future<List<Pokemon>> fetchPokemon(String query) async {
    final Response response = await get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$query'));
    final List<Pokemon> pokemon = [];
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> datas = json['_data'];
        for (Map<String, dynamic> data in datas) {
          pokemon.add(Pokemon.fromGeoJson(data));
        }
    
      return pokemon;

    }
    return pokemon;
  }
}
