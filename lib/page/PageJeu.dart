import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet1/modele/database/database.dart';

import '../modele/database/historique_db.dart';
import 'PageAccueil.dart';

class PageJeu extends StatefulWidget {
  final int niveaux;
  final String nomJoueur;
  const PageJeu({Key? key, required this.niveaux, required this.nomJoueur }) : super(key: key);


  @override
  _PageJeuState createState() => _PageJeuState();
}


class _PageJeuState extends State<PageJeu> {
  final historiqueBd = HistoriqueBd();
  late int nombreMystere;
  late bool fini;
  late int nombreEssai;
  late String message;
  late TextEditingController controller;
  List<List<dynamic>> listeNombreEntree = [];

  @override
  void initState() {
    super.initState();
    if (widget.niveaux == 1) {
      nombreMystere = Random().nextInt(100) + 1;
      message = 'Entrez un nombre entre 0 et 100';
    } else {
      nombreMystere = Random().nextInt(1000) + 1;
      message='Entrez un nombre entre 0 et 1000';
    }
    nombreEssai = 10;
    fini = false;
    controller = TextEditingController();
  }

  void verifierNombre(int nombre) {
    setState(() {
      if (listeNombreEntree.any((entry) => entry[0] == nombre)) {
        message = 'Vous avez déjà entré ce nombre';
      }
      else {
        nombreEssai--;
        if (nombre==nombreMystere){
          message = 'Bravo, vous avez trouvé en ${10 - nombreEssai} essais';
          fini = true;
          // insertions dans la base de données
          historiqueBd.createHistorique({
            'nomJoueur': widget.nomJoueur,
            'niveau': widget.niveaux,
            'nombreMystere': nombreMystere,
            'nombreEssai': 10 - nombreEssai,
            // on supprimer l'heure, la minute et la seconde
            'date': DateTime.now().toString().substring(0, 16),
          });
        }
        else{
          if (nombreEssai == 0) {
            message = 'Vous avez perdu. Le nombre mystère était $nombreMystere';
            fini = true;
          }
          else if (nombre < nombreMystere) {
            message = 'Le nombre à trouver est plus grand, il vous reste $nombreEssai essais';
          }
          else if (nombre > nombreMystere) {
            message = 'Le nombre à trouver est plus petit, il vous reste $nombreEssai essais';
          }
        }
        listeNombreEntree.add([nombre, message]);
      }
    });
  }

  void rejouer() {
    setState(() {
      nombreMystere = Random().nextInt(100) + 1;
      nombreEssai = 10;
      message = 'Entrez un nombre entre 0 et 100';
      fini = false;
      controller.clear();
      listeNombreEntree.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenu ${widget.nomJoueur} au jeu du nombre mystère niveau ${widget.niveaux}')

      ),
      body: Padding(

        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nombre compris entre 0 et ${widget.niveaux == 1 ? 100 : 1000}'
            ),
            Text(
              message,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Entrez un nombre',
                border: OutlineInputBorder(),
              ),
              enabled: !fini,
            ),
            const SizedBox(height: 20),
            if (!fini)
              ElevatedButton(

                onPressed: () {
                  int? nombre = int.tryParse(controller.text);
                  if (nombre != null) {
                    // clear the text field
                    controller.clear();
                    verifierNombre(nombre);
                  } else {
                    setState(() {
                      message = 'Veuillez entrer un nombre valide';
                    });
                  }
                },
                child: const Text('Vérifier'),

              ),

            const SizedBox(height: 20),
            if (fini)
            // Affichage du bouton rejouer
              ElevatedButton(
                onPressed: rejouer,
                child: const Text('Rejouer'),
              ),
              // supprime le bouton verifie


              if (listeNombreEntree.isNotEmpty)
// Affichage de l'historique des entrées
    Expanded(
    child: ListView(
    children: listeNombreEntree.reversed.map((entry) {
    return ListTile(
    title: Text('Nombre: ${entry[0]}'),
    subtitle: Text(entry[1]),
    );
    }).toList(),
    ),
    )
    ],
    ),
    ),
    );
  }
}
