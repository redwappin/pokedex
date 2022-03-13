import 'package:flutter/material.dart';
import 'package:pokemouille/constants.dart';
import 'package:pokemouille/details/components/detailsTabsComponents/description.dart';
import 'package:pokemouille/details/components/detailsTabsComponents/evolutionChain.dart';
import 'package:pokemouille/models/EvolutionChain.model.dart';
import 'package:pokemouille/models/Pokemon.model.dart';

import 'detailsTabsComponents/baseStats.dart';

class DetailsTabs extends StatefulWidget {
  const DetailsTabs({Key? key, required this.pokemonColor, required this.pokemonModel}) : super(key: key);
  final Color pokemonColor;
  final PokemonModel pokemonModel;
  @override
  _DetailsTabState createState() => _DetailsTabState(pokemonColor: pokemonColor, pokemonModel: pokemonModel);
}


class _DetailsTabState extends State<DetailsTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Color pokemonColor;
  final PokemonModel pokemonModel;
  _DetailsTabState({required this.pokemonColor, required this.pokemonModel});

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
       Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              child: TabBar(
                indicatorColor: pokemonColor,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'A propos',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Stats de base',
                  ),
                  Tab(
                    text: 'Evolutions',
                  )
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // first tab bar view widget 
                    PokemonDescriptionWidget(pokemonModel: pokemonModel),

                    // second tab bar view widget
                    BaseStats(name: pokemonModel.name),
                    
                    Container(
                      width: size.width,
                      child: EvolutionChainWidget(id: pokemonModel.id, url: pokemonModel.evolutionChainUrl),
                    ),
                  ],
                ),)
            ),
          ],
        ),
    );
  }
    }