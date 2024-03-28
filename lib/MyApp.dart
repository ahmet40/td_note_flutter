import 'package:flutter/material.dart';
import 'package:projet1/page/ChoisirNiveaux.dart';
import 'package:projet1/page/PageAccueil.dart';
import 'package:projet1/page/PageReglement.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nombre mystere',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int numeroNavBarSelection = 0;

  @override
  void initState() {
    super.initState();
  }


  void _onItemTapped(int index) {
    setState(() {
      numeroNavBarSelection = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget pageSelectionnee;
    switch (numeroNavBarSelection) {
      case 0:
        pageSelectionnee = PageAccueil();
        break;
      case 1:
        pageSelectionnee = PageReglement();
        break;
      case 2:
        pageSelectionnee = ChoisirNiveaux(nomJoueur: "" ,nomPage: "PageHistorique");
        break;
      default:
        pageSelectionnee = PageAccueil();
    }
    return Scaffold(
      body: pageSelectionnee,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rule),
            label: 'Règlement',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historique',
          ),
        ],
        currentIndex: numeroNavBarSelection,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
