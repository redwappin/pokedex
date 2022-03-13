import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemouille/constants.dart';

import 'package:pokemouille/models/EvolutionChain.model.dart';
import 'package:pokemouille/models/Pokemon.model.dart';
import 'package:pokemouille/services/pokemons.service.dart';

class EvolutionRowWidget extends StatelessWidget {
  
  final EvolutionChain currentEvolutionChain;
  final int index;
  const EvolutionRowWidget({
    Key? key,
    required this.currentEvolutionChain, required this.index,
  }) : super(key: key);

  Future<List<PokemonModel>> _fetchData() async {
      // get each pokemon
      List<PokemonModel> pokemons = await getPokemonsOfEvolutionRow(currentEvolutionChain, index);
      return pokemons;
  }

  String _pokemonName(PokemonModel pokemonModel , String language ){
      dynamic pok = pokemonModel.names.firstWhere((p) => p["language"]["name"]== language);
      return pok["name"];
    }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: FutureBuilder(
            future: _fetchData(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return Container(
                  padding: EdgeInsets.only(top: kDefaultPadding),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget> [
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                        children: [
                        Container(
                          padding: EdgeInsets.only(bottom: kDefaultPadding / 2),
                          child: Image.network(snapshot.data[0].sprites["other"]["official-artwork"]["front_default"], scale: 6,),
                        ), 
                        RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                        children: [
                          TextSpan(
                            text: _pokemonName(snapshot.data[0] ,"fr"),
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                          ),
                        ]
                        )),
                    ],)),),
                    Flexible(
                      flex: 1,
                      child: Column(
                      children: [
                        Container(
                           padding: EdgeInsets.only(bottom: kDefaultPadding / 2),
                          child:  Icon(
                            CupertinoIcons.arrow_right,
                            color: Color.fromARGB(255, 212, 210, 210),
                            size: 30.0,
                          ),
                        ),
                        RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Lvl ${currentEvolutionChain.evolveTo[index].evolutionDetails[0].minLevel}",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                          ),
                        ]
                        )),
                      ],
                    ),),
                    Flexible(
                      flex: 1,
                      child:Column(children: [
                        Container(
                          padding: EdgeInsets.only(bottom: kDefaultPadding / 2),
                          child: Image.network(snapshot.data[1].sprites["other"]["official-artwork"]["front_default"], scale: 6,),
                        ), 
                        RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                        children: [
                          TextSpan(
                            text: _pokemonName(snapshot.data[1] ,"fr"),
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                          ),
                        ]
                        )),
                    ],),
                  ),
                  ]),
                );  
              }
              else{
                return Container();
              }
            }
          ));
  }

}
