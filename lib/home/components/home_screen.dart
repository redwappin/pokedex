import 'package:flutter/material.dart';
import 'package:pokemouille/constants.dart';
import 'package:pokemouille/home/components/body.dart';
import 'package:pokemouille/models/PokemonGeneration.model.dart';
import 'package:pokemouille/services/pokemons.service.dart';

import '../../components/bottom_navigationBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    return const Scaffold(
        body: Body(),
        bottomNavigationBar : const BottomNavBar()
    );
  }
}
