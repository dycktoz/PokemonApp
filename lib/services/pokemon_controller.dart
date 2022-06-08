import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poke_app/models/details_card_response.dart';
import 'package:poke_app/models/pokemon_response.dart';

class PokemonController {
  final baseUrl = 'https://pokeapi.co';
  final client = http.Client();

  Future<PokemonResponse> getPokemonPage(int pageIndex) async {
    final uri =
        Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=150&offset=100');
    // final uri = Uri.http(baseUrl, 'api/v2/ability', queryParameters);
    final response = await client.get(uri);

    return PokemonResponse.fromJson(response.body);
  }

  Future<DetailsCardResponse> getpokemoninfo(String urlPokemon) async {
    final uri = Uri.parse(urlPokemon);
    // final uri = Uri.http(baseUrl, 'api/v2/ability', queryParameters);
    final response = await client.get(uri);

    return DetailsCardResponse.fromJson(response.body);
  }
}
