import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:projet1/modele/database/database.dart';
import 'package:projet1/modele/historique.dart';

class HistoriqueBd{
  final tableName='HISTORY';

  Future<int> createHistorique(Map<String, dynamic> historique) async {
    try {
      final db = await DatabaseService.instance.database;
      return await db.insert(tableName, historique);
    } catch (e) {
      log(e.toString());
      return -1;
    }
  }

  Future<void> insererUnHistorique(nombreMystere, nombreEssai, nomJoueur, niveau) async {
    try {
      final db = await DatabaseService.instance.database;
      await db.rawInsert('''
        INSERT INTO $tableName(nomJoueur, niveau, nombreMystere, nombreEssai, date) VALUES('$nomJoueur', $niveau, $nombreMystere, $nombreEssai, '${DateTime.now()}')
      ''');
    } catch (e) {
      log(e.toString());
    }
  }
  // recuperer une liste d'historique de tous l'historique de la base de données
  Future<List<Historique>> getHistorique() async {
    try {
      final db = await DatabaseService.instance.database;
      final historique = await db.rawQuery('SELECT * FROM $tableName');
      return historique.map((data) => Historique.fromSqfliteDatabase(data)).toList();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

// recuperer une liste d'historique par rapport au niveau
  Future<List<Historique>> getHistoriqueByNiveau(int niveau) async {
    try {
      final db = await DatabaseService.instance.database;
      final historique = await db.rawQuery('SELECT * FROM $tableName WHERE niveau = $niveau ORDER BY nombreEssai DESC');
      return historique.map((data) => Historique.fromSqfliteDatabase(data)).toList();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<void> insereUnTest() async {

    try{
      final db = await DatabaseService.instance.database;
      await db.rawInsert('''INSERT INTO HISTORY(nomJoueur, niveau, nombreMystere, nombreEssai, date) VALUES('test', 1, 1, 1, '2021-10-10')''');
      log('insertion Historique reussie');
    }catch(e){
      log(e.toString());
    }


    }
}