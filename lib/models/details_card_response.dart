// To parse this JSON data, do
//
//     final pokeInfoResponse = pokeInfoResponseFromMap(jsonString);

import 'dart:convert';

class DetailsCardResponse {
  DetailsCardResponse({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.weight,
  });

  List<Ability>? abilities;
  int? baseExperience;
  List<Species>? forms;
  List<GameIndex>? gameIndices;
  int? height;
  List<dynamic>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  String? name;
  int? order;
  List<dynamic>? pastTypes;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

  factory DetailsCardResponse.fromJson(String str) =>
      DetailsCardResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailsCardResponse.fromMap(Map<String, dynamic> json) =>
      DetailsCardResponse(
        abilities: json["abilities"] == null
            ? []
            : List<Ability>.from(
                json["abilities"].map((x) => Ability.fromMap(x))),
        baseExperience: json["base_experience"],
        forms: List<Species>.from(json["forms"].map((x) => Species.fromMap(x))),
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        name: json["name"],
        order: json["order"],
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: Species.fromMap(json["species"]),
        sprites: Sprites.fromMap(json["sprites"]),
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "abilities": List<dynamic>.from(abilities!.map((x) => x.toMap())),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms!.map((x) => x.toMap())),
        "game_indices": List<dynamic>.from(gameIndices!.map((x) => x.toMap())),
        "height": height,
        "held_items": List<dynamic>.from(heldItems!.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "name": name,
        "order": order,
        "past_types": List<dynamic>.from(pastTypes!.map((x) => x)),
        "species": species!.toMap(),
        "sprites": sprites!.toMap(),
        "stats": List<dynamic>.from(stats!.map((x) => x.toMap())),
        "types": List<dynamic>.from(types!.map((x) => x.toMap())),
        "weight": weight,
      };
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  Species? ability;
  bool? isHidden;
  int? slot;

