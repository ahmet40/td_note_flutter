import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projet1/modele/database/historique_db.dart';
import 'package:projet1/modele/historique.dart';

class PageHistorique extends StatefulWidget {
  final int niveaux;
  const PageHistorique({Key? key, required this.niveaux}) : super(key: key);

  @override
  _PageHistoriqueState createState() => _PageHistoriqueState();
}

class _PageHistoriqueState extends State<PageHistorique> {
  late Future<List<Historique>> _historiqueFuture;

  @override
  void initState() {
    super.initState();
    _historiqueFuture = _chargerHistorique(widget.niveaux);

    _historiqueFuture.then((value) => print(value));
  }

  Future<List<Historique>> _chargerHistorique(int niveaux) async {
    log('Chargement de l\'historique');
    return HistoriqueBd().getHistoriqueByNiveau(niveaux);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique'),
      ),
      body: FutureBuilder<List<Historique>>(
        future: _historiqueFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erreur lors du chargement des données'),
            );
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(
              child: Text('Aucune donnée historique disponible'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final historique = snapshot.data![index];
                return ListTile(
                  title: Text('Joueur: ${historique.nomJoueur}'),
                  subtitle: Text(
                      'Nombre Mystère: ${historique.nombreMystere}, '
                      'Nombre Essai: ${historique.nombreEssai}, '
                      'Date: ${historique.date}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
