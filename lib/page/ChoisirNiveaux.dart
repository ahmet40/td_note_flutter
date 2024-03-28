import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PageJeu.dart';
import 'PageHistorique.dart'; // Import de la page historique

class ChoisirNiveaux extends StatefulWidget {
  final String nomJoueur;
  final String nomPage;
  const ChoisirNiveaux({Key? key, required this.nomJoueur, required this.nomPage}) : super(key: key);

  @override
  _ChoisirNiveauxState createState() => _ChoisirNiveauxState();
}

class _ChoisirNiveauxState extends State<ChoisirNiveaux> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisir un niveau'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          if (widget.nomPage == 'PageJeu')
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageJeu(nomJoueur: widget.nomJoueur, niveaux: 1),
                      ),
                    );
                  },
                  child: const Text('Niveau 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageJeu(nomJoueur: widget.nomJoueur, niveaux: 2),
                    ),
                  );
                  },
                  child: const Text('Niveau 2'),
                ),
                ],
            ),
          if (widget.nomPage == 'PageHistorique')
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageHistorique(niveaux: 1),
                      ),
                    );
                  },
                  child: const Text('Niveau 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageHistorique( niveaux: 2),
                    ),
                  );
                  },
                  child: const Text('Niveau 2'),
                ),
                ],
            ),
          ],
          ),
      ),
    );
  }
}