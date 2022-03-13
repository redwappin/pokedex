import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pokemouille/constants.dart';
import 'package:pokemouille/models/Pokemon.model.dart';
import 'package:pokemouille/models/Stat.model.dart';
import 'package:pokemouille/services/pokemons.service.dart';

class BaseStats extends StatefulWidget {
  const BaseStats({Key? key, required this.name, }) : super(key: key);

  final String name;
  @override
  _BaseStatsState createState() => _BaseStatsState(name: name);
}


class _BaseStatsState extends State<BaseStats> {

  final String name;
  late int total = 0;
  late List<PokemonStatModel> pokemonStats;
   _BaseStatsState({
    required this.name,
  });


  Future<List<PokemonStatModel>> _fetchData() async {
      // get Generation
      List<PokemonStatModel> pokemonStatModels = await getStatistics(name);
      pokemonStats = pokemonStatModels;
      total = calculateTotal();
      return pokemonStatModels;
  }

    String _statName(PokemonStatModel pokemonStatModel , String language ){
    dynamic stat = pokemonStatModel.stat.names.firstWhere((p) => p["language"]["name"]== language, orElse: ()=> -1);
    if(stat != -1){
      return stat["name"];
    }
    return stat.name.toUpperCase();
  }

  int calculateTotal(){
    int total = 0;
    pokemonStats.forEach((stat) { 
      total += stat.baseStat;
     });
    return total;
  }
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return FutureBuilder(      
      future: _fetchData(),
      builder: (BuildContext ctx, AsyncSnapshot snapshot){
        if (!snapshot.hasData) {
          return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
          );
        }
        else {
          return SingleChildScrollView(
            child: Container(
            child:  Column(
            children:
              List.generate(pokemonStats.length, (index) {
                return Container(
                     padding: EdgeInsets.only(top : kDefaultPadding),
                     child: Row(
                       children: <Widget>[
                          RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                              children: [
                                TextSpan(
                                  text: _statName(pokemonStats[index], "fr"),
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 184, 178, 178))
                                )
                              ]
                          ) ),
                          Spacer(),
                          LinearPercentIndicator( //leaner progress bar
                              width: size.width * 0.5, //width for progress bar
                              animation: true, //animation to show progress at first
                              animationDuration: 500,
                              lineHeight: 4.0, //height of progress bar
                              leading: Padding( //prefix content
                                padding: EdgeInsets.only(right:15),
                                child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                              children: [
                                TextSpan(
                                  text: pokemonStats[index].baseStat.toString(),
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                                )
                              ]
                                ) )),
                              percent: pokemonStats[index].baseStat/255, // 30/100 = 0.3
                              linearStrokeCap: LinearStrokeCap.roundAll, //make round cap at start and end both
                              progressColor: Colors.redAccent, //percentage progress bar color
                              backgroundColor: Color.fromARGB(255, 221, 221, 221),  //background progressbar color
                            ),
                       ],

                     ),
                  );
              })
          ) ,

          ),) ;
        }
      });
}}

    
