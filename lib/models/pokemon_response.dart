//  "count": 327,
//     "next": "https://pokeapi.co/api/v2/ability/?offset=40&limit=20",
//     "previous": "https://pokeapi.co/api/v2/ability/?offset=0&limit=20",
//     "results": [
//         {
//             "name": "suction-cups",
//             "url": "https://pokeapi.co/api/v2/ability/21/"
//         },
//         {
//             "name": "intimidate",
//             "url": "https://pokeapi.co/api/v2/ability/22/"
//         },
//         {
//             "name": "shadow-tag",
//             "url": "https://pokeapi.co/api/v2/ability/23/"
//         },

// class PokemonListing{
//   final int id;
//   final String name;

//   PokemonListing({
//     required this.id,
//     required this.name});

//     factory PokemonListing
// }

// To parse this JSON data, do
//
//     final pokemonResponse = pokemonResponseFromMap(jsonString);

import 'dart:convert';

class PokemonResponse {
  PokemonResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  String? previous;
  List<Result>? results;

  factory PokemonResponse.fromJson(String str) =>
      PokemonResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonResponse.fromMap(Map<String, dynamic> json) => PokemonResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
