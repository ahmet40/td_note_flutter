import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet1/page/IndiquerSonNom.dart';

class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nombre mystère'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('image/nombre_magique_courbe.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bienvenue au jeu du nombre mystère',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IndiquerSonNom()),
                );
            },
              child: const Text('Jouer'),
            ),
          ],
        ),
      ),
    );
  }
}
