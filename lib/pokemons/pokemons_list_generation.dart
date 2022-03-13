import 'package:flutter/material.dart';

import 'package:pokemouille/components/header.dart';
import 'package:pokemouille/models/PokemonGeneration.model.dart';
import 'package:pokemouille/pokemons/pokemon_card.dart';
import 'package:pokemouille/services/pokemons.service.dart';

import '../constants.dart';

class PokemonListGeneration extends StatefulWidget {
  const PokemonListGeneration({
    Key? key,
    required this.generation,
  }) : super(key: key);

  final Generation generation;
  @override
  State<PokemonListGeneration> createState() => _PokemonListGenerationState(generation: generation);
}

class _PokemonListGenerationState extends State<PokemonListGeneration> {
  Generation generation;

   _PokemonListGenerationState({
    required this.generation,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(children: <Widget>[
        Header(size: size),
        Container(
                  margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child : GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 15,
              mainAxisExtent: 120
            ),
            itemCount: generation.pokemons.length,
            itemBuilder: (BuildContext context, int index){
              return PokemonCard(name: generation.pokemons[index]["name"]);
            })
        )
      ],)
          ));
  }
}



