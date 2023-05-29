import 'package:flutter/material.dart';

class JoinGamePage extends StatefulWidget {
  @override
  _JoinGamePageState createState() => _JoinGamePageState();
}

class _JoinGamePageState extends State<JoinGamePage> {
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _joinGame() {
    // Récupérer la valeur du mot de passe entré
    String password = _passwordController.text;

    // Vérifier si le mot de passe est correct
    bool isPasswordCorrect = checkPassword(password); // Fonction à implémenter pour vérifier le mot de passe

    if (isPasswordCorrect) {
      // Le mot de passe est correct, permettre au joueur de rejoindre le jeu
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Succès'),
            content: Text('Vous avez rejoint le jeu avec succès.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  // Fermer la boîte de dialogue et retourner à la page d'accueil
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Le mot de passe est incorrect, afficher un message d'erreur
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Le mot de passe est incorrect. Veuillez réessayer.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  // Fermer la boîte de dialogue
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  bool checkPassword(String password) {
    // Fonction à implémenter pour vérifier le mot de passe
    // Comparer le mot de passe entré avec celui du jeu en cours
    String correctPassword = 'monMotDePasse'; // Remplacez par le mot de passe réel du jeu
    return password == correctPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rejoindre le jeu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Mot de passe du jeu',
              ),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _joinGame,
              child: Text('Rejoindre le jeu'),
            ),
          ],
        ),
      ),
    );
  }
}
