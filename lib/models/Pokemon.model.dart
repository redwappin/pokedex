import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokemouille/models/Stat.model.dart';

class PokemonModel {
   // field 
   int id;
   String name; 
   List<dynamic> names;
   List<dynamic> types;
   List<dynamic> flavorTextEntries;
   dynamic sprites;
   String color;
   String evolutionChainUrl;
   int height;
   int weight; 
  PokemonModel(
    this.id,
    this.name,
    this.names,
    this.types,
    this.flavorTextEntries,
    this.sprites,
    this.color,
    this.evolutionChainUrl,
    this.height,
    this.weight,
  ) {
     this.name = name;
   }
 

  PokemonModel copyWith({
    int? id,
    String? name,
    List<dynamic>? names,
    List<dynamic>? types,
    List<dynamic>? flavorTextEntries,
    dynamic? sprites,
    String? color,
    String? evolutionChainUrl,
    int? height,
    int? weight,
  }) {
    return PokemonModel(
      id ?? this.id,
      name ?? this.name,
      names ?? this.names,
      types ?? this.types,
      flavorTextEntries ?? this.flavorTextEntries,
      sprites ?? this.sprites,
      color ?? this.color,
      evolutionChainUrl ?? this.evolutionChainUrl,
      height ?? this.height,
      weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'names': names,
      'types': types,
      'flavorTextEntries': flavorTextEntries,
      'sprites': sprites,
      'color': color,
      'evolutionChainUrl': evolutionChainUrl,
      'height': height,
      'weight': weight,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      List<dynamic>.from(map['names']),
      List<dynamic>.from(map['types']),
      List<dynamic>.from(map['flavorTextEntries']),
      map['sprites'] ?? null,
      map['color'] ?? '',
      map['evolutionChainUrl'] ?? '',
      map['height']?.toInt() ?? 0,
      map['weight']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) => PokemonModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonModel(id: $id, name: $name, names: $names, types: $types, flavorTextEntries: $flavorTextEntries, sprites: $sprites, color: $color, evolutionChainUrl: $evolutionChainUrl, height: $height, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PokemonModel &&
      other.id == id &&
      other.name == name &&
      listEquals(other.names, names) &&
      listEquals(other.types, types) &&
      listEquals(other.flavorTextEntries, flavorTextEntries) &&
      other.sprites == sprites &&
      other.color == color &&
      other.evolutionChainUrl == evolutionChainUrl &&
      other.height == height &&
      other.weight == weight;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      names.hashCode ^
      types.hashCode ^
      flavorTextEntries.hashCode ^
      sprites.hashCode ^
      color.hashCode ^
      evolutionChainUrl.hashCode ^
      height.hashCode ^
      weight.hashCode;
  }
}
