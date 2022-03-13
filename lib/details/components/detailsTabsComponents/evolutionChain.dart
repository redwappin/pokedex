import 'package:flutter/material.dart';
import 'package:pokemouille/constants.dart';
import 'package:pokemouille/details/components/detailsTabsComponents/evolutionRow.dart';
import 'package:pokemouille/models/EvolutionChain.model.dart';
import 'package:pokemouille/services/pokemons.service.dart';

class EvolutionChainWidget extends StatefulWidget {

  const EvolutionChainWidget({
    Key? key,
    required this.id,
    required this.url,
  }) : super(key: key);

  final int id;
  final String url;
  @override
  _EvolutionChainState createState() => _EvolutionChainState(id, url);
}


class _EvolutionChainState extends State<EvolutionChainWidget> {

  final int id;
  final String url;
  late EvolutionChain evolutionChain;

  _EvolutionChainState(this.id, this.url);

  Future<EvolutionChain> _fetchData() async {
      // get chain evolution 
      EvolutionChain evolutionChain = await getEvolutionChain(url);
      this.evolutionChain = evolutionChain;
      return evolutionChain;
  }

List<Widget> renderEvolutionChains(List<Widget> widgets , EvolutionChain currentEvolutionChain ) {

    if(currentEvolutionChain.evolveTo.isNotEmpty){
      for(int index = 0; index < currentEvolutionChain.evolveTo.length; index ++){
              widgets.add(EvolutionRowWidget(currentEvolutionChain: currentEvolutionChain, index : index));
              renderEvolutionChains(widgets,currentEvolutionChain.evolveTo[index]);
      }
    }
  return widgets;
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
              width: size.width,
              child: Column(
                children: [
                  // Container(
                  //   padding: EdgeInsets.symmetric(
                  //     vertical: kDefaultPadding
                  //   ),
                  //   child: RichText(
                  //             textAlign: TextAlign.start,
                  //             text: TextSpan(
                  //             children: [
                  //               TextSpan(
                  //                 text: "Chaine d'évolution",
                  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)
                  //               )
                  //             ]
                  //   ) ),
                  // ),
                  Container(child: Column(
                    children: renderEvolutionChains([], evolutionChain)
                  ),)
                ],

                )
          ));
        }
      });
}}