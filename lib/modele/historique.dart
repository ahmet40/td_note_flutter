class Historique{
  final String nomJoueur;
  final int niveau;
  final int nombreMystere;
  final int nombreEssai;
  final String date;

  Historique({required this.nomJoueur, required this.niveau, required this.nombreMystere, required this.nombreEssai, required this.date});

  factory Historique.fromSqfliteDatabase(Map<String, dynamic> data) => Historique(
    nomJoueur: data['nomJoueur'],
    niveau: data['niveau'],
    nombreMystere: data['nombreMystere'],
    nombreEssai: data['nombreEssai'],
    date: data['date']
  );

}