import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet1/page/ChoisirNiveaux.dart';

class IndiquerSonNom extends StatelessWidget {
  const IndiquerSonNom({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nomController = TextEditingController(); // Contrôleur pour récupérer le nom entré

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Indiquez votre nom',
            ),
            TextField(
              controller: nomController, // Utilisation du contrôleur pour récupérer le nom
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nom',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Récupérer le nom entré
                String nomJoueur = nomController.text;

                // Vérifier si le nom est non vide avant de passer à la page suivante
                if (nomJoueur.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChoisirNiveaux(nomJoueur: nomJoueur)),
                  );
                } else {
                  // Afficher un message d'erreur si le champ est vide
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Veuillez indiquer votre nom.')),
                  );
                }
              },
              child: const Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
