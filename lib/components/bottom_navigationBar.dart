import 'package:flutter/material.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<BottomNavBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        selectedItemColor: Color.fromARGB(255, 210, 25, 25),
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Mon pokemon du jour",
            icon: Icon(Icons.catching_pokemon),

          ),
          BottomNavigationBarItem(
            label: "Pokedex",
            icon: Icon(Icons.search),
          ),
        ],
      );
  }
}
