import 'package:flutter/material.dart';

import '../constants.dart';
import '../details/pokemon_details.dart';
import '../models/Pokemon.model.dart';
import '../services/pokemons.service.dart';

class PokemonCard extends StatefulWidget {

  const PokemonCard({
    Key? key, 
    required this.name,
  }) : super(key: key);

    final String name;

  @override
  State<PokemonCard> createState() => _PokemonCardState(name: name);
}

class _PokemonCardState extends State<PokemonCard>{
  String name;
  late PokemonModel pokemonModel;
   _PokemonCardState({
    required this.name,
  });
 
    Future<PokemonModel> _fetchData() async {
      // get Posts
      PokemonModel pokemon = await getPokemon(name);
      pokemonModel = pokemon;
      return pokemon;
    }

    String _pokemonName(String language ){
      dynamic pok = this.pokemonModel.names.firstWhere((p) => p["language"]["name"]== language);
      return pok["name"];
    }

    Color lighten(Color color, [double amount = .1]) {
      assert(amount >= 0 && amount <= 1);

      final hsl = HSLColor.fromColor(color);
      final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

      return hslLight.toColor();
    }

  @override
  Widget build(BuildContext context) {
            Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: _fetchData(),
      builder: (BuildContext ctx, AsyncSnapshot snapshot){
        if(snapshot.hasData){

        return GestureDetector(
          onTap:  ()  {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => PokemonDetail(size: size, pokemonModel: pokemonModel,)));
    
          },
        child: Container(
            width: 300,  
            height: 700,  
            child: Card(
              elevation: 10,  
              shape: RoundedRectangleBorder(  
                borderRadius: BorderRadius.circular(15.0),  
              ),  
              color: getColorFromBreed(pokemonModel.color),
              child: Column(
                children: <Widget>[
            Padding(
                padding: EdgeInsets.all(kDefaultPadding / 2),
              child:Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: kDefaultPadding / 2), 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                              children: [
                                TextSpan(
                                  text: _pokemonName("fr"),
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)
                                )
                              ]
                          ) ),
                          ],
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Column ( 
                          children :List.generate(this.pokemonModel.types.length, (index) {
                              return Container(
                                
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  color: lighten(getColorFromBreed(pokemonModel.color), 0.15),
                                  borderRadius: BorderRadius.circular(50)
                                ),
                                padding: EdgeInsets.symmetric( horizontal : kDefaultPadding / 2.5, vertical: kDefaultPadding / 5),
                                margin: EdgeInsets.only( bottom: kDefaultPadding / 2.5),
                                child: RichText(text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text : (this.pokemonModel.types[index]["type"]["name"] as String).toUpperCase(),
                                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white)
                                    ),
                                  ]
                                ))
                              );
                            }),
                
                            )
                          ]
                        ),
                        ],
                  ),
                    Positioned(
                      bottom: -12,
                      right: 0,
                      child: Image.network(this.pokemonModel.sprites["other"]["official-artwork"]["front_default"], scale: 5,),
                      )
                  ]))
                ],)
               )
                  
                  ));}
        return Container();
                  });
  }
}
//                     Container(
//   width: MediaQuery.of(context).size.width,
//   height: 100,
//   decoration: BoxDecoration(
//     image: DecorationImage(
//       fit: BoxFit.fitHeight,
//       image: NetworkImage(this.pokemonModel.sprites["front_default"]),
//     ),
//   ),
// )
                    

              //                 Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     Column(
              //       children: List.generate(this.pokemonModel.types.length, (index) {
              //         return Container(
              //           decoration: BoxDecoration(
              //             color: getColorFromBreed(pokemonModel.color).withOpacity(0.2),
              //             borderRadius: BorderRadius.circular(50)
              //           ),
              //           padding: EdgeInsets.all(kDefaultPadding / 2.5),
              //           child: RichText(text: TextSpan(
              //             children: [
              //               TextSpan(
              //                  text : this.pokemonModel.types[index]["type"]["name"] as String,
              //                 style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.white)
              //               ),
              //             ]
              //           ))
              //         );
              //       })
              //     ),
              //     Image.network(this.pokemonModel.sprites["front_default"], height: 200, width: 200)
              //   ],
              // )

