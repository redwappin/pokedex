import 'dart:convert';

import 'package:flutter/foundation.dart';

class EvolutionChain {
  List<EvolutionDetail> evolutionDetails;
  List<EvolutionChain> evolveTo;
  Species species;
  EvolutionChain({
    required this.evolutionDetails,
    required this.evolveTo,
    required this.species,
  });

  EvolutionChain copyWith({
    List<EvolutionDetail>? evolutionDetails,
    List<EvolutionChain>? evolveTo,
    Species? species,
  }) {
    return EvolutionChain(
      evolutionDetails: evolutionDetails ?? this.evolutionDetails,
      evolveTo: evolveTo ?? this.evolveTo,
      species: species ?? this.species,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'evolution_details': evolutionDetails.map((x) => x.toMap()).toList(),
      'evolves_to': evolveTo.map((x) => x.toMap()).toList(),
      'species': species.toMap(),
    };
  }

  factory EvolutionChain.fromMap(Map<String, dynamic> map) {
    return EvolutionChain(
      evolutionDetails: List<EvolutionDetail>.from(map['evolution_details']?.map((x) => EvolutionDetail.fromMap(x))),
      evolveTo: List<EvolutionChain>.from(map['evolves_to']?.map((x) => EvolutionChain.fromMap(x))),
      species: Species.fromMap(map['species']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionChain.fromJson(String source) => EvolutionChain.fromMap(json.decode(source));

  @override
  String toString() => 'EvolutionChain(evolutionDetails: $evolutionDetails, evolveTo: $evolveTo, species: $species)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is EvolutionChain &&
      listEquals(other.evolutionDetails, evolutionDetails) &&
      listEquals(other.evolveTo, evolveTo) &&
      other.species == species;
  }

  @override
  int get hashCode => evolutionDetails.hashCode ^ evolveTo.hashCode ^ species.hashCode;
}

class EvolutionDetail {
  int minLevel;
  EvolutionDetail({
    required this.minLevel,
  });

  EvolutionDetail copyWith({
    int? minLevel,
  }) {
    return EvolutionDetail(
      minLevel: minLevel ?? this.minLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'min_level': minLevel,
    };
  }

  factory EvolutionDetail.fromMap(Map<String, dynamic> map) {
    return EvolutionDetail(
      minLevel: map['min_level']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory EvolutionDetail.fromJson(String source) => EvolutionDetail.fromMap(json.decode(source));

  @override
  String toString() => 'EvolutionDetail(minLevel: $minLevel)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is EvolutionDetail &&
      other.minLevel == minLevel;
  }

  @override
  int get hashCode => minLevel.hashCode;
}

class Species {
  String name;
  String url;
  Species({
    required this.name,
    required this.url,
  });

  Species copyWith({
    String? name,
    String? url,
  }) {
    return Species(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Species.fromMap(Map<String, dynamic> map) {
    return Species(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Species.fromJson(String source) => Species.fromMap(json.decode(source));

  @override
  String toString() => 'Species(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Species &&
      other.name == name &&
      other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
