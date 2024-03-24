

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PageJeu.dart';

class ChoisirNiveaux extends StatefulWidget {
  final String nomJoueur ;
  const ChoisirNiveaux({Key? key, required this.nomJoueur}) : super(key: key);
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageJeu(niveaux: 1, nomJoueur: widget.nomJoueur),
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
                    builder: (context) => PageJeu(niveaux: 2, nomJoueur: widget.nomJoueur),
                  ),
                );
              },
              child: const Text('Niveau 2'),
            ),
          ],
        ),
      ),
    );
  }
}
