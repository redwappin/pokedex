import 'dart:convert';

import 'package:flutter/foundation.dart';

class PokemonStatModel {
    int baseStat;
    StatModel stat;
  PokemonStatModel({
    required this.baseStat,
    required this.stat,
  });

  PokemonStatModel copyWith({
    int? baseStat,
    StatModel? stat,
  }) {
    return PokemonStatModel(
      baseStat: baseStat ?? this.baseStat,
      stat: stat ?? this.stat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'base_stat': baseStat,
      'stat': stat.toMap(),
    };
  }

  factory PokemonStatModel.fromMap(Map<String, dynamic> map) {
    return PokemonStatModel(
      baseStat: map['base_stat']?.toInt() ?? 0,
      stat: StatModel.fromMap(map['stat']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonStatModel.fromJson(String source) => PokemonStatModel.fromMap(json.decode(source));

  @override
  String toString() => 'PokemonStatModel(baseStat: $baseStat, stat: $stat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PokemonStatModel &&
      other.baseStat == baseStat &&
      other.stat == stat;
  }

  @override
  int get hashCode => baseStat.hashCode ^ stat.hashCode;
}

class StatModel {
    String name;
    List<dynamic> names;
  StatModel({
    required this.name,
    required this.names,
  });

  StatModel copyWith({
    String? name,
    List<dynamic>? names,
  }) {
    return StatModel(
      name: name ?? this.name,
      names: names ?? this.names,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'names': names,
    };
  }

  factory StatModel.fromMap(Map<String, dynamic> map) {
    return StatModel(
      name: map['name'] ?? '',
      names: List<dynamic>.from(map['names']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StatModel.fromJson(String source) => StatModel.fromMap(json.decode(source));

  @override
  String toString() => 'StatModel(name: $name, names: $names)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is StatModel &&
      other.name == name &&
      listEquals(other.names, names);
  }

  @override
  int get hashCode => name.hashCode ^ names.hashCode;
}
