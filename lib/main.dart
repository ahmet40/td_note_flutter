import 'package:flutter/material.dart';
import 'MyApp.dart';
import 'modele/database/database.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  DatabaseService.instance.database;

  runApp(MyApp());
}