  factory Ability.fromJson(String str) => Ability.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        ability: Species.fromMap(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toMap() => {
        "ability": ability!.toMap(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class GameIndex {
  GameIndex({
    this.gameIndex,
    this.version,
  });

  int? gameIndex;
  Species? version;

  factory GameIndex.fromJson(String str) => GameIndex.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromMap(json["version"]),
      );

  Map<String, dynamic> toMap() => {
        "game_index": gameIndex,
        "version": version!.toMap(),
      };
}

class GenerationV {
  GenerationV({
    this.blackWhite,
  });

  Sprites? blackWhite;

  factory GenerationV.fromJson(String str) =>
      GenerationV.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationV.fromMap(Map<String, dynamic> json) => GenerationV(
        blackWhite: Sprites.fromMap(json["black-white"]),
      );

  Map<String, dynamic> toMap() => {
        "black-white": blackWhite!.toMap(),
      };
}

class GenerationIv {
  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  Sprites? diamondPearl;
  Sprites? heartgoldSoulsilver;
  Sprites? platinum;

  factory GenerationIv.fromJson(String str) =>
      GenerationIv.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationIv.fromMap(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: Sprites.fromMap(json["diamond-pearl"]),
        heartgoldSoulsilver: Sprites.fromMap(json["heartgold-soulsilver"]),
        platinum: Sprites.fromMap(json["platinum"]),
      );

  Map<String, dynamic> toMap() => {
        "diamond-pearl": diamondPearl!.toMap(),
        "heartgold-soulsilver": heartgoldSoulsilver!.toMap(),
        "platinum": platinum!.toMap(),
      };
}

class Versions {
  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  GenerationI? generationI;
  GenerationIi? generationIi;
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationV? generationV;
  Map<String, Home>? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  factory Versions.fromJson(String str) => Versions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Versions.fromMap(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromMap(json["generation-i"]),
        generationIi: GenerationIi.fromMap(json["generation-ii"]),
        generationIii: GenerationIii.fromMap(json["generation-iii"]),
        generationIv: GenerationIv.fromMap(json["generation-iv"]),
        generationV: GenerationV.fromMap(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"])
            .map((k, v) => MapEntry<String, Home>(k, Home.fromMap(v))),
        generationVii: GenerationVii.fromMap(json["generation-vii"]),
        generationViii: GenerationViii.fromMap(json["generation-viii"]),
      );

  Map<String, dynamic> toMap() => {
        "generation-i": generationI!.toMap(),
        "generation-ii": generationIi!.toMap(),
        "generation-iii": generationIii!.toMap(),
        "generation-iv": generationIv!.toMap(),
        "generation-v": generationV!.toMap(),
        "generation-vi": Map.from(generationVi!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "generation-vii": generationVii!.toMap(),
        "generation-viii": generationViii!.toMap(),
      };
}

class Sprites {
  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  String? backDefault;
  dynamic? backFemale;
  String? backShiny;
  dynamic? backShinyFemale;
  String? frontDefault;
  dynamic? frontFemale;
  String? frontShiny;
  dynamic? frontShinyFemale;
  Other? other;
  Versions? versions;
  Sprites? animated;

  factory Sprites.fromJson(String str) => Sprites.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromMap(json["other"]),
        versions: json["versions"] == null
            ? null
            : Versions.fromMap(json["versions"]),
        animated:
            json["animated"] == null ? null : Sprites.fromMap(json["animated"]),
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other == null ? null : other!.toMap(),
        "versions": versions == null ? null : versions!.toMap(),
        "animated": animated == null ? null : animated!.toMap(),
      };
}

class GenerationI {
  GenerationI({
    this.redBlue,
    this.yellow,
  });

  RedBlue? redBlue;
  RedBlue? yellow;

  factory GenerationI.fromJson(String str) =>
      GenerationI.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationI.fromMap(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromMap(json["red-blue"]),
        yellow: RedBlue.fromMap(json["yellow"]),
      );

  Map<String, dynamic> toMap() => {
        "red-blue": redBlue!.toMap(),
        "yellow": yellow!.toMap(),
      };
}

class RedBlue {
  RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  String? backDefault;
  String? backGray;
  String? backTransparent;
  String? frontDefault;
  String? frontGray;
  String? frontTransparent;

  factory RedBlue.fromJson(String str) => RedBlue.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RedBlue.fromMap(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_gray": frontGray,
        "front_transparent": frontTransparent,
      };
}

class GenerationIi {
  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  Crystal? crystal;
  Gold? gold;
  Gold? silver;

  factory GenerationIi.fromJson(String str) =>
      GenerationIi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationIi.fromMap(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromMap(json["crystal"]),
        gold: Gold.fromMap(json["gold"]),
        silver: Gold.fromMap(json["silver"]),
      );

  Map<String, dynamic> toMap() => {
        "crystal": crystal!.toMap(),
        "gold": gold!.toMap(),
        "silver": silver!.toMap(),
      };
}

class Crystal {
  Crystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  String? backDefault;
  String? backShiny;
  String? backShinyTransparent;
  String? backTransparent;
  String? frontDefault;
  String? frontShiny;
  String? frontShinyTransparent;
  String? frontTransparent;

  factory Crystal.fromJson(String str) => Crystal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Crystal.fromMap(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        backShinyTransparent: json["back_shiny_transparent"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontShinyTransparent: json["front_shiny_transparent"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "back_shiny_transparent": backShinyTransparent,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_shiny_transparent": frontShinyTransparent,
        "front_transparent": frontTransparent,
      };
}

class Gold {
  Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  factory Gold.fromJson(String str) => Gold.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gold.fromMap(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontTransparent: json["front_transparent"] == null
            ? null
            : json["front_transparent"],
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_transparent": frontTransparent == null ? null : frontTransparent,
      };
}

class GenerationIii {
  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  Emerald? emerald;
  Gold? fireredLeafgreen;
  Gold? rubySapphire;

  factory GenerationIii.fromJson(String str) =>
      GenerationIii.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationIii.fromMap(Map<String, dynamic> json) => GenerationIii(
        emerald: Emerald.fromMap(json["emerald"]),
        fireredLeafgreen: Gold.fromMap(json["firered-leafgreen"]),
        rubySapphire: Gold.fromMap(json["ruby-sapphire"]),
      );

  Map<String, dynamic> toMap() => {
        "emerald": emerald!.toMap(),
        "firered-leafgreen": fireredLeafgreen!.toMap(),
        "ruby-sapphire": rubySapphire!.toMap(),
      };
}

class Emerald {
  Emerald({
    this.frontDefault,
    this.frontShiny,
  });

  String? frontDefault;
  String? frontShiny;

  factory Emerald.fromJson(String str) => Emerald.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Emerald.fromMap(Map<String, dynamic> json) => Emerald(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  Home({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  factory Home.fromJson(String str) => Home.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Home.fromMap(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class GenerationVii {
  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  DreamWorld? icons;
  Home? ultraSunUltraMoon;

  factory GenerationVii.fromJson(String str) =>
      GenerationVii.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationVii.fromMap(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromMap(json["icons"]),
        ultraSunUltraMoon: Home.fromMap(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toMap() => {
        "icons": icons!.toMap(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon!.toMap(),
      };
}

class DreamWorld {
  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  String? frontDefault;
  dynamic? frontFemale;

  factory DreamWorld.fromJson(String str) =>
      DreamWorld.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DreamWorld.fromMap(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class GenerationViii {
  GenerationViii({
    this.icons,
  });

  DreamWorld? icons;

  factory GenerationViii.fromJson(String str) =>
      GenerationViii.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenerationViii.fromMap(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromMap(json["icons"]),
      );

  Map<String, dynamic> toMap() => {
        "icons": icons!.toMap(),
      };
}

class Other {
  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;

  factory Other.fromJson(String str) => Other.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Other.fromMap(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromMap(json["dream_world"]),
        home: Home.fromMap(json["home"]),
        officialArtwork: OfficialArtwork.fromMap(json["official-artwork"]),
      );

  Map<String, dynamic> toMap() => {
        "dream_world": dreamWorld!.toMap(),
        "home": home!.toMap(),
        "official-artwork": officialArtwork!.toMap(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
  });

  String? frontDefault;

  factory OfficialArtwork.fromJson(String str) =>
      OfficialArtwork.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
      };
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int? baseStat;
  int? effort;
  Species? stat;

  factory Stat.fromJson(String str) => Stat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromMap(json["stat"]),
      );

  Map<String, dynamic> toMap() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat!.toMap(),
      };
}

class Type {
  Type({
    this.slot,
    this.type,
  });

  int? slot;
  Species? type;

  factory Type.fromJson(String str) => Type.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromMap(json["type"]),
      );

  Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type!.toMap(),
      };
}
