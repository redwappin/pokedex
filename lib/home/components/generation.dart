import 'package:flutter/material.dart';

import 'package:pokemouille/constants.dart';
import 'package:pokemouille/services/pokemons.service.dart';

import '../../models/PokemonGeneration.model.dart';
import '../../pokemons/pokemons_list_generation.dart';


class PokemonGeneration extends StatefulWidget {

  const PokemonGeneration({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

 @override
  State<PokemonGeneration> createState() => _PokemonGenerationState(name: name);
}

class _PokemonGenerationState extends State<PokemonGeneration> {
  late Generation generation;
  final String name;
   _PokemonGenerationState({
    required this.name,
  });

    Future<Generation> _fetchData() async {
      // get Generation
      Generation g = await getGeneration(name);
      generation = g;
      return g;
  }

  String _generationName(String language ){
    dynamic gen = generation.names.firstWhere((p) => p["language"]["name"]== "fr", orElse: ()=> -1);
    if(gen != -1){
      return gen["name"];
    }
    return generation.name.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          FutureBuilder(
            future: _fetchData(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot){
              if (!snapshot.hasData) {
                return Container();
              }
              else{
                return GestureDetector(
                  onTap:  ()  {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => PokemonListGeneration(generation:generation)));
    
                  },
                  child: Container(
                    padding: EdgeInsets.all(kDefaultPadding / 2),
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0,10),
                        blurRadius: 20,
                        color: kPrimaryColor.withOpacity(0.2)
                      )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                text: _generationName("fr"),
                                style: Theme.of(context).textTheme.button,
                              ),
                            ]
                        ))
                      ],
                    ),
                  ),
                );
              }
            },
          )
      ]),
    );
  }

}