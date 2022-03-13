
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemouille/constants.dart';

import 'package:pokemouille/details/pokemon_details.dart';
import 'package:pokemouille/models/Pokemon.model.dart';

class PokemonDescriptionWidget extends StatelessWidget {
  final PokemonModel pokemonModel;

  const PokemonDescriptionWidget({
    Key? key,
    required this.pokemonModel,
  }) : super(key: key);

  
  String _flavorText(String language ){
    dynamic text = pokemonModel.flavorTextEntries.firstWhere((p) => p["language"]["name"]== language, orElse: ()=> -1);
    if(text != -1){
      return text["flavor_text"];
    }
    return "".toUpperCase();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child:     Container(
      margin: EdgeInsets.only(top: kDefaultPadding * 2),
      child: Column(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.start,
                text: TextSpan(
                    children: [
                        TextSpan(
                          text: _flavorText("fr"),
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black)
                        )
                    ]
                    ) ),
          Container(
            padding: EdgeInsets.only(top: kDefaultPadding),
            child: Card(
              elevation: 10,  
              shape: RoundedRectangleBorder(  
                borderRadius: BorderRadius.circular(15.0),  
              ),
              child: Container(
                padding: EdgeInsets.all(kDefaultPadding / 2),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                children: [
                                    TextSpan(
                                      text: "Poids",
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 200
                                      , 200, 200))
                                    )
                                ]
                                ) 
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                children: [
                                    TextSpan(
                                      text: "Taille",
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 200
                                      , 200, 200))
                                    )
                                ]
                                ) 
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                children: [
                                    TextSpan(
                                      text: "${pokemonModel.weight / 10} kg",
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black)
                                    )
                                ]
                                ) 
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                children: [
                                    TextSpan(
                                      text: "${pokemonModel.height * 10} cm",
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black)
                                    )
                                ]
                                ) 
                          ),
                      ],
                    ),
                  ],
                ),

              ),
              
              ), 
               
          )
        ]),
    )
    );
    
  }
  
}
