
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet1/page/PageAccueil.dart';
import 'package:projet1/page/PageReglement.dart';
import 'package:projet1/page/PageHistorique.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


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
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int numeroNavBarSelection=0;
  void _onItemTapped(int index) {
    setState(() {
      numeroNavBarSelection = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page_selectionner;
    switch (numeroNavBarSelection) {
      case 0:
        page_selectionner = PageAccueil();
        break;
      case 1:
        page_selectionner = PageReglement();
        break;
      case 2:
        page_selectionner = PageHistoique();
        break;
      default:
        page_selectionner = PageAccueil();
    }
    return Scaffold(
      body: page_selectionner,
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

