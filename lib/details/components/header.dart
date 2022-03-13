import 'package:flutter/material.dart';
import 'package:pokemouille/details/components/tabs.dart';

import '../../constants.dart';
import '../../models/Pokemon.model.dart';


class PokemonDetailHeader extends StatelessWidget {
  const PokemonDetailHeader({
    Key? key,
    required this.size, 
    required this.pokemonModel,
  }) : super(key: key);

  final PokemonModel pokemonModel;
  final Size size;

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

    Color pokemonColor =  getColorFromBreed(pokemonModel.color);
    return Container(
      height: size.height ,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            height: size.height * 0.55,
            decoration: BoxDecoration(
              color: pokemonColor,
            ),
            child: Column(
              children: [
                Container(
                padding: EdgeInsets.only(bottom: kDefaultPadding/2, top: kDefaultPadding * 4 ),
                child:                                  Row(
                children: <Widget>[
                  Text(_pokemonName("fr"), style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                  Spacer(),
                  Text("#${pokemonModel.id}", style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                          Row ( 
                          
                          children :List.generate(this.pokemonModel.types.length, (index) {
                              return Container(
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  color: lighten(getColorFromBreed(pokemonModel.color), 0.15),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: EdgeInsets.symmetric( horizontal : kDefaultPadding / 2.5, vertical: kDefaultPadding / 5),
                                margin: EdgeInsets.only( right: kDefaultPadding / 2.5,),
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
              ],)
          ),
          Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              height: size.height * 0.45,
              child: Container(
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36)
                )
              ),
              child: Container(
                margin: EdgeInsets.only(top: kDefaultPadding),
                child: DetailsTabs(pokemonColor: pokemonColor, pokemonModel: pokemonModel,)
              )
            )),
            Positioned(
            bottom: size.height * 0.45,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              // margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              // padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Image.network(this.pokemonModel.sprites["other"]["official-artwork"]["front_default"], scale: 2,)
            ),
          ),
  
        ],
      ),
    );
  }
}