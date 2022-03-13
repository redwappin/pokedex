import 'package:flutter/material.dart';
import 'package:pokemouille/constants.dart';
import 'package:pokemouille/home/components/generation.dart';
import 'package:pokemouille/home/components/generations_list.dart';

import '../../components/header.dart';
import '../../models/PokemonGeneration.model.dart';
import '../../services/pokemons.service.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child : Column(
        children: <Widget>[
          Header(size: size),
          const PokemonGenerationList()
        ],
      )
    );
  }
}


