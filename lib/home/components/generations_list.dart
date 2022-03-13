import 'package:flutter/material.dart';

import '../../models/PokemonGeneration.model.dart';
import '../../services/pokemons.service.dart';
import 'generation.dart';


class PokemonGenerationList extends StatefulWidget {
  const PokemonGenerationList({Key? key}) : super(key: key);


  @override
  State<PokemonGenerationList> createState() => _GenerationListState();
}

class _GenerationListState extends State<PokemonGenerationList> {
  late List<dynamic> generations = [];

    Future _fetchData() async {
    // get Posts
    dynamic response = await getGenerations();
    generations = response["results"];
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
              future: _fetchData(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 150
                  ),
                  itemCount: generations.length,
                  itemBuilder: (BuildContext context, int index){
                    return PokemonGeneration(name: generations[index]["name"]);
                  });
              }
              },
          );
  }
}