import 'package:flutter/material.dart';
import 'package:pokemouille/details/components/header.dart';

import '../constants.dart';
import '../models/Pokemon.model.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({
    Key? key,
    required this.size, 
    required this.pokemonModel,
  }) : super(key: key);

  final PokemonModel pokemonModel;
  final Size size;


  
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Stack(

      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
              elevation: 0, //
          ),
          body: SingleChildScrollView(
          child: Stack(
            children: [
              PokemonDetailHeader(size: size, pokemonModel: pokemonModel),
            ],
          )
      ),
        ),
      ],
    );
    

  }
}