import 'dart:convert';

import 'package:flutter/foundation.dart';

class Generation {
   // field 
   String name; 
   List<dynamic> names;
   List<dynamic> pokemons;
   
  Generation(
    this.name,
    this.names,
    this.pokemons,
  ) {
     this.name = name;
   }
 

  Generation copyWith({
    String? name,
    List<dynamic>? names,
    List<dynamic>? pokemons,
  }) {
    return Generation(
      name ?? this.name,
      names ?? this.names,
      pokemons ?? this.pokemons,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'names': names,
      'pokemons': pokemons,
    };
  }

  factory Generation.fromMap(Map<String, dynamic> map) {
    return Generation(
      map['name'] ?? '',
      List<dynamic>.from(map['names']),
      List<dynamic>.from(map['pokemons']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Generation.fromJson(String source) => Generation.fromMap(json.decode(source));

  @override
  String toString() => 'Generation(name: $name, names: $names, pokemons: $pokemons)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Generation &&
      other.name == name &&
      listEquals(other.names, names) &&
      listEquals(other.pokemons, pokemons);
  }

  @override
  int get hashCode => name.hashCode ^ names.hashCode ^ pokemons.hashCode;
}
