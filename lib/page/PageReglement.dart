import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageReglement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Règlement'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Règles du jeu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              Text(
                'But du jeu : Le but du jeu est de deviner le nombre magique choisi par l’ordinateur.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Avant le jeu :\n'
                    'L’ordinateur est le "détenteur du nombre magique". Il choisit un nombre magique dans une certaine plage. Le nombre magique est choisi entre 1 et 100 avec 10 tentatives pour le niveau 1 et  entre 1 et 1000 avec 10 tentatives pour le niveau 2.\n'
                    'Le joueur doit donc commencer par indiquer son nom puis sélectionner le niveau pour commencer le jeu.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              Text(
                'Déroulement du jeu :\n'
                    'Le joueur indique un nombre dans la plage donnée.\n'
                    'L’ordinateur indique si le nombre entré par le joueur est supérieur ou inférieur au nombre à trouver et l’enregistre dans la zone de l’historique qui est affichée durant le jeu.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              Text(
                'Fin du jeu :\n'
                    'Le jeu se termine lorsque le joueur trouve le nombre magique ou que le nombre de tentatives est fini.',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
