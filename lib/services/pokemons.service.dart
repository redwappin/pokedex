import 'package:pokemouille/models/EvolutionChain.model.dart';
import 'package:pokemouille/models/Pokemon.model.dart';
import 'package:pokemouille/models/PokemonGeneration.model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert'; // for converting JSON
import 'dart:async';

import 'package:pokemouille/models/Stat.model.dart'; // for async/await

String baseUrl = "https://pokeapi.co/api/v2/";

// This method gets 100 posts from JSON Placeholder (https://jsonplaceholder.typicode.com/posts)
// The return type of the function needs to be Future<return Type>, in this case it is Future<List<Post>> because it returns a list of Posts
// The future is for async processes and dynamic accepts all types
// If you know what data type is returned, you can use that 
// The function also needs to be async
Future<dynamic> getGenerations() async {
  String url = baseUrl +"generation";

  // return type is http.Response
  // for examples with headers, check api_post
  http.Response response = await http.get(Uri.parse(url));

  // check response status code
  if (response.statusCode == 200) {
    // the response body
    String responseBody = response.body;

    // use dart:convert to decode JSON
    dynamic decodedJson = json.decode(responseBody);

    return decodedJson;
  } else {
    print("ERROR in getting post: status code: " + response.statusCode.toString());
  }
  return response;
}

Future<PokemonModel> getPokemon(String name) async{
    
    String url = baseUrl +"pokemon-species/"+name;

    
    List<http.Response> responses = await Future.wait([http.get(Uri.parse(url)), http.get(Uri.parse(baseUrl + "pokemon/"+ name))]);

    try{
      dynamic speciesBody = json.decode(responses[0].body);
      dynamic pokemonFormBody = json.decode(responses[1].body);

      List<dynamic> types = pokemonFormBody["types"];
      List<dynamic> names = speciesBody["names"];
      List<dynamic> flavorTextEntries = speciesBody["flavor_text_entries"];
      dynamic sprites = pokemonFormBody["sprites"];
      String color = speciesBody["color"]["name"];
      String evolutionChain = speciesBody["evolution_chain"]["url"];
      int height = pokemonFormBody["height"];
      int weight = pokemonFormBody["weight"];

    return PokemonModel(pokemonFormBody["id"],name, names ,types, flavorTextEntries, sprites, color, evolutionChain, height, weight);
    }catch(e){
      throw Exception("ERROR in getting post: status code:");
    }
  // return type is http.Response
  // for examples with headers, check api_post
}

Future<List<PokemonStatModel>> getStatistics(String name) async{

    try{

    http.Response  pokemonResponse = await http.get(Uri.parse(baseUrl + "pokemon/"+ name));


    dynamic res = json.decode(pokemonResponse.body);

    
    List<dynamic> stats = res["stats"];
    List<PokemonStatModel> pokemonStats = [];
    for (dynamic stat in stats) {
        http.Response  languageResponse = await http.get(Uri.parse(stat["stat"]["url"]));
        dynamic languageBody = json.decode(languageResponse.body);
        String statName = languageBody["name"];
        int baseState = stat["base_stat"];
        List<dynamic> names = languageBody["names"];
        StatModel model = StatModel(name: statName , names: names);
        PokemonStatModel statModel = PokemonStatModel(baseStat: baseState, stat: model);
        pokemonStats.add(statModel);
    }
    return pokemonStats;
    }catch(e){
      throw Exception("ERROR in getting get: status code:");
    }
  // return type is http.Response
  // for examples with headers, check api_post
}



Future<Generation> getGeneration(String generation) async {
  String url = baseUrl +"generation/"+generation;

  http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
    // the response body
    String responseBody = response.body;

    // use dart:convert to decode JSON
    dynamic decodedJson = json.decode(responseBody);

    List<dynamic> pokemons = decodedJson["pokemon_species"];
    List<dynamic> names = decodedJson["names"];

    return Generation(generation, names, pokemons);
  } else {
    print("ERROR in getting post: status code: " + response.statusCode.toString());
    throw Exception("ERROR in getting post: status code:");
  }
}


Future<EvolutionChain> getEvolutionChain(String url) async {

  http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
    // the response body
    String responseBody = response.body;

    // use dart:convert to decode JSON
    dynamic decodedJson = json.decode(responseBody);

    EvolutionChain evolutionChain = EvolutionChain.fromMap(decodedJson["chain"]);

    return evolutionChain;

  } else {
    print("ERROR in getting post: status code: " + response.statusCode.toString());
    throw Exception("ERROR in getting post: status code:");
  }
}

Future<List<PokemonModel>> getPokemonsOfEvolutionRow(EvolutionChain row, int index) async {

  List<PokemonModel> pokemons = await Future.wait([getPokemon(row.species.name), getPokemon(row.evolveTo[index].species.name)]);

  return pokemons;
}